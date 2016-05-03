import QtQuick 2.0

Rectangle{
    id: titlebar_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias title: title_txt.text
    property alias titleHeight: bar_rect.height
    Rectangle{
        id: bar_rect
        width: parent.width
        height: parent.width/8
        color: "#1EAF64"
        anchors.top: parent.top
    }

    Text{
        id: title_txt
        text: "Default Title"
        anchors.centerIn: bar_rect
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 14
    }
    property alias titleSize: title_txt.font.pointSize
}
