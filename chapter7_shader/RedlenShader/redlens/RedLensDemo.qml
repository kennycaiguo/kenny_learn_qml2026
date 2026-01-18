import QtQuick

Rectangle{
    id: root
    width: 480;height: 240
    color: "#1e1e1e"
    property int step: 4
    Grid{
        anchors.centerIn: parent
        spacing: 20
        rows: 2;columns: 4
        Image {
            id:sourceImage
            source: "qrc:/assets/tulips.jpg"
            width: 80;height: width
        }

        ShaderEffect{
            id: effect1
            width: 80;height: width
            visible: root.step > 0
            fragmentShader: "qrc:/redlens/red1.frag.qsb"
        }

        ShaderEffect{
            id: effect2
            width: 80;height: width
            property variant source: sourceImage
            visible: root.step > 1
            fragmentShader: "qrc:/redlens/red2.frag.qsb"
        }

        ShaderEffect{
            id: effect3
            width: 80;height: width
            property variant source: sourceImage
            property real redChannel:0.3
            visible: root.step > 2
            fragmentShader: "qrc:/redlens/red3.frag.qsb"
        }

        ShaderEffect{
            id: effect4
            width: 80;height: width
            property variant source: sourceImage
            property real redChannel:0.3
            NumberAnimation on redChannel {
              from: 0.0;to:1.0;loops:Animation.Infinite;duration: 4000
            }

            visible: root.step > 3
            fragmentShader: "qrc:/redlens/red3.frag.qsb"
        }
    }
}
