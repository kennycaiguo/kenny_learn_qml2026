import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: rootItem
    property variant source
    // property color color: Qt.color("transparent")
    property color color: "purple"
    property bool cached: false

    Image {
        id: sourceImage
        source: ":/assets/tulips.jpg"
    }

    // ShaderEffectSource {
    //     id: cacheItem
    //     anchors.fill: parent
    //     visible: rootItem.cached
    //     smooth: true
    //     sourceItem: shaderItem
    //     live: true
    //     hideSource: visible
    // }

    ShaderEffect {
        id: shaderItem
        property variant source: sourceImage
        property color color: rootItem.color

        anchors.fill: parent

        fragmentShader: "qrc:/shaders_ng/coloroverlay.frag.qsb"
    }
}
