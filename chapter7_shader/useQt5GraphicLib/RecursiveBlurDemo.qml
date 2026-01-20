import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image {
        id: bug
        source: "qrc:/assets/tulips.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    RecursiveBlur {
        anchors.fill: bug
        source: bug
        radius: 4.0
        loops: 4
        transparentBorder: true
    }
}
