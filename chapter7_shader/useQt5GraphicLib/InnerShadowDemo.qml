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

    InnerShadow {
        anchors.fill: butterfly
        source: butterfly
        radius: 9
        samples: 16
        horizontalOffset: 0
        verticalOffset: 3
        color: "white"
        fast:true
        spread:0.25
    }
}

