# _   _ ____       _________  _   _         _
# | \ | |  _ \     |__  / ___|| | | |  _ __ (_)_  __
# |  \| | | | |_____ / /\___ \| |_| | | '_ \| \ \/ /
# | |\  | |_| |_____/ /_ ___) |  _  |_| | | | |>  < 
# |_| \_|____/     /____|____/|_| |_(_)_| |_|_/_/\_\
#                                                   
# GIT: https://github.com/NewDawn0/zsh-cfg 
# LICENSE: MIT
#
# FILE: flake.nix
# DESC: NixPkgs flake decl
{
  description = "NewDawn0's ZSH config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in rec {
        dependencies = with pkgs; [
          bat
          btop
          bottom
          coreutils
          curl
          exa
          fd
          file
          figlet
          fzf
          git
          gnused
          less
          mdcat
          ripgrep
          starship
          zsh
          zsh-autocomplete
          zsh-autosuggestions
          zsh-syntax-highlighting
          zsh-autopair
          wget
          nodejs
          gnat
          nasm
          tmux
        ];

        packages.ndzsh = with pkgs;
          stdenv.mkDerivation rec {
            version = "1.0.0";
            name = "ndzsh";
            inherit system;
            src = self;
            buildInputs = [ zsh ] ++ dependencies;
            nativeBuildInputs = [ makeWrapper ];
            phases = [ "installPhase" ];

            installPhase = ''
              mkdir -p "$out/bin"
              mkdir -p "$out/config"
              gcc -o "$out/bin/pac" "${src}/src/pac.c"
              export zsh_autosuggestions="${pkgs.zsh-autosuggestions}"
              export zsh_autocomplete="${pkgs.zsh-autocomplete}"
              export zsh_autopair="${pkgs.zsh-autopair}"
              export zsh_syntax_highlighting="${pkgs.zsh-syntax-highlighting}"
              export fzf="${pkgs.fzf}"
              export starship="${pkgs.starship}"
              export zsh_autopair="${pkgs.zsh-autopair}"
              export STARSHIP_CONFIG="${./config/starship.toml}"
              substituteAll $src/config/zshrc $out/config/.zshrc
              makeWrapper "${zsh}/bin/zsh" "$out/bin/ndzsh" --set SHELL_SESSIONS_DISABLE 1 --set ZDOTDIR "$out/config" --prefix PATH : "$out/bin:"${
                pkgs.lib.makeBinPath dependencies
              }
            '';
          };
        apps.ndzsh = flake-utils.lib.mkApp {
          drv = packages.ndzsh;
          name = "ndzsh";
          exePath = "/bin/ndzsh";
        };

        packages.default = packages.ndzsh;
        apps.default = apps.ndzsh;
      });
}
