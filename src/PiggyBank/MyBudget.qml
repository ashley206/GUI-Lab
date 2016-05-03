import QtQuick 2.0

Rectangle{
    id: budget_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: budget_title.back_btn_mouseArea

    MyTitleBar{
        id: budget_title
        title: "Budget"
        titleSize: 20
        back_visible: true
    }

}
