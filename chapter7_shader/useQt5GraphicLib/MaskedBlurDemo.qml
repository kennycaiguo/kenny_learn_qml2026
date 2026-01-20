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

    LinearGradient {
        id: mask
        anchors.fill: bug
        gradient: Gradient {
            GradientStop { position: 0.2; color: "#ffffffff" }
            GradientStop { position: 0.5; color: "#00ffffff" }
        }
        start: Qt.point(0, 0)
        end: Qt.point(300, 0)
        visible: false
    }

    MaskedBlur {
        anchors.fill: bug
        source: bug
        maskSource: mask
        radius: 50
        samples: 24
    }
}
