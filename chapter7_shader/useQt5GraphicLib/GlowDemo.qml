import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Image {
        id: butterfly
        source: "qrc:/assets/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Glow {
        anchors.fill: butterfly
        source: butterfly
        radius: 7
        samples: 24
        spread: 0.4
        color: "gold"

    }
}

