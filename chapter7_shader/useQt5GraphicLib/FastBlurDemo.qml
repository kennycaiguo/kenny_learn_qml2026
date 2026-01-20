import QtQuick
import Qt5Compat.GraphicalEffects

Rectangle {
    id:root
    width: 480;height: 240

    Row{
      id:row
      anchors.centerIn: parent
      spacing: 16

      Image{
          id:sourImage
          source: "qrc:/assets/tulips.jpg"
          width: 200;height: width
          sourceSize: Qt.size(parent.width,parent.height)
          smooth: true

      }

      FastBlur{
           width: 200;height: width
           source: sourImage
           radius: blurred? 32:0
           property bool blurred: false

           Behavior on radius {
               NumberAnimation{duration: 1000}
           }

           MouseArea{
               id:area
               anchors.fill: parent
               onClicked: {
                  parent.blurred = !parent.blurred
               }
           }
      }

    }

    Text{
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.top: row.bottom
       anchors.topMargin: 50
       font.pixelSize: 30
       text: "点击右边的图片观看模糊效果"
    }
}
