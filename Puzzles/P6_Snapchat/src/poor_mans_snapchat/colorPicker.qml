import QtQuick 2.0

Item{
Rectangle
{
    id: colorPicker_wrapper

    width: 3*parent.width/4
    height: parent.height/4

    Rectangle{
        id: red
        width: parent.width / 6
        height: 2*parent.height/3
        color: "red"
        anchors.left: parent.left
    }

    Rectangle{
        id: orange
        width: parent.width / 6
        height: 2*parent.height/3
        color: "orange"
        anchors.left: red.left
    }
    Rectangle{
        id: yellow
        width: parent.width / 6
        height: 2*parent.height/3
        color: "yellow"
        anchors.left: orange.left
    }
    Rectangle{
        id: green
        width: parent.width / 6
        height: 2*parent.height/3
        color: "green"
        anchors.left: yellow.left
    }
    Rectangle{
        id: blue
        width: parent.width / 6
        height: 2*parent.height/3
        color: "blue"
        anchors.left: green.left

    }

}
}
