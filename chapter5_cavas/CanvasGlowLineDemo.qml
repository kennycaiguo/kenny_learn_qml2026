import QtQuick

Canvas {
   id: canvas
   width: 800;height: 450

   property real hue: 0
   property real lastX: width * Math.random()
   property real lastY: height * Math.random()

   property bool requestLine: false
   property bool requestBlank: false

   Timer{
       id: lineTimer
       interval: 40
       repeat: true
       triggeredOnStart: true
       onTriggered: {
           canvas.requestLine = true
           canvas.requestPaint()
       }
   }

   Timer{
       id: blankTimer
       interval: 50
       repeat: true
       triggeredOnStart: true
       onTriggered: {
           canvas.requestBlank = true
           canvas.requestPaint()
       }
   }

   onPaint: {
       var ctx = getContext("2d")
       if(canvas.requestLine){
           line(ctx)
           canvas.requestLine = false
       } else if(canvas.requestBlank){
           blank(ctx)
           canvas.requestBlank = false
       }
   }

   function line(ctx){
       ctx.save()
       ctx.translate(canvas.width/2,canvas.height/2)
       ctx.scale(0.9,0.9)
       ctx.translate(-canvas.width/2,-canvas.height/2)
       ctx.beginPath()
       ctx.lineWidth = 5 +  Math.random() * 10
       ctx.moveTo(lastX,lastY)
       lastX = canvas.width * Math.random()
       lastY = canvas.height * Math.random()

       ctx.bezierCurveTo(
            canvas.width * Math.random(),
            canvas.height * Math.random(),
            canvas.width * Math.random(),
            canvas.height * Math.random(),
            lastX, lastY
        );

       hue += Math.random() * 0.1

       if(hue>1.0){
           hue -= 1
       }
       ctx.strokeStyle = Qt.hsla(hue,0.5,0.5,1)
       ctx.shadowColor = "white"
       ctx.shadowBlur = 10
       ctx.stroke()
       ctx.restore()
   }

   function blank(ctx){
       ctx.strokeStyle = Qt.rgba(0,0,0,0.1)
       ctx.fillRect(0,0,canvas.width,canvas.height)
   }

   Component.onCompleted: {
       lineTimer.start()
       blankTimer.start()
   }
}
