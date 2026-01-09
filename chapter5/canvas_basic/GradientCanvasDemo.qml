import QtQuick

Canvas {
   width: 150;height: 150
   onPaint: {
       var ctx = getContext("2d")

       var gradient = ctx.createLinearGradient(100,0,100,200)
       gradient.addColorStop(0,"blue")
       gradient.addColorStop(0.5,"lightsteelblue")
       ctx.fillStyle = gradient
       ctx.fillRect(50,50,100,100)
   }
}
