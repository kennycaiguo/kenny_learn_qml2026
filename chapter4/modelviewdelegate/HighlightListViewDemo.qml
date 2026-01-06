import QtQuick

Rectangle {
    id:root
    width: 80
    height: 300
    color: "wheat"

    Component{
        id:numDelegate
        Item{
            width: 40
            height: 40

            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }

    Component{
        id:highlightCom
        Rectangle{
            width:ListView.view.width
            color: "lightgreen"
        }
    }

    ListView{
        model: 100
        delegate: numDelegate
        highlight: highlightCom
        anchors.fill: parent
        anchors.margins: 20
        clip:true
        spacing: 5
        focus: true
    }
}
