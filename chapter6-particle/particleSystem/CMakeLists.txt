cmake_minimum_required(VERSION 3.16)

project(particleSystem VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appparticleSystem
    main.cpp
)

qt_add_qml_module(appparticleSystem
    URI particleSystem
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES SimpleParticle.qml
        RESOURCES res.qrc
        QML_FILES Tracer.qml
        QML_FILES RotationvariationParticle.qml
        QML_FILES AngleDirectionParticle.qml
        QML_FILES AngleDirectionParticle2.qml
        QML_FILES PointDirectionParticle.qml
        QML_FILES TargetDirectionParticle.qml
        QML_FILES ItemParticle.qml
        QML_FILES ItemParticle3.qml
        QML_FILES ItemParticle2.qml
        QML_FILES AgeDemo.qml
        QML_FILES AttractorDemo.qml
        QML_FILES FrictionDemo.qml
        QML_FILES GravityDemo1.qml GravityDemo2.qml
        QML_FILES TurbulenceDemo.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appparticleSystem PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appparticleSystem
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appparticleSystem
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appparticleSystem
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
