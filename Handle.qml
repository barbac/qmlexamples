import QtQuick 2.2

Rectangle {
    width: 20
    height: 20
    color: 'skyblue'
    property alias text: text.text
    MouseArea {
        anchors.fill: parent
        drag.target: parent
    }
    Text {
        id: text
        anchors.centerIn: parent
    }
}
