import QtQuick 2.0

Rectangle{
    id: budget_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: budget_title.back_btn_mouseArea
    property alias add_mouseArea: add_btn.mouseArea
    property alias setup_mouseArea: setup_btn.mouseArea

    MyTitleBar{
        id: budget_title
        title: "Budget"
        back_visible: true
    }

    MyButton{
        id: add_btn
        height: budget_title.titleHeight
        width: budget_title.titleHeight
        text: "Add"
        textColor: "white"
        anchors.right: budget_title.right
        anchors.top: budget_title.top
        color: budget_title.color
    }

    MyButton{
        id: setup_btn
        height: budget_wrapper.height/6
        width: budget_wrapper.width/3
        color: budget_title.color
        text: "Budget Setup"
        // wrap mode??
        textColor: "white"
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        anchors.bottom: budget_wrapper.bottom
    }

    Rectangle{
        id: budget_table
        width: budget_wrapper.width
        height: budget_wrapper.height
        anchors.top: budget_title.bottom
        anchors.topMargin: 15
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        ListModel{
            id: budget_model
            ListElement
            {
                name: "blah"
                left: "blah"

            }
        }
        Component
        {
            id: budget_delegate
            Row
            {
                spacing: 15
                Text
                {
                    text: "blah"
                }
                Text
                {
                    text: "blah"
                }
                Text
                {
                    text: "Blah"
                }
            }
        }
        ListView{
            anchors.fill: parent
            anchors.leftMargin: 20
            model: budget_model
            delegate: budget_delegate
        }
    }

    // need a way to list all current budgets. may need a control for that.
}

