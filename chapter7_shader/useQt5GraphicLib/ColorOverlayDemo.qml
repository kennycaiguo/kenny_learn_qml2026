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

    ColorOverlay {
        anchors.fill: butterfly
        source: butterfly
        // color: "#80800000"
        // color: "#8000ff00"
        color: "#800000ff"
    }
}

