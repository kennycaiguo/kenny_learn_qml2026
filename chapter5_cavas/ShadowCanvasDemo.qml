import QtQuick

Canvas {
   id:canvas
   width: 400;height: 200
   smooth: true

   onPaint: {
       var ctx = getContext("2d")
       //设置背景
       ctx.strokeStyle = "#333"
       ctx.fillRect(0,0,canvas.width,canvas.height)

       //设置阴影，需要配合文本来显示
       ctx.shadowColor = "#2ed5fa"
       ctx.shadowOffsetX = 2
       ctx.shadowOffsetY = 2
       ctx.shadowBlur = 10

       // //渲染绿色文本
       ctx.font  = 'bold 80px Arial';
       ctx.fillStyle = "#24d12e";
       ctx.fillText("Canvas",30,180)

   }
}
