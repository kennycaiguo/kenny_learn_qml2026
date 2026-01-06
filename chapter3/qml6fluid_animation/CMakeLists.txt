cmake_minimum_required(VERSION 3.16)

project(qml6fluid_animation VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appqml6fluid_animation
    main.cpp
)

qt_add_qml_module(appqml6fluid_animation
    URI qml6fluid_animation
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES res.qrc
        QML_FILES ImageAnim.qml
        RESOURCES
        QML_FILES ImageBtn.qml
        QML_FILES TestImageBtn.qml
        QML_FILES EasingCurvesDemo.qml
        QML_FILES DarkSquare.qml GreenSquare.qml
        QML_FILES ImageBtn2.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqml6fluid_animation PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqml6fluid_animation
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqml6fluid_animation
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appqml6fluid_animation
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
