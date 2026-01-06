import QtQuick

Column {
  id:root
  spacing: 2
  Repeater{
      model:ListModel{
          ListElement{name:"Mercury";surfaceColor:"gray"}
          ListElement{name:"Venus";surfaceColor:"yellow"}
          ListElement{name:"Earth";surfaceColor:"blue"}
          ListElement{name:"Mars";surfaceColor:"red"}
          ListElement{name:"Jupiter";surfaceColor:"orange"}
          ListElement{name:"Saturn";surfaceColor:"yellow"}
          ListElement{name:"Uranus";surfaceColor:"brown"}
          ListElement{name:"Neptune";surfaceColor:"lightgray"}
          ListElement{name:"Pluto";surfaceColor:"darkbrown"}
      }

      Rectangle{
          color: "lightblue"
          border.color: "green"
          width: 100
          height: 20
          Text {
              text: name
              anchors.centerIn: parent
          }

          Rectangle{
              border.color: "black"
              color: surfaceColor
              width: 16
              height: 16
              radius: 8
              anchors.verticalCenter: parent.verticalCenter
              anchors.left: parent.left
              anchors.margins: 2
          }
      }
  }
}
