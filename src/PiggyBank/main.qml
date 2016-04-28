/********************************
  Name: Ashley Wagner
  Lab:  Lab2
  Project Name: PiggyBank

********************************/

import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
import QtQuick.Window 2.2

Window {
    visible: true
    width: 420
    height: 640

    title: qsTr("PiggyBank")


    SplashTitle{
        id: splash_screen
        visible: true
        anchors.fill: parent
        mouseArea.onClicked: {
            splash_screen.visible = false;
            settings_screen.visible - true;
        }

    }
    MySettings{
        id: settings_screen
        visible: false
        anchors.fill: parent
    }

    //            title_x: (parent.width/2)-(width/2)
    //            subtitle_x: (parent.width/2)-(width/2)

    //            mouseArea.onClicked: {
    //                splash_wrapper.visible = false;
    //                settings_wrapper.visible = true;
    //            }
}


//    Text{
//        id: title
//        color: "#51c460"
//        font.bold: true
//        horizontalAlignment: Text.AlignHCenter
//        x: (parent.width/2)-(width/2)
//        font.pointSize: 30
//        text: "PIGGYBANK"
//    }
//    Text{
//        id: subtitle
//        color: "#51c460"
//        horizontalAlignment: Text.AlignHCenter
//        anchors.top: title.bottom
//        anchors.topMargin: 10
//        x: (parent.width/2)-(width/2)
//        font.pointSize: 12
//        text: "A budgeting solution!"
//    }

//    MyDialog{
//        id: dialog
//        z:1
//        y: (parent.height/4)
//        x: (parent.width/2)-(width/2)
//        widthButton: widthDialog/4
//        heightButton: heightDialog/6
//        textDialog: "Welcome to Piggy Bank!\nThis is a budgeting application that can help any user know where their money goes and become smarter about their spending! With an account, the uesr has full access to ways of adding, organizing, and viewing all sorts of transactions and budgets."
//        textButton: "click!"
//        heightDialog: parent.height/3
//        widthDialog: parent.width/1.5
//        dragToggle: true

//        mouseArea.onClicked: {
//            if(mouseArea.onClicked && clicked)
//                dialog.visible = false;
//            textDialog = "You've successfully clicked the button! Now you can move on in the application.";
//            textButton = "Close";
//            clicked = true;
//        }
//    }

//    MyDialog{
//        id: dialogName
//        y: (parent.height/4)
//        x: (parent.width/2)-(width/2)
//        widthDialog: parent.width/2
//        heightDialog: parent.height/4
//        widthButton: widthDialog/4
//        heightButton: heightDialog/6
//        textDialog: "Hello, from Ashley Wagner!"
//        textButton: "Goodbye!"
//        mouseArea.onClicked: {
//            Qt.quit();
//        }
//    }


