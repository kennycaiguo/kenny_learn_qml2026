import QtQuick

Canvas {
    id: root
    width: 200;height: 200
    onPaint: {
        //get the current Context
        var ctx = getContext("2d")
        // setup the stroke
        ctx.lineWidth = 4
        ctx.strokeStyle = "blue"
        // setup the fill style
        ctx.fillStyle = "lightsteelblue"
        //begin the Path
        ctx.beginPath()
        //draw the path
        ctx.moveTo(50,50)
        ctx.lineTo(150,50)
        ctx.lineTo(150,150)
        ctx.lineTo(50,150)
        // close the Path
        ctx.closePath()
        //填充图形
        ctx.fill() //只是填充，没有边框
        //draw
        ctx.stroke() //绘制边框
    }
}
