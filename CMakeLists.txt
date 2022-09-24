
cmake_minimum_required(VERSION 3.5.1)

project(mimicry-clock-screensaver LANGUAGES CXX VERSION 0.0.1)

include(cmake/SparkEnvConfig.cmake)
include(cmake/SparkMacrosConfig.cmake)
include(cmake/SparkFindLibraries.cmake)
include(cmake/SparkFindQt5Config.cmake)
include(cmake/SparkFindQt6Config.cmake)

# 资源文件路径
set(QRC_SOURCES "")

# 使用宏进行配置 config.h
# 将项目名定义为资源结构路径 /usr/share/ + 项目名 + /assets/index.html
set(APP_NAME "屏保拟态时钟")
configure_file(cmake/config.h.in config.h @ONLY)

# 构建程序主体, 依赖了 Qt5 核心库、WebEngineWidgets 库
spark_add_executable(${PROJECT_NAME} src ${QRC_SOURCES})
target_link_qt5(${PROJECT_NAME})
target_link_qt5_WebEngineWidgets(${PROJECT_NAME})

include(cmake/linux-install/linux-install.cmake)
include(cmake/SparkBuildGraphviz.cmake)