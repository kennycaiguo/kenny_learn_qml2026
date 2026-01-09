import QtQuick

Canvas {
   id: root
   width: 240;height: 120

   onPaint: {
       var ctx = getContext("2d")
       ctx.globalCompositeOperator = "xor"
       ctx.fillStyle = "#33a9ff"

       for(var i=0;i<40;i++){
           ctx.beginPath()
           ctx.arc(Math.random()*400,Math.random()*200,20,0,2*Math.PI)
           ctx.closePath()
           ctx.fill()
       }
   }
}
