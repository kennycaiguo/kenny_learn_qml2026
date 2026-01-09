import QtQuick

Canvas {
   id:line
   width: 200;height: 200
   onPaint: {
       var ctx = getContext("2d")
       ctx.strokeStyle="deeppink"
       ctx.lineWidth = 5
       ctx.beginPath()
       ctx.moveTo(50,50)
       ctx.lineTo(150,50)
       ctx.stroke()

   }
}
