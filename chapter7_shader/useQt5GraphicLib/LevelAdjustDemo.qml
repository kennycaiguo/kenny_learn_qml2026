import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image {
        id: butterfly
        source: "qrc:/assets/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    LevelAdjust {
        anchors.fill: butterfly
        source: butterfly
        minimumInput:"#00000000"
        maximumInput:"#FFFFFFff"
        minimumOutput: "#000000A0"
        maximumOutput: "#ffffffff"
        gamma: Qt.vector3d(1.0, 1.0, 1.0)
    }
}

