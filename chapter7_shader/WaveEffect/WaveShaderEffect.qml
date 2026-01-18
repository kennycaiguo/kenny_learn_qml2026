import QtQuick

Rectangle {
    id: root
    width: 480;height: 240
    color:"#1e1e1e"

    Grid{
        anchors.centerIn: parent
        spacing: 20
        Image {
            id: sourIamge
            width: 160; height: width
            source: "qrc:/assets/coastline.jpg"

        }
        ShaderEffect{
            width: 160;height: width
            property variant source: sourIamge
            property real time: 0.0
            property real amplitude: 0.1
            property real frequency: 8
            NumberAnimation on time{
                from: 0; to:Math.PI*2;duration: 1000;loops:Animation.Infinite
            }
            fragmentShader: "qrc:/wave.frag.qsb"
        }
    }
}
