import QtQuick 2.0

import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Rectangle{
    property alias text: textArea.text
    property alias font: textArea.font
    property alias colorRectArea: rectArea.color

    id:rectArea
    colorRectArea: "white"
    border.color: "black"
    border.width: 1

    Text{
        id:textArea
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        width: parent.width
        wrapMode: Text.WordWrap

    }

}

