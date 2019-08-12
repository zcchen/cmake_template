function(Add_CXX_Sub_Library name output_path deps
         src_files inc_path libs options)
    set(name_static ${name}_static)
    set(name_shared ${name}_shared)
    set(src)
    foreach(s IN ITEMS ${src_files})
        file(GLOB_RECURSE _s ${s})
        list(APPEND src ${_s})
    endforeach(s)

    add_library(${name_shared} SHARED ${src})
    foreach(dep IN ITEMS ${deps})
        add_dependencies(${name_shared} ${dep})
    endforeach(dep)
    foreach(inc IN ITEMS ${inc_path})
        target_include_directories(${name_shared} PUBLIC ${inc})
    endforeach(inc)
    foreach(lib IN ITEMS ${libs})
        target_link_libraries(${name_shared} ${lib})
    endforeach(lib)
    set_target_properties(${name_shared}
        PROPERTIES
        OUTPUT_NAME ${name}
        LIBRARY_OUTPUT_DIRECTORY ${output_path}
        )
    target_compile_options(${name_shared} PUBLIC ${options})

    add_library(${name_static} STATIC ${src})
    foreach(dep IN ITEMS ${deps})
        add_dependencies(${name_static} ${dep})
    endforeach(dep)
    foreach(inc IN ITEMS ${inc_path})
        target_include_directories(${name_static} PUBLIC ${inc})
    endforeach(inc)
    foreach(lib IN ITEMS ${libs})
        target_link_libraries(${name_static} ${lib})
    endforeach(lib)
    set_target_properties(${name_static}
        PROPERTIES OUTPUT_NAME ${name}
        ARCHIVE_OUTPUT_DIRECTORY ${output_path}
        )
    target_compile_options(${name_static} PUBLIC ${options})
endfunction()

function(Add_CXX_Unit_Test name output_path deps
         test_src inc_path libs options)
    set(test_obj test_${name})

    add_executable(${test_obj} ${test_src})
        # only 1 main() in one test.c
    foreach(dep IN ITEMS ${deps})
        target_link_libraries(${test_obj} PRIVATE ${dep})
    endforeach(dep)
    foreach(inc IN ITEMS ${inc_path})
        target_include_directories(${test_obj} PUBLIC ${inc})
    endforeach(inc)
    foreach(lib IN ITEMS ${libs})
        target_link_libraries(${test_obj} PUBLIC ${libs})
    endforeach(lib)
    target_compile_options(${test_obj} PUBLIC ${options})
    set_target_properties(${test_obj}
        PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${output_path})
endfunction()

function(Compile_CXX_Unit_Tests test_files output_path
         deps inc_path libs options)
    file(GLOB_RECURSE test_src "${test_files}")
    foreach(src ${test_src})
        get_filename_component(name ${src} NAME_WE)
        Add_CXX_Unit_Test("${name}" "${output_path}" "${deps}"
                        "${src}" "${inc_path}" "${libs}"
                        "${options}")
    endforeach(src)
endfunction()

