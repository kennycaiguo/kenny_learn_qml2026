import QtQuick


Item {
    id:root
    property int translateStep: 10
    property int rotationStep: 20
    property double scaleFactor: 0.95
    property double opacityFactor: 0.95
    Image {
        id: target
        width: 300
        height: 350
        source: "qrc:/rocket.png"
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        anchors.verticalCenterOffset: -100
    }

    Grid{
        anchors.top: target.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        rows: 2
        columns: 4
        spacing: 2
        MyButton{
            id:btn1
            text:"Move Left"
            onClicked: target.anchors.horizontalCenterOffset -=root.translateStep
        }

        MyButton{
            id:btn2
            text:"Rot Anti-Clock"
            onClicked: target.rotation -=root.rotationStep

        }

        MyButton{
            id:btn3
            text:"Get Smaller"
            onClicked: target.scale *=root.scaleFactor
        }

        MyButton{
            id:btn4
            text:"Move Right"
            onClicked: target.anchors.horizontalCenterOffset +=root.translateStep
        }

        MyButton{
            id:btn5
            text:"Rot ClockWise"
            onClicked: target.rotation +=root.rotationStep

        }

        MyButton{
            id:btn6
            text:"Get Bigger"
            onClicked: target.scale /=root.scaleFactor
        }
        MyButton{
            id:btn7
            text:"More Clear"
            onClicked: target.opacity *=root.opacityFactor
        }

        MyButton{
            id:btn8
            text:"Less Clear"
            onClicked: target.opacity /=root.opacityFactor
        }
    }

}
