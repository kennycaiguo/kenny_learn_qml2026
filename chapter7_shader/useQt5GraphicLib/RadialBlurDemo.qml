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

    RadialBlur {
        anchors.fill: bug
        source: bug
        samples: 24
        angle: 30
        horizontalOffset: 0
        verticalOffset: 40

    }
}
