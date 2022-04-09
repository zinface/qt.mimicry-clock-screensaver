<h1 style="text-align:center">屏幕保护程序 - 开发指南</h1>

> 此程序拥有可变种构建结构，可直接基于此程序修改资源进行构建自定义屏保

## 自定义规则

- 资源需求
    - 资源文件: html/css/js 等
- 屏保缩略图
    - 提供 `480x300`,`320x200`,`160x100` 的图片

## 构建过程

- 资源替换
    - 替换 `resources/assets` 下的文件
- 屏保缩略图
    - *前缀名称要求与项目名称同名*
    - 替换 `rootfs/usr/lib/deepin-screensaver/modules/cover` 下的图片
- 修改 CMakeLists.txt
    - 修改 `CMakeLists.txt` 中的项目名称
    - 修改 `APP_NAME` 变量名(可无需修改)
- 打包配置 `cmake/package-deb.descript`
    - 修改此文件中的软件包名称，其它部分可自行修改
- 一键构建打包
    - `mkdir build; cd build; `
    - `cmake .. -DCMAKE_BUILD_TYPE=Release; make package;`