import QtQuick

Item {
    id:root
    anchors.fill: parent

    MyInput{
        id:input
        x:50
        y:50
    }

    Rectangle{
        anchors.centerIn: parent
        width: 100
        height: 30
        border.color: "orange"
        border.width: 2

        Text {
            id: name
            text: qsTr("Click")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: console.log(input.text)
        }
    }
}
