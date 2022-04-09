
cmake_minimum_required(VERSION 3.5.1)

project(mimicry-clock-screensaver LANGUAGES CXX VERSION 0.0.1)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Widgets Network WebEngineWidgets Gui)

# 头文件目录
include_directories()

# 资源文件路径
set(QRC_SOURCES "")

# 使用宏进行配置 config.h
# 将项目名定义为资源结构路径 /usr/share/ + 项目名 + /assets/index.html
set(APP_NAME "屏保拟态时钟")
configure_file(cmake/config.h.in config.h @ONLY)

add_executable(${PROJECT_NAME} "main.cpp"
    # "mainwindow.cpp" "mainwindow.h"
    ${QRC_SOURCES}
)
target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Widgets Qt5::Network Qt::WebEngineWidgets Qt::Gui)

include(cmake/linux-install/linux-install.cmake)