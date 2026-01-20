import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300

    Image {
        id: butterfly
        source: "qrc:/assets/bug.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    ZoomBlur {
        anchors.fill: butterfly
        source: butterfly
        samples: 24
        length: 120.0
        horizontalOffset: 0
        verticalOffset: 0
    }
}

