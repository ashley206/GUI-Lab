/********************************
  Name: Ashley Wagner
  Lab:  Lab2
  Project Name: PiggyBank

********************************/

import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("PiggyBank")


//    MyButton
//    {
//        id: btn_colorchange
//        width: parent.width/4
//        height: parent.height/4
//        color: "red"
//        text: "help"
//        anchors.centerIn: parent
//        mouseArea.onClicked:
//        {
//            color = "green";
//        }
//        mouseArea.onEntered:
//        {
//            color = "blue";
//        }
//        mouseArea.onExited:
//        {
//            color = "red";
//        }
//    }

//    TextRect
//    {
//        id: text_box
//        width: parent.width/4
//        height: parent.height/6
//        anchors.bottom: btn_colorchange.top
//        anchors.horizontalCenter: btn_colorchange.horizontalCenter
//        text: "PiggyBank - GUI Project"
//        color: "orange"
//        font.family: "helvetica"
//        border.color: "red"
//    }

    MyDialog{
        id: dialog
        y: (parent.height/4)-(height/2)
        x: (parent.width/3)-(width/2)
        width: parent.width/2
        height: parent.height/2
        textDialog: "blah blah"
        textButton: "click!"
        heightDialog: parent.width/4
        widthDialog: parent.height/4

        dragToggle: true

    }

}
