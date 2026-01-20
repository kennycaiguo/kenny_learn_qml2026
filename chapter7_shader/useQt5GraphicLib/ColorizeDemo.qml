import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image {
        id: bug
        source: "qrc:/assets/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Colorize {
        anchors.fill: bug
        source: bug
        hue: 0.8
        saturation: 0.9
        lightness: 0
    }
}
