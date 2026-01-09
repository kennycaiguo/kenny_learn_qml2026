cmake_minimum_required(VERSION 3.16)

project(sectionedListView VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appsectionedListView
    main.cpp
)

qt_add_qml_module(appsectionedListView
    URI sectionedListView
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES SectionedListView.qml
        QML_FILES Background.qml
        QML_FILES BlueBox.qml
        QML_FILES Box.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsectionedListView PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appsectionedListView
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsectionedListView
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appsectionedListView
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
