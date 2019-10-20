FUNCTION(Add_UnitTest_Basic name re_src)
    IF (NOT ARGN)
        MESSAGE(FATAL_ERROR
                "Usage: Add_UnitTest_Basic(name src_in_re libs)")
    ENDIF()
    SET(libs ${ARGN})
    INCLUDE_DIRECTORIES("${PROJECT_SOURCE_DIR}/include")

    FILE(GLOB_RECURSE src ${re_src})
    ADD_EXECUTABLE(test_${name} ${src})
    TARGET_LINK_LIBRARIES(test_${name} ${libs})
    ADD_TEST(NAME test_${name} COMMAND test_${name})
ENDFUNCTION()

FIND_PROGRAM(MEMORYCHECK_COMMAND valgrind )
SET(MEMORYCHECK_COMMAND_OPTIONS "--trace-children=yes --leak-check=full" )
SET(MEMORYCHECK_SUPPRESSIONS_FILE "${PROJECT_SOURCE_DIR}/valgrind_suppress.txt" )

Add_UnitTest_Basic(hello "./hello.c" hello)
Add_UnitTest_Basic(hello_again "./hello_again.c" hello)

