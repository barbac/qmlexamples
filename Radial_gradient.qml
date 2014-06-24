import QtQuick 2.2
import QtQuick.Controls 1.1

Canvas {
    id: root
    property int posX: control.x
    property int posY: control.y
    property int sizeWidth: sliderWidth.value
    property int sizeHeight: sliderHeight.value
    onPosXChanged: requestPaint();
    onPosYChanged: requestPaint();
    onSizeWidthChanged: requestPaint();
    onSizeHeightChanged: requestPaint();
    onPaint: {
        var ctx = getContext('2d');
        ctx.clearRect(0, 0, width, height);

        ctx.strokeStyle = "green";
        ctx.strokeRect(posX, posY, sizeWidth, sizeHeight);

        var X = sizeWidth / 2 + posX;
        var Y = sizeHeight / 2 + posY;
        var gradient = ctx.createRadialGradient(X, Y, sizeHeight / 2, X, Y, 0);
        gradient.addColorStop(0, '#f00');
        gradient.addColorStop(1, 'rgba(0, 0, 0, 0)');
        ctx.fillStyle = gradient;
        ctx.fillRect(posX, posY, sizeWidth, sizeHeight);
    }
    MouseArea {
        id: control
        width: sizeWidth
        height: sizeHeight
        drag.target: control
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30
        Slider {
            id: sliderWidth
            value: 100
            maximumValue: 400
            Label {
                text: "width " + parent.value.toFixed(1)
                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Slider {
            id: sliderHeight
            value: 100
            maximumValue: 400
            Label {
                text: "height " + parent.value.toFixed(1)
                anchors.bottom: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
