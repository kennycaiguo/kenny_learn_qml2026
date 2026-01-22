cmake_minimum_required(VERSION 3.16)

project(cameraDemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appcameraDemo
    main.cpp
)

qt_add_qml_module(appcameraDemo
    URI cameraDemo
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES CameraDemo.qml
        QML_FILES Button.qml
        QML_FILES SimpleCam.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcameraDemo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcameraDemo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcameraDemo
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcameraDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
