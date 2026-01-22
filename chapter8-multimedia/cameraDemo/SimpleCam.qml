import QtQuick 2.5
import QtMultimedia

Rectangle{
    id:root
    width: parent.width-20;height: parent.height
    anchors.centerIn: parent
    property int buttonWidth: 170
    property int buttonHeight: 50
    border.color: "lightgray"

    Rectangle {
        id:cap
        width: parent.width
        height: 400
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        border.color: "#ccc"
        CaptureSession{
            id:capSession
            camera: Camera{}
            videoOutput: output
        }

        VideoOutput{
            id:output
            anchors.fill: parent
        }

        // Component.onCompleted: capSession.camera.start()

    }

    Row{
        id:controls
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:cap.bottom
        anchors.topMargin: 10
        anchors.leftMargin: 10
        spacing: 20
        Button{
            width: root.buttonWidth;height: root.buttonHeight
            text: "start"
            onClicked: capSession.camera.start()
        }
        Button{
            width: root.buttonWidth;height: root.buttonHeight
            text: "stop"
            onClicked: capSession.camera.stop()
        }
    }
}
