import QtQuick 2.0
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

Rectangle{
    id: settings_root
    anchors.fill: parent
    color: "white"


    //    Settings{
    //        id: settings_global
    //    }

    Text{
        text: "Settings"
        color: "#51c460"
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 14
        anchors.top: parent.top
        anchors.topMargin: 10

    }

    Rectangle{
        anchors.centerIn: parent
        color: "green"
        height: 200
        width: 200

    }

}



