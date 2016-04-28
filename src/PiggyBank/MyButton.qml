import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2


Rectangle
{
    property alias mouseArea:mouseArea
    property alias text: buttonText.text
    property alias fontSize: buttonText.font.pointSize

    id: button

    Text{
        id: buttonText
        anchors.centerIn: parent
    }

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }


}
