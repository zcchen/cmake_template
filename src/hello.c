#include <stdio.h>

#include "hello.h"

int hello(void)
{
    printf("Hello CMake...\n");
    return void;
    /** Returning with void on purpose.
     *  Thus, it could be test with the '-Wall' flag easily.
     */
}
