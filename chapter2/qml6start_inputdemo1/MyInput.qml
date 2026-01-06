import QtQuick

FocusScope {
    id:root
    width: 100
    height: 30
    property alias text: input.text
    property alias input: input

    Rectangle{
        border.color: "orange"
        border.width: 3
        anchors.fill: parent
    }

    TextInput{
        id:input
        x:5
        width: parent.width
        height: parent.height
        font.pixelSize: 24
        anchors.margins: 2
        focus: true
    }

}
