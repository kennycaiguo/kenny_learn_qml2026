cmake_minimum_required(VERSION 3.16)

project(useQt5GraphicEffectsDemos VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON) #开启寻找资源功能，如果不开启，找不到图片资源
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 COMPONENTS Core5Compat REQUIRED)  # 开启寻找图片库功能

qt_add_executable(appuseQt5GraphicEffectsDemos
    main.cpp
)

qt_add_qml_module(appuseQt5GraphicEffectsDemos
    URI useQt5GraphicEffectsDemos
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES res.qrc
        QML_FILES FastBlurDemo.qml
        QML_FILES BrightnessContrast.qml
        QML_FILES Colorize.qml
        QML_FILES ColorOverlay.qml
        QML_FILES ConicalGradient.qml
        QML_FILES Desaturate.qml
        QML_FILES Displace.qml
        QML_FILES DisplaceDemo.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appuseQt5GraphicEffectsDemos PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuseQt5GraphicLib
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appuseQt5GraphicEffectsDemos
    PRIVATE Qt6::Quick
    PRIVATE  Qt6::Core5Compat # 把图片库的库文件链接进来
)

include(GNUInstallDirs)
install(TARGETS appuseQt5GraphicEffectsDemos
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
