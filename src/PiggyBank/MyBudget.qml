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

//    Rectangle{
//        id: budget_table
//        width: budget_wrapper.width
//        anchors.top: budget_title.bottom
//        anchors.topMargin: 15
//        anchors.bottom: setup_btn.top
//        anchors.leftMargin: 10
//        anchors.rightMargin: 10
//        anchors.horizontalCenter: budget_wrapper.horizontalCenter

//        color: "light blue"
//        ListModel{
//            id: budget_model

//            Component.onCompleted: {
//                for (var i = 0; i < 24; i++) {
//                    append(createListElement());
//                }
//            }
//            function createListElement() {
//                return {
//                    hour: "01"
//                };
//            }
//        }
//        Component
//        {
//            id: budget_delegate
//            Row
//            {
//                spacing: parent.width/3
//                Text
//                {
//                    text: hour
//                    anchors.centerIn: parent
//                }
//                Text
//                {
//                    text: "Purchase"
//                    horizontalAlignment: Text.AlignHCenter
//                }
//                Text
//                {
//                    text: "Cost"
//                    horizontalAlignment: Text.AlignHCenter
//                }
//            }
//        }
//        ListView{
//            anchors.fill: parent
//            anchors.leftMargin: 20
//            model: budget_model
//            delegate: budget_delegate
//        }
//    }
    ListView {
         id: listView
         anchors.fill: parent
         model: listModel
         delegate: Rectangle {
             width: listView.width
             height: listView.height / 10

             Text {
                 text: date
                 anchors.centerIn: parent
             }
             Text{
                 text: purchase
                 anchors.centerIn: parent
             }
             Text{
                 text: cost
                 anchors.centerIn: parent
                 // set color to expense or not expense?
             }
         }
     }

     ListModel {
         id: listModel

         Component.onCompleted: {
             for (var i = 0; i < TheBigBudget.getCount(); i++) {
                 append(getListElements(i));
             }
         }

         function getListElement(i) {
             return {
                //date: TheBigBudget.getItemAt(i).getDate()

             };
         }
     }

    // need a way to list all current budgets. may need a control for that.
}

