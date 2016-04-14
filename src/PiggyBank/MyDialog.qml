import QtQuick 2.0

Item
{
    property alias mouseArea: buttonArea.mouseArea
    property alias textDialog: textRectArea.text
    property alias textButton: buttonArea.text
    property alias heightDialog: textRectArea.height
    property alias widthDialog: textRectArea.width
    property alias heightButton: buttonArea.height
    property alias widthButton: buttonArea.width
    property bool dragToggle: false

    MouseArea
    {
        anchors.fill: parent
        drag.target:
        {
            if(dragToggle)
                parent;
            else
                undefined;
        }
    }

    TextRect
    {
        id: textRectArea
        colorRectArea: "light green"
        anchors.centerIn: parent
        height: 400
    }
    MyButton
    {
        id: buttonArea
        color: "light grey"
        width: parent.width/3
        height: parent.height/6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: textRectArea.bottom
        anchors.bottomMargin: 10

        mouseArea.onClicked:
        {
            color = "dark grey";
            textButton = "You clicked!";
            textRectArea.text = "You did the thing good for you!";
        }
        mouseArea.onEntered:
        {
            color = "grey";
        }
        mouseArea.onExited:
        {
            color = "light grey";
        }

    }

}
