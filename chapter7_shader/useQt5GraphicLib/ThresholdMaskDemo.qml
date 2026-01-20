import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/assets/checker.png"
        smooth: true
        fillMode: Image.Tile
    }

    Image {
        id: bug
        source: "qrc:/assets/bug.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Image {
        id: mask
        source: "qrc:/assets/fog.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    ThresholdMask {
        anchors.fill: bug
        source: bug
        maskSource: mask
        threshold: 1.0
        spread: 0.1
    }
}

