#include <stdio.h>

#include "hello.h"

int hello(void)
{
    printf("Hello CMake...\n");
    /** No Return on purpose.
     *  Thus, it could be test with the '-Wall' flag easily.
     */
}
