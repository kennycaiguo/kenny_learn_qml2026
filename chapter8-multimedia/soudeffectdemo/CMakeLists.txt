cmake_minimum_required(VERSION 3.16)

project(soudeffectdemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appsoudeffectdemo
    main.cpp
)

qt_add_qml_module(appsoudeffectdemo
    URI soudeffectdemo
    QML_FILES
        Main.qml
        QML_FILES BasicSoundEffectDemo.qml
        RESOURCES res.qrc
        QML_FILES SoundEffectWithControls.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsoudeffectdemo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appsoudeffectdemo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsoudeffectdemo
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appsoudeffectdemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
