import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"
    }

    RectangularGlow {
        id: effect
        anchors.fill: rect
        glowRadius: 3
        spread: 0.45
        color: "deeppink"
        cornerRadius: 100
    }


    Rectangle {
        id: rect
        // opacity: 0.85
        color: "lightgray"
        Image{
            anchors.fill: parent
            source: "qrc:/assets/butterfly.png"
        }

        anchors.centerIn: parent
        width: Math.round(parent.width / 1.5)
        height: Math.round(parent.height /1.5)
        radius: width/2
    }
}
