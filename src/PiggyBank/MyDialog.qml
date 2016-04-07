import QtQuick 2.0

Item
{
    property alias mouseArea: buttonArea.mouseArea
    property alias textDialog: textRectArea.text
    property alias textButton: buttonArea.text
    property alias heightDialog: textRectArea.height
    property alias widthDialog: textRectArea.width
    property bool dragToggle: false

    MouseArea
    {
        anchors.fill: parent
        drag.target:
        {
            if(dragToggle)
                parent
            else
                undefined
        }
    }

    TextRect
    {
        id: textRectArea
        color: "light blue"
        anchors.centerIn: parent
        text: "blahahahahhahaha"



    }
    MyButton
    {
        id: buttonArea
        color: "red"
        width: parent.width/3
        height: parent.height/4
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10

        mouseArea.onClicked:
        {
            color = "green";
            textButton = "you clicked!"
        }
        mouseArea.onEntered:
        {
            color = "blue";
        }
        mouseArea.onExited:
        {
            color = "red";
        }

    }

}
