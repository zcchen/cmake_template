MESSAGE("PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/include")

#add_executable("hello" hello.c)
add_library(hello SHARED hello.c)
set_target_properties(hello
    PROPERTIES
    PUBLIC_HEADER "../include/hello.h"
    )

install(TARGETS hello
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static
        PUBLIC_HEADER DESTINATION include
        )
