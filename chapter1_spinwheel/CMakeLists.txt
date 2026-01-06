cmake_minimum_required(VERSION 3.16)

project(chapter1_spinwheel VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appchapter1_spinwheel
    main.cpp
)

qt_add_qml_module(appchapter1_spinwheel
    URI chapter1_spinwheel
    QML_FILES
        Main.qml
        RESOURCES res.qrc
        QML_FILES SpinWheel.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appchapter1_spinwheel PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appchapter1_spinwheel
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appchapter1_spinwheel
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appchapter1_spinwheel
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
