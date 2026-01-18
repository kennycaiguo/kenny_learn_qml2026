import QtQuick

Rectangle {
    width: 480; height: 240
    color: '#1e1e1e'

    Row {
        anchors.centerIn: parent
        spacing: 20
        Image {
            id: sourceImage
            width: 80; height: width
            source: 'qrc:/assets/tulips.jpg'
        }

        ShaderEffect {
            id: effect
            width: 80; height: width
            property variant source: sourceImage
        }

        ShaderEffect {
            id: effect2
            width: 80; height: width
            // the source where the effect shall be applied to
            property variant source: sourceImage
            // default vertex shader code
            vertexShader: "qrc:/default/default.vert.qsb"

            // default fragment shader code
            fragmentShader: "qrc:/default/default.frag.qsb"
        }
    }
}

