import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: rootItem
    property variant source
    property real desaturation: 0.1
    property bool cached: false

    Image {
        id: sourceImage
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
        property real desaturation: rootItem.desaturation

        anchors.fill: parent

        fragmentShader: "qrc:/shaders_ng/desaturate.frag.qsb"
    }
}

