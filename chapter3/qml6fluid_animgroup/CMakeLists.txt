cmake_minimum_required(VERSION 3.16)

project(qml6fluid_animgroup VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appqml6fluid_animgroup
    main.cpp
)

qt_add_qml_module(appqml6fluid_animgroup
    URI qml6fluid_animgroup
    QML_FILES
        Main.qml
        RESOURCES res.qrc
        QML_FILES ParallelAnimationDemo.qml
        QML_FILES ImageBtn.qml
        QML_FILES SequentialAnimationDemo.qml
        QML_FILES BouncingBallAnim.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqml6fluid_animgroup PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqml6fluid_animation_group
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqml6fluid_animgroup
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appqml6fluid_animgroup
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
