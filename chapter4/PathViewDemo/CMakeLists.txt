cmake_minimum_required(VERSION 3.16)

project(PathViewDemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appPathViewDemo
    main.cpp
)

qt_add_qml_module(appPathViewDemo
    URI PathViewDemo
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES PathViewDemo.qml
        QML_FILES Background.qml BlueBox.qml Box.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appPathViewDemo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appPathViewDemo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPathViewDemo
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPathViewDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
