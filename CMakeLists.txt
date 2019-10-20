cmake_minimum_required(VERSION 3.5)
project(HELLO VERSION 0.0.0 LANGUAGES C CXX)

######################## Global CMake Flags Here #####################
SET(DEBUG TRUE)
SET(RELEASE FALSE)

SET(CMAKE_C_COMPILER gcc)
SET(CMAKE_C_FLAGS "-Wall -std=c99")
SET(CMAKE_CXX_COMPILER g++)
SET(CMAKE_CXX_FLAGS "-Wall -std=c++14")
######################################################################

######################## Path Settings ###############################
SET(CMAKE_INSTALL_PREFIX "/usr/local")
SET(CMAKE_MODULE_PATH "cmake")
######################################################################

######################## Compiler Flags Settings #####################
FIND_PROGRAM(_CHECK_C_COMPILER ${CMAKE_C_COMPILER})
IF (NOT _CHECK_C_COMPILER)
    MESSAGE(FATAL_ERROR
            "Compiler <${CMAKE_C_COMPILER}> could not be found.")
ELSE ()
    SET (CMAKE_C_COMPILER ${_CHECK_C_COMPILER})
ENDIF ()
MESSAGE(">>> Using <${CMAKE_C_COMPILER}> as C Compiler.")
IF (${DEBUG} AND ${RELEASE})
    MESSAGE(FATAL_ERROR "Flag DEBUG & RELEASE could not be both TRUE.")
ELSEIF (${DEBUG} AND NOT ${RELEASE})
    STRING(APPEND CMAKE_C_FLAGS " ${CMAKE_C_FLAGS_DEBUG}")
ELSEIF (NOT ${DEBUG} AND ${RELEASE})
    STRING(APPEND CMAKE_C_FLAGS " ${CMAKE_C_FLAGS_RELEASE}")
ENDIF ()

FIND_PROGRAM(_CHECK_CXX_COMPILER ${CMAKE_CXX_COMPILER})
IF (NOT _CHECK_CXX_COMPILER)
    MESSAGE(FATAL_ERROR
            "Compiler <${CMAKE_CXX_COMPILER}> could not be found.")
ELSE ()
    SET (CMAKE_CXX_COMPILER ${_CHECK_CXX_COMPILER})
ENDIF ()
MESSAGE(">>> Using <${CMAKE_CXX_COMPILER}> as CXX Compiler.")
IF (${DEBUG} AND ${RELEASE})
    MESSAGE(FATAL_ERROR "Flag DEBUG & RELEASE could not be both TRUE.")
ELSEIF (${DEBUG} AND NOT ${RELEASE})
    STRING(APPEND CMAKE_CXX_FLAGS " ${CMAKE_CXX_FLAGS_DEBUG}")
ELSEIF (NOT ${DEBUG} AND ${RELEASE})
    STRING(APPEND CMAKE_CXX_FLAGS " ${CMAKE_CXX_FLAGS_RELEASE}")
ENDIF ()
######################################################################

######################## Building Dependanies Settings ###############
# Add some packages you need here
FIND_PACKAGE(Doxygen REQUIRED)
FIND_PACKAGE(PkgConfig REQUIRED)
######################################################################

######################## Running Dependanies Settings ################
######################################################################

ADD_SUBDIRECTORY("src/")

INCLUDE(CTest)
ADD_SUBDIRECTORY("tests/")
