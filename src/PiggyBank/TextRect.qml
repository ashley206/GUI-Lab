import QtQuick 2.0

import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Rectangle{
    property alias text: textArea.text
    property alias font: textArea.font
    property alias color: textArea.color

    border.width: 2
    color: "light green"
    Text{
        id:textArea
        anchors.centerIn: parent
    }
}

