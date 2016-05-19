import QtQuick 2.0

Rectangle{
    id: add_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: add_title.back_btn_mouseArea
   // property alias addCategory_mouseArea: add_category_btn.mouseArea
    property alias addItem_mouseArea: add_item_btn.mouseArea

    MyTitleBar{
        id: add_title
        title: "Add"
        back_visible: true
    }

    // add either an item or a category

    MyButton{
        id: add_item_btn
        y: 130
        text: "Add Item"
        textColor: "white"
        fontSize: 24
        height: parent.height/5
        width: 2*(parent.width/3)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: add_title.bottom
        anchors.topMargin: 15
        color: add_title.color
        mouseArea.onClicked: {
            console.log("You clicked add item.")

        }

    }

//    MyButton{
//        id: add_category_btn
//        text: "Add Category"
//        textColor: "white"
//        height: parent.height/5
//        width: 2*(parent.width/3)
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: add_item_btn.bottom
//        anchors.topMargin: 15
//        color: add_title.color
//        mouseArea.onClicked: {
//            console.log("You clicked add category.")
////            console.log(TheBigBudget.GetCount());
////            TheBigBudget.addCategory("blahhh");
////            console.log(TheBigBudget.GetCount());

//        }
    //}
}
