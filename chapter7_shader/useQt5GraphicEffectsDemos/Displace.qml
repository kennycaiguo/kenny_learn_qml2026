
import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: rootItem
    property variant source
    property variant displacementSource
    property real displacement: 0.0

    property bool cached: false

    Image {
        id: sourceProxy
        source: rootItem.source
    }

    Image {
        id: displacementSourceProxy
        source: rootItem.displacementSource
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
        property variant source: sourceProxy
        property variant displacementSource: displacementSourceProxy
        property real displacement: rootItem.displacement
        property real xPixel: 1.0/width
        property real yPixel: 1.0/height

        anchors.fill: parent

        fragmentShader: "qrc:/shaders_ng/displace.frag.qsb"
    }
}

