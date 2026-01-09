cmake_minimum_required(VERSION 3.16)

project(canvas_basic VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appcanvas_basic
    main.cpp
)

qt_add_qml_module(appcanvas_basic
    URI canvas_basic
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES CanvasDemo.qml
        QML_FILES LineDemo.qml
        QML_FILES ConvenienceDemo.qml
        QML_FILES GradientCanvasDemo.qml
        QML_FILES ShadowCanvasDemo.qml
        RESOURCES res.qrc
        QML_FILES ImageCanvasDemo.qml
        QML_FILES TransformCanvasDemo.qml
        QML_FILES CompositionCanvasDemo.qml
        QML_FILES CompositionOperationCanvasDemo.qml
        QML_FILES ImageDataCanvasDemo.qml
        QML_FILES ColorSquare.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcanvas_basic PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcanvas_basic
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcanvas_basic
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcanvas_basic
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
