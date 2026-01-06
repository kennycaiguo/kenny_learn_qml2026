# kenny_learn_qml2026
学习qt6qml编程

## qt6 的qml和qt5有很多不同，首先，qt6优先使用CMake来编译项目。其次，项目结构不一样，qt5项目默认创建一个qrc文件，qml文件是作为资源来处理的，qt6默认没有qrc文件，qml文件是作为源码来处理的，不是资源。还有，
## qt6如果需要使用图片等等资源，需要手动创建一个qrc文件，然后把资源导入到qrc的/中。然后还需要在CMakeLists.txt文件里面添加一个配置：set(CMAKE_AUTORCC ON),否则找不到资源
