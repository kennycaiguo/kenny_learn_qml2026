import QtQuick

Canvas {
    id: root
    width: 120;height: 120
    onPaint: {
        var ctx = getContext("2d")
        ctx.lineWidth = 4
        ctx.fillStyle = "blue"
        ctx.strokeStyle = "green"
        //绘制填充矩形
        ctx.fillRect(20,20,80,80)
        //清除出一个矩形区域
        ctx.clearRect(30,30,60,60)
        //绘制空心矩形
        ctx.strokeRect(20,20,40,40)
    }
}
