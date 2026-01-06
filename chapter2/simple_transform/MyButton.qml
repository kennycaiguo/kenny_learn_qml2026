import QtQuick

Rectangle{
    id:root
    width: 100
    height: 30
    property alias text: label.text
    signal clicked
    border.color: "lightsteelblue"
    border.width: 3

    Text{
        id:label
        text:"hello"
        anchors.centerIn: parent
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
