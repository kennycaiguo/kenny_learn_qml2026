import QtQuick 2.5

Rectangle{
    width: 120
    height: 300
    color: "white"

    ListView{
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: 100
        delegate: numDelegate
        spacing: 5
        focus: true
    }

    Component{
        id:numDelegate
        Rectangle{
            width: ListView.view.width
            height: 40
            color: ListView.isCurrentItem? "gray": "lightgray"
            Text {
                anchors.centerIn: parent
                text: index
                font.pixelSize: 10
            }
            MouseArea{
                anchors.fill: parent
                onClicked: console.log(index)
            }
        }
    }
}
