import QtQuick

Column {
    spacing: 3
    Repeater{
        model:10
        delegate: Rectangle{
            width: 100
            height: 20
            color: "lightblue"
            Text {
                text: modelData
                anchors.centerIn: parent
            }
        }
    }
}
