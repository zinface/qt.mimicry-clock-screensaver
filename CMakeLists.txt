
cmake_minimum_required(VERSION 3.5.1)

include(cmake/SparkWithGit.cmake)
spark_include(SparkCMakeInfoBeforeConfig.cmake)

project(typhoon-view-screensaver LANGUAGES CXX VERSION 1.0.0)

spark_initialize_modules()

include(cmake/DeepinScreensaverConfig.cmake)

# 资源文件路径
set(QRC_SOURCES "")

# 使用宏进行配置 config.h
# 将项目名定义为资源结构路径 /usr/share/ + 项目名 + /assets/index.html
set(APP_NAME "中国台风网 - 预览版")
configure_file(cmake/config.h.in config.h @ONLY)

# 构建程序主体, 依赖了 Qt5 核心库、WebEngineWidgets 库
spark_add_executable_path(${PROJECT_NAME} 
    src
    ${QRC_SOURCES}
)
spark_add_links_qt5(WebEngineWidgets)
target_link_qt5_WebEngineWidgets(${PROJECT_NAME})

spark_framework_include_with_git(${PROJECT_NAME} 
    https://gitee.com/spark-framework-libs/spark-framework-features
    FEATURES version screenutil
)

install_deepin_screen_module(TARGETS ${PROJECT_NAME}) # install 指令的封装
add_deepin_screen_cover(resources/screenshot/typhoon.nmc.cn.png)

spark_include(SparkDebPackageConfig.cmake)
add_package_descript(cmake/package-deb.descript)