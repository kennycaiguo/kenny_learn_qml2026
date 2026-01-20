import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: rootItem
    property bool cached: false
    property real angle: 0.0
    property real horizontalOffset: 0.0
    property real verticalOffset: 0.0
    property variant source

/*!
    A gradient is defined by two or more colors, which are blended seamlessly.
    The colors are specified as a set of GradientStop child items, each of which
    defines a position on the gradient (from 0.0 to 1.0), and a color.
    The position of each GradientStop is defined by the position property.
    The color is defined by the color property.

Gradient {
  GradientStop {
     position: 0.000
     color: Qt.rgba(1, 0, 0, 1)
  }
  GradientStop {
     position: 0.167
     color: Qt.rgba(1, 1, 0, 1)
  }
  GradientStop {
     position: 0.333
     color: Qt.rgba(0, 1, 0, 1)
  }
  GradientStop {
     position: 0.500
     color: Qt.rgba(0, 1, 1, 1)
  }
  GradientStop {
     position: 0.667
     color: Qt.rgba(0, 0, 1, 1)
  }
  GradientStop {
     position: 0.833
     color: Qt.rgba(1, 0, 1, 1)
  }
  GradientStop {
     position: 1.000
     color: Qt.rgba(1, 0, 0, 1)
  }
}
    \endcode
        \li \b {gradient:} \code
Gradient {
  GradientStop {
     position: 0.0
     color: Qt.color("#F0F0F0")
  }
  GradientStop {
     position: 0.5
     color: Qt.color("#000000")
  }
  GradientStop {
     position: 1.0
     color: Qt.color("#F0F0F0")
  }
}
    \endcode
        \li \b {gradient:} \code
Gradient {
  GradientStop {
     position: 0.0
     color: Qt.color("#00000000")
  }
  GradientStop {
    position: 1.0
    color: Qt.color("#FF000000")
  }
}

*/
    property Gradient gradient: Gradient {
        GradientStop { position: 0.0; color: Qt.color("white") }
        GradientStop { position: 1.0; color: Qt.color("black") }
    }

    Image {
        id: sourceImage
        source: "qrc:/assets/tulips.jpg"
    }

    Rectangle {
        id: gradientRect
        width: 16
        height: 256
        gradient: rootItem.gradient
        smooth: true
   }

    ShaderEffectSource {
        id: cacheItem
        anchors.fill: parent
        visible: rootItem.cached
        smooth: true
        rotation: shaderItem.rotation
        sourceItem: shaderItem
        live: true
        hideSource: visible
    }

    ShaderEffect {
        id: shaderItem
        property variant gradientSource: ShaderEffectSource {
            sourceItem: gradientRect
            smooth: true
            hideSource: true
            visible: false
        }
        property variant maskSource: sourceImage
        property real startAngle: (rootItem.angle - 90) * Math.PI/180
        property variant center: Qt.point(0.5 + horizontalOffset / width, 0.5 + verticalOffset / height)

        anchors.fill: parent

        fragmentShader: maskSource == undefined ? noMaskShader : maskShader

        onFragmentShaderChanged: startAngleChanged()

        readonly property string noMaskShader: "qrc:/shaders_ng/conicalgradient_nomask.frag.qsb"
        readonly property string maskShader:   "qrc:/shaders_ng/conicalgradient_mask.frag.qsb"
    }
}

