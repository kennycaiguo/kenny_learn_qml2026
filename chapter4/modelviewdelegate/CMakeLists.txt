cmake_minimum_required(VERSION 3.16)

project(modelviewdelegate VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appmodelviewdelegate
    main.cpp
)

qt_add_qml_module(appmodelviewdelegate
    URI modelviewdelegate
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Demo1.qml
        QML_FILES Demo2.qml
        QML_FILES SunSystemDemo.qml
        QML_FILES Demo3.qml
        QML_FILES ListViewDemo.qml
        QML_FILES ListViewHorizontalDemo.qml
        QML_FILES HighlightListViewDemo.qml
        QML_FILES Background.qml BlueBox.qml Box.qml GreenBox.qml RedBox.qml YellowBox.qml
        QML_FILES CustomHighlightDemo.qml
        QML_FILES DelegateDemo.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appmodelviewdelegate PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmodelviewdelegate
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appmodelviewdelegate
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appmodelviewdelegate
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
