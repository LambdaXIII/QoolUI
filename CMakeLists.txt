cmake_minimum_required(VERSION 3.15)

project(QoolUIBundle)


list(APPEND QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/src")
list(APPEND QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/exampleapp")
list(REMOVE_DUPLICATES QML_IMPORT_PATH)
set(QML_IMPORT_PATH ${QML_IMPORT_PATH} CACHE STRING "Creator qml path" FORCE)

add_subdirectory(src EXCLUDE_FROM_ALL)
add_subdirectory(exampleapp EXCLUDE_FROM_ALL)
