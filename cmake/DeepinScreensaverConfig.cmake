# /usr/lib/deepin-screensaver/modules/cover

macro(install_deepin_screen_cover FILE_PATH)
    install(FILES ${FILE_PATH} ${ARGN}
        DESTINATION /usr/lib/deepin-screensaver/modules/cover)
endmacro(install_deepin_screen_cover FILE_PATH)

macro(install_deepin_screen_module)
    install(${ARGN}
        DESTINATION /usr/lib/deepin-screensaver/modules)
endmacro(install_deepin_screen_module)

function(add_deepin_screen_corver _SOURCE_IMAGE)
    find_program(CONVERT_WITH_IMAGEMAGICK convert)
    if(CONVERT_WITH_IMAGEMAGICK)
        # 软件包 imagemagick 提供了 convert 命令
        # 160x100:
        # convert -resize 160x100 source.png mimicry-clock-screensaver.png
        # 320x200:
        # convert -resize 320x200 source.png mimicry-clock-screensaver@2x.png
        # 480x300:
        # convert -resize 480x300 source.png mimicry-clock-screensaver@3x.png
        execute_process(COMMAND convert -resize 160x100 ${_SOURCE_IMAGE} "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.png" 
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
        execute_process(COMMAND convert -resize 320x200 ${_SOURCE_IMAGE} "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}@2x.png" 
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
        execute_process(COMMAND convert -resize 480x300 ${_SOURCE_IMAGE} "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}@3x.png" 
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
        install_deepin_screen_cover(
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.png"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}@2x.png"
            "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}@3x.png"
        )
    endif(CONVERT_WITH_IMAGEMAGICK)
endfunction(add_deepin_screen_corver _SOURCE_IMAGE)


# 如果常量为1、ON、YES、True、Y或非零数字，则为True。
# 如果常量为0、OFF、NO、False、N、IGNORE、NOTFOUND、空字符串或以-NOTFOUND结尾，则为False。
# 命名布尔常量不区分大小写。
# 如果实参不是这些特定的常量之一，则将其视为变量或字符串(参见后面的变量展开)，并应用以下两种形式之一。

