import QtQuick 2.0

import QtQuick 2.0


Rectangle
{
    id: colorPicker_wrapper

    property alias pickerVisible : colorPicker_wrapper.visible
    property alias currColor: color

    width: 3*parent.width/4
    height: parent.height/4
    anchors.centerIn: parent
    Rectangle{
        id: red
        width: parent.width / 6
        height: 2*parent.height/3
        color: "red"
        anchors.left: parent.left
        MouseArea
        {
            id: ma_r
            anchors.fill: parent
            onClicked:
            {
                currColor = "red"
            }
        }
    }

    Rectangle{
        id: orange
        width: parent.width / 6
        height: 2*parent.height/3
        color: "orange"
        anchors.left: red.right
        MouseArea
        {
            id: ma_o
            anchors.fill: parent
            onClicked:
            {
                currColor = "orange"
            }
        }
    }
    Rectangle{
        id: yellow
        width: parent.width / 6
        height: 2*parent.height/3
        color: "yellow"
        anchors.left: orange.right
        MouseArea
        {
            id: ma_y
            anchors.fill: parent
            onClicked:
            {
                currColor = "yellow"
            }
        }
    }
    Rectangle{
        id: green
        width: parent.width / 6
        height: 2*parent.height/3
        color: "green"
        anchors.left: yellow.right
        MouseArea
        {
            id: ma_g
            anchors.fill: parent
            onClicked:
            {
                currColor = "green"
            }
        }
    }
    Rectangle{
        id: blue
        width: parent.width / 6
        height: 2*parent.height/3
        color: "blue"
        anchors.left: green.right
        MouseArea
        {
            id: ma_b
            anchors.fill: parent
            onClicked:
            {
                currColor = "blue"
                console.log(" curr color = " + currColor);
            }
        }
    }

}
