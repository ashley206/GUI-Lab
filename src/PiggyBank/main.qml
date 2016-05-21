/********************************
  Name: Ashley Wagner
  Lab:  Lab2
  Project Name: PiggyBank

********************************/

import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
import QtQuick.Window 2.2

Window {
    visible: true
    width: 420
    height: 640

    title: qsTr("PiggyBank")
    //color: "#FAFAFA"      // TODO: Need logo to be transparent

    SplashTitle{
        id: splash_screen
        visible: true
        anchors.fill: parent
        budget_mouseArea.onClicked: {
            splash_screen.visible = false;
            budget_screen.visible = true;
        }

    }

    MyBudget{
        id: budget_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            splash_screen.visible = true;
            budget_screen.visible = false;
        }
        add_mouseArea.onClicked: {
            budget_screen.visible = false;
            add_screen.visible = true;
        }
        setup_mouseArea.onClicked: {
            budget_screen.visible = false;
            //setup_screen.visible = true;
            settings_screen.visible = true;
        }
        categories_mouseArea.onClicked: {
            budget_screen.visible = false;
            categories_screen.visible = true;
        }
    }

    MyAddScreen{
        id: add_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            budget_screen.visible = true;
            add_screen.visible = false;
        }
        addItem_mouseArea.onClicked: {
            add_screen.visible = false;
            addItem_screen.visible = true;
        }
    }

    AddItemScreen{
        id: addItem_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            addItem_screen.visible = false;
            add_screen.visible = true;
        }
        onItemAdded: {
            var date = TheBigBudget.getItemDate(TheBigBudget.getCount() - 1)
            var purchase = TheBigBudget.getItemPurchase(TheBigBudget.getCount() - 1)
            var amount = TheBigBudget.getItemAmount(TheBigBudget.getCount() - 1)
            var category = TheBigBudget.getItemCategory(TheBigBudget.getCount() - 1)
            budget_screen.newItem.append({ "date":date, "purchase":purchase, "amount":amount });
            if(category === "Rent")
                categories_screen.newRentItem.append({ "date":date, "purchase":purchase, "amount":amount });
            function getDate(i) {
                return {date: TheBigBudget.getItemDate(i)};
            }

            function getPurchase(i) {
                return {purchase: TheBigBudget.getItemPurchase(i)};
            }

            function getAmount(i) {
                return {amount: TheBigBudget.getItemAmount(i)};
            }


            // Update remaining budget.
            budget_screen.remainingBudget = TheBigBudget.getRemainingBudget()
        }
    }



    MySettings{
        id: settings_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            budget_screen.visible = true;
            settings_screen.visible = false;
        }
        onBudgetSet: {
            // Update the budget/remaining budget
            budget_screen.totalBudget = enteredBudget;
            budget_screen.remainingBudget = TheBigBudget.getRemainingBudget();
        }
    }

    MyCategories{
        id: categories_screen
        visible: false
        anchors.fill: parent
        back_mouseArea.onClicked: {
            budget_screen.visible = true;
            categories_screen.visible = false;
        }
    }

}



