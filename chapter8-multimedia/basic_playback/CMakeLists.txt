cmake_minimum_required(VERSION 3.16)

project(basic_playback VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appbasic_playback
    main.cpp
)

qt_add_qml_module(appbasic_playback
    URI basic_playback
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES res.qrc
        QML_FILES SimplePlayer.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appbasic_playback PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appbasic_playback
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appbasic_playback
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appbasic_playback
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
