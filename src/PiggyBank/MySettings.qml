import QtQuick 2.0
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0



Rectangle{
    id: settings_root
    anchors.fill: parent
    color: "transparent"
    property alias back_mouseArea: settings_title.back_btn_mouseArea
    signal budgetSet
    property int enteredBudget: 0
    Settings{
        id: settings_global
        property alias colorblind: colorblind_switch.checked
        property alias currency: currency_box.currentIndex
       //property int enteredBudget: 0

    }

    MyTitleBar{
        id: settings_title
        title: "Settings"
        titleSize: 20
        back_visible: true
    }


    Text{
        id: budget_txt
        text: "What do you want your budget to be?"
        font.pointSize: 11
        anchors.top: settings_title.bottom
        anchors.topMargin: 15
        anchors.left: settings_root.left
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
        fontSize: 14
        //color: setup_title.color
        height: parent.height/10
        width: 9*(parent.width/10)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        mouseArea.onClicked: {
            enteredBudget = budget_tf.text;
            TheBigBudget.setBudget(enteredBudget);
            console.log("Set the budget to: ", TheBigBudget.getBudget());
            budget_tf.text = "";    //clear the text
            budgetSet();
        }
    }


    Text{
        id: colorblind_txt
        text: "Colorblind mode"
        anchors.horizontalCenterOffset: 1
        font.pointSize: 11
        anchors.top: budget_tf.bottom
        anchors.topMargin: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Switch{
        id: colorblind_switch
        anchors.top: colorblind_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        checked: false
    }

    Text{
        id: currency_txt
        text: "Currency"
        font.pointSize: 11
        anchors.top: colorblind_switch.bottom
        anchors.topMargin: 15
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    ComboBox{
        id: currency_box
        editable: false
        model: ListModel{
            id: currency_model
            ListElement{ text: "USD"; }
            ListElement{ text: "GBP"; }
            ListElement{ text: "EUR"; }
        }
        // On accepted, change setting?
        width: parent.width/5
        anchors.top: currency_txt.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

}



