import QtQuick 2.0

Rectangle{
    id: titlebar_wrapper
    anchors.fill: parent

    property alias title: title_txt.text
    Rectangle{
        id: bar_rect
        width: parent.width
        height: 50
        color: "#1EAF64"
    }
    Text{
        id: title_txt
        text: "Default Title"
    }
}
