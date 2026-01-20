import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Rectangle {
        anchors.fill: parent
    }

    Image {
        id: butterfly
        source: "qrc:/assets/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    DropShadow {
        anchors.fill: butterfly
        color: "#DDDDDD"
        radius:9
        samples: 15
        horizontalOffset:3
        verticalOffset: 5
        spread: 0
        source: butterfly
    }
}

