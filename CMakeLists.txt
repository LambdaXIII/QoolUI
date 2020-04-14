cmake_minimum_required(VERSION 3.15)

list(APPEND QML_DIRS "${QML_IMPORT_PATH}")
list(APPEND QML_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/src")
list(APPEND QML_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/exampleapp")
set(QML_IMPORT_PATH ${QML_DIRS} CACHE STRING "Creator qml path" FORCE)

add_subdirectory(src EXCLUDE_FROM_ALL)
add_subdirectory(exampleapp EXCLUDE_FROM_ALL)
