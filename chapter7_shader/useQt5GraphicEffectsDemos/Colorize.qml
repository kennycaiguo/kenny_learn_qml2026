import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: rootItem
    property variant source
    property real hue: 0.0
    property real saturation: 1.0
    property real lightness: 0.0
    property bool cached: false

    Image{
        id:sourceIamge
        source: "qrc:/assets/tulips.jpg"
    }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: parent
        visible: rootItem.cached
        smooth: true
        sourceItem: shaderItem
        live: true
        hideSource: visible
    }

    ShaderEffect {
        id: shaderItem
        property variant source: sourceIamge
        property real hue: rootItem.hue
        property real saturation: rootItem.saturation
        property real lightness: rootItem.lightness

        anchors.fill: parent

        fragmentShader: "qrc:/shaders_ng/colorize.frag.qsb"

    }
}
