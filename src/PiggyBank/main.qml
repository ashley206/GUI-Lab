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
        settings_mouseArea.onClicked: {
            splash_screen.visible = false;
            settings_screen.visible = true;
        }
        budget_mouseArea.onClicked: {
            splash_screen.visible = false;
            budget_screen.visible = true;
        }

    }

    MyBudget{
        id: budget_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            splash_screen.visible = true;
            budget_screen.visible = false;
        }
    }
    MySettings{
        id: settings_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            splash_screen.visible = true;
            settings_screen.visible = false;
        }
    }

}



