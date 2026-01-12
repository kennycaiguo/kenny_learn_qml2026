import QtQuick

Canvas {
    id: root
    width: 240; height: 120
    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 4;
        ctx.strokeStyle = "blue";

        // translate x/y coordinate system
        ctx.translate(root.width/2, root.height/2);

        // draw path
        ctx.beginPath();
        ctx.rect(-20, -20, 40, 40);
        ctx.stroke();

        // rotate coordinate system
        ctx.rotate(Math.PI/4);
        ctx.strokeStyle = "green";

        // draw path
        ctx.beginPath();
        ctx.rect(-20, -20, 40, 40);
        ctx.stroke();

        ctx.rotate(Math.PI/3);
        ctx.strokeStyle = "deeppink";
        ctx.beginPath();
        ctx.rect(-20, -20, 40, 40);
        ctx.stroke();

    }
}
