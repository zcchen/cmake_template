#include <stdio.h>
#include <stdlib.h>
#include "hello.h"

int main(void)
{
    printf(">-- Hello with mem leaks ---\n");
    char *a = malloc(sizeof(char));
    hello();
    printf("----------------------------\n");
    return 0;
}
