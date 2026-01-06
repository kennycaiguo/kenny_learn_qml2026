import QtQuick

Rectangle {
    id:root
    width: 80
    height: 300
    color: "wheat"

    Component{
        id:numberDelegate
        Rectangle{
            width: 40
            height: 40
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
    ListView{
        model:100
        delegate: numberDelegate
        clip: true
        anchors.fill: parent
        spacing: 5
        anchors.margins: 20
    }
}
