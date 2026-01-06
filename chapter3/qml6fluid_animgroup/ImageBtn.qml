import QtQuick

Item {
   id:root
   width: container.childrenRect.width
   height: container.childrenRect.height
   property alias text: label.text
   property alias source: image.source
   signal clicked

   Column{
       id:container
       Image {
           id: image
           source: ""
       }

       Text {
           id: label
           width: image.width
           horizontalAlignment: image.AlignHCenter
           text: qsTr("text")
           wrapMode: Text.Wrap
           color:"#111111"
       }
   }
   MouseArea{
       anchors.fill: parent
       onClicked: root.clicked()
   }
}
