import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image {
        id: bug
        source: "qrc:/assets/bug.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    HueSaturation {
        anchors.fill: bug
        source: bug
        hue: 0.15
        saturation: 0.25
        lightness: 0
    }
}
