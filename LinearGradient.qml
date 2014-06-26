import QtQuick 2.2

Canvas {
    width: 300
    height: 300
    onPaint: {
        var ctx = getContext('2d');
        ctx.clearRect(0, 0, width, height);

        var gradient = ctx.createLinearGradient(x0.x, x0.y, x1.x, x1.y)
        gradient.addColorStop(0, 'rgba(255, 255, 255, 0)');
        gradient.addColorStop(1, 'red');
        ctx.fillStyle = gradient;
        ctx.fillRect(0, 0, width, height);
    }
    Handle {
        id: x0
        x: 0
        y: parent.height / 2
        onXChanged: parent.requestPaint()
        onYChanged: parent.requestPaint()
        text: 'x0'
    }
    Handle {
        id: x1
        x: parent.width - width
        y: parent.height / 2
        onXChanged: parent.requestPaint()
        onYChanged: parent.requestPaint()
        text: 'x1'
    }
    Text {
        text: x0.x.toFixed(2) + ', ' + x0.y.toFixed(2) + ', ' +
              x1.x.toFixed(2) + ', ' + x1.y.toFixed(2)
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        font.pixelSize: 20
    }
}
