import QtQuick 2.0
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

Rectangle{
    id: add_item_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: add_item_title.back_btn_mouseArea
    property bool isExpense: expense_box.currentIndex === 0 ? true : false
    signal itemAdded

    MyTitleBar{
        id: add_item_title
        title: "Add Item"
        back_visible: true
    }

    Text{
        id: category_txt
        text: "What category?"
        font.pointSize: 11
        color: "black"
        anchors.top: add_item_title.bottom
        anchors.topMargin: 15
        anchors.left: add_item_wrapper.left
        anchors.leftMargin: 10
    }

    ComboBox{
        id: category_box
        editable: false
        anchors.top: category_txt.bottom
        anchors.topMargin:5
        anchors.left: add_item_wrapper.left
        anchors.leftMargin: 20

        width: parent.width/3
        model: ListModel{
            id: category_model
            ListElement{ text: "Rent"; }
            ListElement{ text: "Utilities"; }
            ListElement{ text: "Groceries"; }
            ListElement{ text: "Eating Out"; }
            ListElement{ text: "Clothing"; }
            ListElement{ text: "Gas"; }
        }
    }

    Text{
        id: expense_txt
        text: "What kind of purchase?"
        font.pointSize: 11
        color: "black"
        anchors.top: category_box.bottom
        anchors.topMargin: 15
        anchors.left: add_item_wrapper.left
        anchors.leftMargin: 10
    }

    ComboBox{
        id: expense_box
        editable: false
        anchors.top: expense_txt.bottom
        anchors.topMargin:5
        anchors.left: add_item_wrapper.left
        anchors.leftMargin: 20

        width: parent.width/3
        model: ListModel{
            id: expense_model
            ListElement{ text: "Expense"; }
            ListElement{ text: "Income"; }
        }
    }

    Text{
        id: purchase_txt
        text: "What was the purchase?"
        font.pointSize: 11
        color: "black"
        anchors.top: expense_box.bottom
        anchors.topMargin: 20
        anchors.left: add_item_wrapper.left
        anchors.leftMargin: 10
    }

    TextField{
        id: purchase_ti
        height: expense_txt.height
        width: 9*(parent.width/10)
        placeholderText: "Description"
        anchors.top: purchase_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text{
        id: amount_txt
        text: "How much did it cost?"
        font.pointSize: 11
        anchors.top: purchase_ti.bottom
        anchors.topMargin: 20
        anchors.left: add_item_wrapper.left
        anchors.leftMargin: 10
    }

    TextField{
        id: amount_tf
        height: amount_txt.height
        width: 9*(parent.width/10)
        placeholderText: "Enter amount"
        text: ""
        anchors.top: amount_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        // Ensure they enter a number that has two decimals and is at least 0.00
        validator: DoubleValidator{
            bottom: 0.00
            notation: "StandardNotation"
            decimals: 2
        }
    }

    MyButton{
        id: done_btn
        text: "Submit"
        fontSize: 14
        textColor: "white"
        height: parent.height/10
        width: 2*parent.width/3
        anchors.top: amount_tf.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        color: add_item_title.color
        mouseArea.onClicked: {
            if(amount_tf.text > 0){
                var category = category_box.currentText;
                var date = new Date();
                var dd = date.getDate();
                var mm = date.getMonth()+1; //January is 0!
                var yyyy = date.getFullYear();
                if(dd<10) {
                    dd='0'+dd
                }
                if(mm<10) {
                    mm='0'+mm
                }
                date = mm+'/'+dd+'/'+yyyy;

                // If it's an expense, make it negative
                if(isExpense)
                    amount_tf.text = '-' + amount_tf.text;
                else
                    category = "Income";
                console.log(amount_tf.text)
                TheBigBudget.addItem(date,
                                     purchase_ti.text,
                                     isExpense,
                                     amount_tf.text,
                                     category);
                console.log(category);
                amount_tf.text = "";
                itemAdded();

            }
        }
    }
}
