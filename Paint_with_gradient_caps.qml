import QtQuick 2.2

Canvas {
    id: root
    width: 300
    height: 300
    onPaint: {
        var ctx = getContext('2d');
        ctx.clearRect(0, 0, width, height);

        //stroke
        ctx.fillStyle = 'yellow';
        ctx.beginPath();
        ctx.moveTo(start.x, start.y + start.height);
        ctx.quadraticCurveTo(start.x + start.width, start.y,
                             start.x + start.width, start.y);
        ctx.quadraticCurveTo(end.x + end.width, end.y,
                             end.x + end.width, end.y);
        ctx.quadraticCurveTo(end.x, end.y + end.height,
                             end.x, end.y + end.height);
        ctx.closePath();
        ctx.fill();

        //caps
        var color = "yellow"
        drawCap(ctx, start, color, false);
        drawCap(ctx, end, color, false);
    }
    function drawCap(ctx, item, color, drawStroke) {
        var posX = item.x - item.width / 2;
        var posY = item.y - item.height / 2;
        var sizeHeight = item.height * 2;
        var sizeWidth = item.width * 2;
        if (drawStroke) {
            ctx.strokeStyle = "green";
            ctx.strokeRect(posX, posY, sizeWidth, sizeHeight);
        }
        var X = sizeWidth / 2 + posX;
        var Y = sizeHeight / 2 + posY;
        var gradient = ctx.createRadialGradient(X, Y, sizeHeight / 2, X, Y, 0);
        gradient.addColorStop(0, color);
        gradient.addColorStop(1, 'rgba(0, 0, 0, 0)');
        ctx.fillStyle = gradient;
        ctx.fillRect(posX, posY, sizeWidth, sizeHeight);
    }

    Rectangle {
        id: start
        width: 30
        height: 30
        x: 50
        y: 20
//        color: "skyblue"
        color: "transparent"
        onXChanged: root.requestPaint()
        onYChanged: root.requestPaint()
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }
    Rectangle {
        id: end
        width: 30
        height: 30
        x: 150
        y: 200
//        color: "green"
        color: "transparent"
        onXChanged: root.requestPaint()
        onYChanged: root.requestPaint()
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }
}
