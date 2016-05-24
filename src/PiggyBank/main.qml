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

    property bool colorBlind_Checked: false

    SplashTitle{
        id: splash_screen
        visible: true
        anchors.fill: parent

        colorBlind_Checked: settings_screen.colorBlind_Checked

        budget_mouseArea.onClicked: {
            splash_screen.visible = false;
            budget_screen.visible = true;
        }
    }

    MyBudget{
        id: budget_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            splash_screen.visible = true;
            budget_screen.visible = false;
        }
        add_mouseArea.onClicked: {
            budget_screen.visible = false;
            addItem_screen.visible = true;
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

//    MyAddScreen{
//        id: add_screen
//        visible: false
//        anchors.fill: parent
//        back_mouseArea.onClicked: {
//            budget_screen.visible = true;
//            add_screen.visible = false;
//        }
//        addItem_mouseArea.onClicked: {
//            add_screen.visible = false;
//            addItem_screen.visible = true;
//        }
//    }

    AddItemScreen{
        id: addItem_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            addItem_screen.visible = false;
            budget_screen.visible = true;
        }
        onItemAdded: {
            var date = TheBigBudget.getItemDate(TheBigBudget.getCount() - 1)
            var purchase = TheBigBudget.getItemPurchase(TheBigBudget.getCount() - 1)
            var amount = TheBigBudget.getItemAmount(TheBigBudget.getCount() - 1)
            var category = TheBigBudget.getItemCategory(TheBigBudget.getCount() - 1)
            budget_screen.newItem.append({ "date":date, "purchase":purchase, "amount":amount });
            if(category === "Rent"){
                rentCategory_screen.newRentItem.append({ "date":date, "purchase":purchase, "amount":amount });
                categories_screen.rentSpent = TheBigBudget.getRentSpent()
            }
            else if(category === "Utilities"){
                utilitiesCategory_screen.newUtilitiesItem.append({ "date":date, "purchase":purchase, "amount":amount });
                categories_screen.utilitiesSpent = TheBigBudget.getUtilitiesSpent()
            }
            else if(category === "Groceries"){
                groceriesCategory_screen.newGroceriesItem.append({ "date":date, "purchase":purchase, "amount":amount });
                categories_screen.groceriesSpent = TheBigBudget.getGroceriesSpent()
            }
            else if(category === "Clothing"){
                clothingCategory_screen.newClothingItem.append({ "date":date, "purchase":purchase, "amount":amount });
                categories_screen.clothingSpent = TheBigBudget.getClothingSpent()
            }
            else if(category === "Eating Out"){
                eatingCategory_screen.newEatingItem.append({ "date":date, "purchase":purchase, "amount":amount });
                categories_screen.eatingSpent = TheBigBudget.getEatingSpent()
            }
            else if(category === "Gas"){
                gasCategory_screen.newGasItem.append({ "date":date, "purchase":purchase, "amount":amount });
                categories_screen.gasSpent = TheBigBudget.getGasSpent()
            }

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
            addItem_screen.visible = false;
            budget_screen.visible = true;
        }
    }



    MySettings{
        id: settings_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            budget_screen.visible = true;
            settings_screen.visible = false;
        }
        onSettingsSave: {
            // Update the budget/remaining budget
            TheBigBudget.setBudget(enteredBudget);
            budget_screen.totalBudget = TheBigBudget.getBudget();
            budget_screen.remainingBudget = TheBigBudget.getRemainingBudget();

            settings_screen.visible = false;
            budget_screen.visible = true;


        }
    }

    MyCategories{
        id: categories_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            budget_screen.visible = true;
            categories_screen.visible = false;
        }
        rent_mouseArea.onClicked: {
            rentCategory_screen.visible = true;
            categories_screen.visible = false;
        }
        utilities_mouseArea.onClicked: {
            utilitiesCategory_screen.visible = true;
            categories_screen.visible = false;
        }
        groceries_mouseArea.onClicked: {
            groceriesCategory_screen.visible = true;
            categories_screen.visible = false;
        }
        clothing_mouseArea.onClicked: {
            clothingCategory_screen.visible = true;
            categories_screen.visible = false;
        }
        eating_mouseArea.onClicked: {
            eatingCategory_screen.visible = true;
            categories_screen.visible = false;
        }
        gas_mouseArea.onClicked: {
            gasCategory_screen.visible = true;
            categories_screen.visible = false;
        }
    }

    RentCategory{
        id: rentCategory_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            categories_screen.visible = true;
            rentCategory_screen.visible = false;
        }
    }

    UtilitiesCategory{
        id: utilitiesCategory_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            categories_screen.visible = true;
            utilitiesCategory_screen.visible = false;
        }
    }

    GroceriesCategory{
        id: groceriesCategory_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            categories_screen.visible = true;
            groceriesCategory_screen.visible = false;
        }
    }

    ClothingCategory{
        id: clothingCategory_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            categories_screen.visible = true;
            clothingCategory_screen.visible = false;
        }
    }

    EatingOutCategory{
        id: eatingCategory_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            categories_screen.visible = true;
            eatingCategory_screen.visible = false;
        }
    }

    GasCategory{
        id: gasCategory_screen
        visible: false
        anchors.fill: parent
        colorBlind_Checked: settings_screen.colorBlind_Checked

        back_mouseArea.onClicked: {
            categories_screen.visible = true;
            gasCategory_screen.visible = false;
        }
    }
}



