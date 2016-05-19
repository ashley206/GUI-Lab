import QtQuick 2.0
import QtQuick.Controls 1.5


Rectangle
{
    id: colorPicker_wrapper
    width: 3*parent.width/4
    height: parent.height/4
    anchors.centerIn: parent
    color: "transparent"

    property alias pickerVisible : colorPicker_wrapper.visible
    property int index : 0

    Rectangle{
        id: red
        width: parent.width / 6
        height: 2*parent.height/3
        anchors.left: parent.left
        color: "red"
        MouseArea
        {
            id: ma_r
            anchors.fill: parent
            onClicked:
            {
                index = 0;
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
                index = 1;
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
                index = 2;
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
                index = 3;
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
                index = 4;
                console.log(" curr color = " + currColor);
            }
        }
    }
}

//    Rectangle{
//        id: red
//        width: parent.width / 6
//        height: 2*parent.height/3
//        anchors.left: parent.left
//        color: "red"
//        anchors.left: parent.left
//        MouseArea
//        {
//            id: ma_r
//            anchors.fill: parent
//            onClicked:
//            {
//                index = 0;
//            }
//        }
//    }

//    Rectangle{
//        id: orange
//        width: parent.width / 6
//        height: 2*parent.height/3
//        color: "orange"
//        anchors.left: red.right
//        MouseArea
//        {
//            id: ma_o
//            anchors.fill: parent
//            onClicked:
//            {
//                index = 1;
//            }
//        }
//    }
//    Rectangle{
//        id: yellow
//        width: parent.width / 6
//        height: 2*parent.height/3
//        color: "yellow"
//        anchors.left: orange.right
//        MouseArea
//        {
//            id: ma_y
//            anchors.fill: parent
//            onClicked:
//            {
//                index = 2;
//            }
//        }
//    }
//    Rectangle{
//        id: green
//        width: parent.width / 6
//        height: 2*parent.height/3
//        color: "green"
//        anchors.left: yellow.right
//        MouseArea
//        {
//            id: ma_g
//            anchors.fill: parent
//            onClicked:
//            {
//                index = 3;
//            }
//        }
//    }
//    Rectangle{
//        id: blue
//        width: parent.width / 6
//        height: 2*parent.height/3
//        color: "blue"
//        anchors.left: green.right
//        MouseArea
//        {
//            id: ma_b
//            anchors.fill: parent
//            onClicked:
//            {
//                index = 4;
//                console.log(" curr color = " + currColor);
//            }
//        }
//    }


