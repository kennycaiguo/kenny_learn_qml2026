import QtQuick

Rectangle {
    width: 480; height: 240
    color: '#1e1e1e'

    Image {
        id: sourceImage
        width: 160; height: width
        source: "qrc:/assets/lighthouse.jpg"
        visible: false
    }
    Rectangle {
        width: 160; height: width
        anchors.centerIn: parent
        color: '#333333'
    }
    ShaderEffect {
        id: genieEffect
        width: 160; height: width
        anchors.centerIn: parent
        property variant source: sourceImage
        // adding a mesh
        mesh: GridMesh { resolution: Qt.size(16, 16) }
        property real minimize: 0.0
        // adding bend
        // #region M1
        property real bend: 0.0
        property bool minimized: false


        // change to parallel animation
        ParallelAnimation {
            id: animMinimize
            running: genieEffect.minimized
            SequentialAnimation {
                PauseAnimation { duration: 300 }
                NumberAnimation {
                    target: genieEffect; property: 'minimize';
                    to: 1; duration: 700;
                    easing.type: Easing.InOutSine
                }
                PauseAnimation { duration: 1000 }
            }
            // adding bend animation
            SequentialAnimation {
                NumberAnimation {
                    target: genieEffect; property: 'bend'
                    to: 1; duration: 700;
                    easing.type: Easing.InOutSine }
                PauseAnimation { duration: 1300 }
            }
        }
        // #endregion M1

        ParallelAnimation {
            id: animNormalize
            running: !genieEffect.minimized
            SequentialAnimation {
                NumberAnimation {
                    target: genieEffect; property: 'minimize';
                    to: 0; duration: 700;
                    easing.type: Easing.InOutSine
                }
                PauseAnimation { duration: 1300 }
            }
            // adding bend animation
            SequentialAnimation {
                PauseAnimation { duration: 300 }
                NumberAnimation {
                    target: genieEffect; property: 'bend'
                    to: 0; duration: 700;
                    easing.type: Easing.InOutSine }
                PauseAnimation { duration: 1000 }
            }
        }

        vertexShader: "qrc:/qsb/genie3.vert.qsb"

        MouseArea {
            anchors.fill: parent
            onClicked: parent.minimized = !parent.minimized
        }
    }


}
