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

    GaussianBlur {
        anchors.fill: bug
        source: bug
        radius: 4
        samples: 16
        transparentBorder: true
        deviation:2
    }
}

