/********************************
  Name: Ashley Wagner
  Lab:  Lab2
  Project Name: PiggyBank

********************************/

import QtQuick 2.6
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("PiggyBank")

    property bool clicked: false

    Image{
        id: logo
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "c:/Users/Ashley H/Documents/GitHub/cst-238/cst-238/gui project logo.png"
    }


    Text{
        id: title
        color: "#51c460"
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        x: (parent.width/2)-(width/2)
        font.pointSize: 20
        text: "PIGGYBANK"
    }

    MyDialog{
        id: dialog
        z:1
        y: (parent.height/2)-(height/2)
        x: (parent.width/2)-(width/2)
        widthButton: widthDialog/4
        heightButton: heightDialog/6
        textDialog: "Welcome to Piggy Bank!\nThis is a budgeting application that can help any user know where their money goes and become smarter about their spending! With an account, the uesr has full access to ways of adding, organizing, and viewing all sorts of transactions and budgets."
        textButton: "click!"
        heightDialog: parent.height/3
        widthDialog: parent.width/1.5
        dragToggle: true

        mouseArea.onClicked: {
            if(mouseArea.onClicked && clicked)
                dialog.visible = false;
            textDialog = "You've successfully clicked the button! Now you can move on in the application.";
            textButton = "Close";
            clicked = true;
        }
    }

    MyDialog{
        id: dialogName
        y: (parent.height/2)-(height/2)
        x: (parent.width/2)-(width/2)
        widthDialog: parent.width/2
        heightDialog: parent.height/4
        widthButton: widthDialog/4
        heightButton: heightDialog/6
        textDialog: "Hello, from Ashley Wagner!"
        textButton: "Goodbye!"
        mouseArea.onClicked: {
            Qt.quit();
        }
    }
}
