cmake_minimum_required(VERSION 3.0)

project(HELLO C CXX)

set(output_path_libs ${PROJECT_NAME}/lib)
set(output_path_test ${PROJECT_NAME}/test)
set(output_path_bin  ${PROJECT_NAME}/bin)

include(cmake/cxx_func.cmake)

find_package(PkgConfig REQUIRED)

set(sub_lib hello)
Add_CXX_Sub_Library(${sub_lib} ${output_path_libs} ""
    "src/*.c" "./include;/usr/include" "" "")

set(debug_opts "-g")
Compile_CXX_Unit_Tests("tests/*.c" ${output_path_test}
    "${sub_lib}_static" "./include" "" "${debug_opts}")
