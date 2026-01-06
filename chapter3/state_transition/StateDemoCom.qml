import QtQuick

Rectangle {
    id:root
    width: 150
    height: 250
    border.color: "deeppink"
    state: "stop"

    Rectangle{
        id: red
        x:25;y:15
        width: 100
        height: width
        radius: width/2
        color: "black"
    }

    Rectangle{
        id: green
        x:25;y:125
        width: 100
        height: width
        radius: width/2
        color: "black"
    }

    states:[
        State {
            name: "stop"
            PropertyChanges {
                target: red
                color:"red"
            }
            PropertyChanges {
                target: green
                color:"black"
            }
        },

        State {
            name: "go"
            PropertyChanges {
                target: red
                color:"black"
            }
            PropertyChanges {
                target: green
                color:"green"
            }
        }
    ]

    //过渡，在状态切换的时候被调用
    transitions: [
        Transition {
            from: "go"
            to: "stop"

            ColorAnimation {
                target: red
                property: "color"
                duration: 500
            }

            ColorAnimation {
                target: green
                property: "color"
                duration: 500
            }
        }
    ]

    MouseArea{
        anchors.fill: parent
        onClicked: root.state = (root.state == "stop"?"go":"stop")
    }
}
