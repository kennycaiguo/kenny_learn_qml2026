import QtQuick

Column {
    spacing: 2
    Repeater{
        model:["Java","Cpp","Python","Golang","Kotlin","JavaScript"]
        Rectangle{
            width: 100
            height: 20
            color: "lightblue"
            radius: 3
            Text {
                text: modelData + '('+index+')'
                anchors.centerIn: parent
            }
        }
    }
}
