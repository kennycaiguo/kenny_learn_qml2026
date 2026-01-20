import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300
    height: 300
    x:5;y:5
    Image {
        id: bug
        source: "qrc:/assets/bug.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Image {
        id: butterfly
        source: "qrc:/assets/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Blend {
        anchors.fill: bug
        source: bug
        foregroundSource: butterfly
        // mode: "subtract"
        // mode: "addition"
        // mode: "normal"
        // mode: "color"
        // mode: "colorBurn"
        // mode: "colorDodge"
        // mode: "darken"
        // mode: "darkerColor"
        // mode: "difference"
        // mode: "divide"
        // mode: "exclusion"
        // mode: "hardLight"
        // mode: "hue"
        // mode: "lighten"
        // mode: "lighterColor"
        // mode: "lightness"
        // mode: "multiply"
        // mode: "negation"
        // mode: "saturation"
        // mode: "screen"
        mode: "softLight"

    }
}
