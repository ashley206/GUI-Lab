import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle{
    id: setup_wrapper
    anchors.fill: parent
    color: "transparent"

    property alias back_mouseArea: setup_title.back_btn_mouseArea
    property int enteredBudget: 0
    signal budgetSet

    MyTitleBar{
        id: setup_title
        title: "Setup"
        back_visible: true
    }

    Text{
        id: budget_txt
        text: "What do you want your budget to be?"
        font.pointSize: 11
        anchors.top: setup_title.bottom
        anchors.topMargin: 15
        anchors.left: setup_wrapper.left
        anchors.leftMargin: 10
    }

    TextField{
        id: budget_tf
        height: budget_txt.height
        width: 9*(parent.width/10)
        placeholderText: "Enter budget amount"
        anchors.top: budget_txt.bottom
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
        id: setup_save
        text: "Save Changes"
        textColor: "white"
        color: setup_title.color
        height: parent.height/10
        width: 9*(parent.width/10)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        mouseArea.onClicked: {
            enteredBudget = budget_tf.text;
            TheBigBudget.setBudget(enteredBudget);
            console.log("Set the budget to: ", TheBigBudget.getBudget());

            budgetSet();
        }
    }
}
