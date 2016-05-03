import QtQuick 2.0

Rectangle{

    property alias title: title_txt.text
    property alias titleHeight: bar_rect.height
    property alias titleBottom: bar_rect.bottom
    property alias back_visible: back_btn.visible
    property alias back_btn_mouseArea: back_btn.mouseArea

    id: bar_rect
    width: parent.width
    height: parent.width/8
    color: "#1EAF64"
    anchors.top: parent.top

    Text{
        id: title_txt
        text: "Default Title"
        anchors.centerIn: bar_rect
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 20
        color: "white"
    }
    property alias titleSize: title_txt.font.pointSize

    MyButton{
        id: back_btn
        visible: true
        // eventually want an image here
        text: "Back"
        textColor: "white"
        anchors.top: bar_rect.top
        anchors.left: bar_rect.left
        width: bar_rect.height
        height: bar_rect.height
        color: bar_rect.color
    }
}
