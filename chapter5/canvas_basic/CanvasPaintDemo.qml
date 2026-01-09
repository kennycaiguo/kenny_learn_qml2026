import QtQuick

Rectangle {
   id: root
   width: 400;height: 300
   color: "#333333"

   Row{
       id: colorTools
       property color paintColor: "#33B5E5"
       anchors{
           horizontalCenter: parent.horizontalCenter
           top: parent.top
           topMargin: 8
       }

       spacing: 4
       Repeater{
           model: ["#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]
           ColorSquare{
               color: modelData
               active: colorTools.paintColor == color
               onClicked: {
                   colorTools.paintColor = color
               }
           }
       }
   }

   Rectangle {
       anchors.fill: canvas
       border.color: "#666666"
       border.width: 4
   }

   Canvas{
       id: canvas
       property real lastX: 0
       property real lastY: 0
       property color color: colorTools.paintColor

       anchors{
           left: parent.left
           right: parent.right
           top: colorTools.bottom
           bottom:parent.bottom
           margins: 8
       }

       onPaint: {
           var ctx = getContext("2d")
           ctx.lineWidth = 1.5
           ctx.strokeStyle = canvas.color
           ctx.beginPath()
           ctx.moveTo(lastX,lastY)
           lastX = mouse.mouseX
           lastY = mouse.mouseY
           ctx.lineTo(lastX,lastY)
           ctx.stroke()
       }

       MouseArea{
           id: mouse
           anchors.fill: parent
           onPressed: {
               canvas.lastX = mouseX
               canvas.lastY = mouseY
           }
           onPositionChanged: canvas.requestPaint()
       }
   }

}
