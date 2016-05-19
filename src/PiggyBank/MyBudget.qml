import QtQuick 2.0

Rectangle{
    id: budget_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: budget_title.back_btn_mouseArea
    property alias add_mouseArea: add_btn.mouseArea
    property alias setup_mouseArea: setup_btn.mouseArea

    property alias newItem: budget_model

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

    Text{
        id: remaining_txt
        text: "You have " + TheBigBudget.getRemainingBudget() + " left to spend!"
        color: "black"
        font.pointSize: 14
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        anchors.top: budget_title.bottom
        anchors.topMargin: 15

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
        width: budget_wrapper.width - 20
        anchors.top: remaining_txt.bottom
        anchors.topMargin: 15
        anchors.bottom: setup_btn.top
        anchors.horizontalCenter: budget_wrapper.horizontalCenter
        color: "transparent"
        Component.onCompleted: {
            for (var i = 0; i < TheBigBudget.getCount(); i++) {
                budget_model.append({ "date":getDate(i), "purchase":getPurchase(i), "amount":getAmount(i) });
            }
        }

        function getDate(i) {
            return {
                date: TheBigBudget.getItemDate(i)
            };
        }
        function getPurchase(i) {
            return {
                purchase: TheBigBudget.getItemPurchase(i)
            };
        }
        function getAmount(i) {
            return {
                amount: TheBigBudget.getItemAmount(i)
            };
        }


        ListModel{
            id: budget_model
        }
        Component
        {
            id: budget_delegate
            Row
            {
                Rectangle{
                    height: 50
                    width: budget_table.width/3
                    color: "light grey"
                    z: -1
                    Text
                    {
                        text: date
                        color: "black"
                        font.pointSize: 10
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: 50
                    width: budget_table.width/3
                    color: "light grey"
                    z: -1
                    Text
                    {
                        text: purchase
                        color: "black"
                        font.pointSize: 10
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    height: 50
                    width: budget_table.width/3
                    color: "light grey"
                    z: -1
                    Text
                    {
                        text: amount
                        color: "black"
                        font.pointSize: 10
                        anchors.centerIn: parent
                    }
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

    //    ListView {
    //         id: listView
    //         anchors.fill: parent
    //         model: listModel
    //         delegate: Rectangle {
    //             width: listView.width
    //             height: listView.height / 10

    //             Text {
    //                 text: date
    //                 anchors.centerIn: parent
    //             }
    //             Text{
    //                 text: purchase
    //                 anchors.centerIn: parent
    //             }
    //             Text{
    //                 text: cost
    //                 anchors.centerIn: parent
    //                 // set color to expense or not expense?
    //             }
    //         }
    //     }

    //     ListModel {
    //         id: listModel

    //         Component.onCompleted: {
    //             for (var i = 0; i < TheBigBudget.getCount(); i++) {
    //                 append(getListElements(i));
    //             }
    //         }

    //         function getListElement(i) {
    //             return {
    //                //date: TheBigBudget.getItemAt(i).getDate()

    //             };
    //         }
    //     }

    // need a way to list all current budgets. may need a control for that.
}

