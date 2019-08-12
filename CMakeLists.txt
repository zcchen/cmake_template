cmake_minimum_required(VERSION 3.0)

project(HELLO)

set(output_path_libs ${PROJECT_NAME}/lib)
set(output_path_test ${PROJECT_NAME}/test)
set(output_path_bin  ${PROJECT_NAME}/bin)

include(cmake/cxx_func.cmake)

set(sub_lib hello)
Add_CXX_Sub_Library(${sub_lib} "src/*.c" "./include" "")

Compile_CXX_Test("tests/*.c" "./include" "${sub_lib}_static" "${sub_lib}")
