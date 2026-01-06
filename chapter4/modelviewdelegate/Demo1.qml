import QtQuick

Column {
    spacing: 2
    Repeater{
        model:10
        Rectangle{
            width: 100
            height: 20
            color: "lightblue"
            radius: 3
            Text {
                id:modelData
                text: index
                anchors.centerIn: parent
            }
        }
    }
}
