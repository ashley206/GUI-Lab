
import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2


Rectangle
{
    property alias mouseArea:mouseArea
    property alias text: buttonText.text
    property alias fontSize: buttonText.font.pointSize
    property alias textColor: buttonText.color
    property alias btnColor: button.color
    property alias radius: button.radius
    id: button

    color: "#FBC02D"
    radius: 5

    Text{
        id: buttonText
        font.family: "Raleway Medium"
        anchors.centerIn: parent
        wrapMode: Text.WordWrap
    }

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }


}
