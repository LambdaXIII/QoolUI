cmake_minimum_required(VERSION 3.14)

set(CMAKE_CXX_STANDARD 17)
find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

project(QoolUI)

set(target_name "QoolUI")

#list(APPEND QML_IMPORT_PATH ${PROJECT_SOURCE_DIR})

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/qoolui_cpp BASE_SRCS)

add_library(${target_name} SHARED
    ${BASE_SRCS}
    qml_cool_stuff.qrc)

target_include_directories(${target_name}
    PUBLIC ${PROJECT_SOURCE_DIR})

target_compile_definitions(${target_name} PRIVATE DLL_EXPORT)

target_link_libraries(${target_name} Qt5::Core Qt5::Quick)

if(WIN32)
  target_compile_definitions(${target_name} PRIVATE OS_WIN)
endif(WIN32)

#list(APPEND QML_DIRS "${QML_IMPORT_PATH}")
#list(APPEND QML_DIRS "${PROJECT_SOURCE_DIR}")
#set(QML_IMPORT_PATH ${QML_DIRS} CACHE STRING "Creator qml path" FORCE)
