#include <stdio.h>
#define YELLOW "\x1b[0;33m"
#define RED "\x1b[0;31m"
#define CYAN "\x1b[0;36m"
#define PINK "\x1b[0;35m"
#define WHITE "\x1b[0;37m"
#define RESET "\x1b[0m"


int main() {
    printf("%s  ▄███████▄                    %s  ▄██████▄      %s  ▄██████▄      %s  ▄██████▄\n", YELLOW, RED, CYAN, PINK);
    printf("%s▄█████████▀▀                   %s▄%s█▀█%s██%s█▀█%s██▄    %s▄%s█▀█%s██%s█▀█%s██▄    %s▄%s█▀█%s██%s█▀█%s██▄\n", YELLOW, RED, WHITE, RED, WHITE, RED, CYAN, WHITE, CYAN, WHITE, CYAN, PINK, WHITE, PINK, WHITE, PINK);
    printf("%s███████▀       %s▄██▄    ▄██▄    %s█%s▄▄█%s██%s▄▄█%s███    %s█%s▄▄█%s██%s▄▄█%s███    %s█%s▄▄█%s██%s▄▄█%s███\n", YELLOW, WHITE, RED, WHITE, RED, WHITE, RED, CYAN, WHITE, CYAN, WHITE, CYAN, PINK, WHITE, PINK, WHITE, PINK);
    printf("%s███████▄       %s▀██▀    ▀██▀    %s████████████    %s████████████    %s████████████\n", YELLOW, WHITE, RED, CYAN, PINK);
    printf("%s▀█████████▄▄                   %s██▀██▀▀██▀██    %s██▀██▀▀██▀██    %s██▀██▀▀██▀██\n", YELLOW, RED, CYAN, PINK);
    printf("%s  ▀███████▀                    %s▀   ▀  ▀   ▀    %s▀   ▀  ▀   ▀    %s▀   ▀  ▀   ▀%s\n", YELLOW, RED, CYAN, PINK, RESET);
    return 0;
}
