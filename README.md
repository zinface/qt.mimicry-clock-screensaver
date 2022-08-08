# qt.mimicry-clock-screensaver 

> 适用于深度操作系统的屏保拟态时钟程序 - [基于此屏幕保护程序 - 开发指南](development.md)

## 屏保演示

* 在配置好屏幕保护设置后，执行 `deepin-screensaver` 即可立即预览屏保效果\
    ![](resources/screenshot/black-background.gif)

## 构建说明

- 执行以下命令进行构建或运行与打包
    ```sh
    $ make         # 将构建 Debug 模式的应用程序，适合在 Debug 模式运行
    $ make run     # 将自动构建 Debug 模式的应用程序，并运行
    $ make package # 将自动构建 Release 模式的应用程序，并打包为 deb
    # 以上所产生的文件均在 build 目录下，build 目录已加入 .gitignore
    ```

## 定制说明

此程序可基于更改部分代码而达到不同的效果。

1. 取消注释 `assets/style.css` 的 19 行和 30 行，你将获得一个彩色背景样式图\
    ![](resources/screenshot/color-background.gif)

2. 通过代码部分修改你将得到各种自定义的效果，你或许可以配置在线主页为屏保 (效果图)
    ```c
    // 例如: 可定制成以 '中国台风网' 页面作为屏保
    // view->page()->load(QUrl("http://typhoon.nmc.cn/web.html")); 
    ```
    ![](resources/screenshot/typhoon.nmc.cn.png)