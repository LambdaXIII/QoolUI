cmake_minimum_required(VERSION 3.15)

project(QoolUIExampleApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt5 COMPONENTS Core Quick REQUIRED)

add_executable(QoolUIExampleApp
  main.cpp
  qml.qrc
)

list(APPEND QML_IMPORT_PATH ${PROJECT_SOURCE_DIR})

target_compile_definitions(QoolUIExampleApp
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(QoolUIExampleApp
  QoolUI
  Qt5::Core Qt5::Quick)
