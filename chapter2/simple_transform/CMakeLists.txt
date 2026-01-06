cmake_minimum_required(VERSION 3.16)

project(simple_transform VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appsimple_transform
    main.cpp
)

qt_add_qml_module(appsimple_transform
    URI simple_transform
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES res.qrc
        QML_FILES ImageButton.qml
        QML_FILES SimpleTransformDemo.qml
        QML_FILES MyButton.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsimple_transform PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appsimple_transform
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsimple_transform
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appsimple_transform
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
