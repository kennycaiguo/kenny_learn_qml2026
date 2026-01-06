import QtQuick

Image {
   anchors.fill: parent
   source: "qrc:/assets/background_medium@2x.png"

   Image{
       id:img
       source: "qrc:/assets/rocket.png"
       x:40;y:80
       NumberAnimation on x{
           to:240
           duration: 4000
           loops:Animation.Infinite
       }

       RotationAnimation on rotation{
           to:720
           duration: 4000
           loops:Animation.Infinite
       }
       NumberAnimation on opacity{
           to:0
           duration: 4000
           loops:Animation.Infinite
       }
   }
}
