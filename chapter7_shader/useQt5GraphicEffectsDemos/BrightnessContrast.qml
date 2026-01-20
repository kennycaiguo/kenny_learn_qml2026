import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: rootItem
    property variant source
    property real brightness: 0.0
    property real contrast: 0.0
    property bool cached: true

    Image{
        id:sourceImage
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
        property variant source: sourceImage
        property real brightness: rootItem.brightness
        property real contrast: rootItem.contrast

        anchors.fill: parent
        blending: !rootItem.cached

        fragmentShader: "qrc:/shaders_ng/brightnesscontrast.frag.qsb"
    }
}
