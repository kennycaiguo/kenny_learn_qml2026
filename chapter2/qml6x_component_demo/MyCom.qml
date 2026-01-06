import QtQuick

Item {
    id:root
    anchors.fill: parent
    property int rotationStep:30
    property double scaleFactor: 0.95
    property double opacityFactor: 0.95

           Rectangle{
               id:rec1
               x:50;y:50
               width:200
               height: 100
               border.color:"gray"
               border.width: 5
               gradient: Gradient{
                   GradientStop{position: 0.0;color: "lightskyblue" }
                   GradientStop{position: 1.0;color: "cyan"}
               }
           }

           Rectangle{
               id:btn
               x:50;y:160
               width: 100
               height: 30
               anchors.centerIn: parent
               border.color: "blue"
               border.width: 3
               Text {
                   id: txt
                   anchors.centerIn: parent
                   text: qsTr("控制")
               }
               focus: true
               Keys.onLeftPressed: {
                   rec1.rotation -=root.rotationStep
                   rec1.opacity *=root.opacityFactor
                   rec1.scale *=root.scaleFactor
               }
               Keys.onRightPressed: {
                   rec1.rotation +=root.rotationStep
                   rec1.opacity /=root.opacityFactor
                   rec1.scale /=root.scaleFactor
               }
           }
}

