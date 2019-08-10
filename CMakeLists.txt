cmake_minimum_required(VERSION 3.0)

project(HELLO)


function(Add_Sub_Library prj name src_files inc_path libs)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${prj}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${prj}/lib)
    file(GLOB_RECURSE src "${src_files}")

    add_library(${name}_shared SHARED ${src})
    target_include_directories(${name}_shared PUBLIC ${inc_path})
    target_link_libraries(${name}_shared ${libs})
    set_target_properties(${name}_shared PROPERTIES OUTPUT_NAME ${name})

    add_library(${name}_static STATIC ${src})
    target_include_directories(${name}_static PUBLIC ${inc_path})
    target_link_libraries(${name}_static ${libs})
    set_target_properties(${name}_static PROPERTIES OUTPUT_NAME ${name})
endfunction()

function(Add_Unit_Test prj name test_src inc_path libs)
    set(test_obj test_${name})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${prj}/tests)
    link_directories(${CMAKE_BINARY_DIR}/${prj}/lib)
    add_executable(${test_obj} ${test_src})
    target_include_directories(${test_obj} PUBLIC ${inc_path})
    target_link_libraries(${test_obj} ${libs})
    unset(test_obj)
endfunction()

function(Compile_All_Test prj test_files inc_path libs)
    file(GLOB_RECURSE test_src "${test_files}")
    foreach(src ${test_src})
        get_filename_component(name ${src} NAME_WE)
        Add_Unit_Test(${prj} ${name} ${src} ${inc_path} ${libs})
    endforeach(src)
endfunction()


Add_Sub_Library(hello hello "./src/*.c" "./include" "")
#Add_My_Test(hello hello ./tests/hello.c ./include hello)

Compile_All_Test(hello "./tests/*.c" "./include" "hello")
