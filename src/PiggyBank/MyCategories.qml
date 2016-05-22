import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle{
    id: my_categories_wrapper
    anchors.fill: parent
    color: "transparent"
    property int size: 13
    property alias back_mouseArea: categories_title.back_btn_mouseArea
    property alias rent_mouseArea: rent_mouseArea
    property double rentSpent: TheBigBudget.getRentSpent()

    property alias utilities_mouseArea: utilities_mouseArea
    property double  utilitiesSpent: TheBigBudget.getUtilitiesSpent()

    property alias groceries_mouseArea: groceries_mouseArea
    property double groceriesSpent: TheBigBudget.getGroceriesSpent()

    property alias clothing_mouseArea: clothing_mouseArea
    property double clothingSpent: TheBigBudget.getClothingSpent()

    property alias eating_mouseArea: eating_mouseArea
    property double eatingSpent: TheBigBudget.getEatingSpent()

    property alias gas_mouseArea: gas_mouseArea
    property double gasSpent: TheBigBudget.getGasSpent()

    MyTitleBar{
        id: categories_title
        title: "My Categories"
        back_visible: true
    }

// RENT
    Rectangle{
        id: rent_wrapper
        height: my_categories_wrapper.height/10
        width: 9*my_categories_wrapper.width/10
        color: "transparent"
        anchors.top: categories_title.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: my_categories_wrapper.horizontalCenter
        z: -1
        MyButton{
            id: rent_btn
            text: "Rent"
            textColor: "white"
            fontSize: size
            height: rent_wrapper.height
            width: 4*rent_wrapper.width/10
            anchors.top: rent_wrapper.top
            anchors.left: rent_wrapper.left
            anchors.right: rent_amount_btn.left
            anchors.rightMargin: -10
        }
        MyButton{
            id: rent_amount_btn
            text: "$" + rentSpent
            textColor: "white"
            fontSize: size
            height: rent_wrapper.height
            width: 6*rent_wrapper.width/10
            anchors.top: rent_wrapper.top

            anchors.right: rent_wrapper.right
        }
        MouseArea{
            id: rent_mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }
// UTILITIES
    Rectangle{
        id: utilities_wrapper
        height: my_categories_wrapper.height/10
        width: 9*my_categories_wrapper.width/10
        color: "transparent"
        anchors.top: rent_wrapper.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: my_categories_wrapper.horizontalCenter
        z: -1
        MyButton{
            id: utilities_btn
            text: "Utilities"
            textColor: "white"
            fontSize: size
            height: utilities_wrapper.height
            width: 4*utilities_wrapper.width/10
            anchors.top: utilities_wrapper.top
            anchors.left: utilities_wrapper.left
            anchors.right: utilities_amount_btn.left
            anchors.rightMargin: -10
        }
        MyButton{
            id: utilities_amount_btn
            text: "$" + utilitiesSpent
            textColor: "white"
            fontSize: size
            height: utilities_wrapper.height
            width: 6*utilities_wrapper.width/10
            anchors.top: utilities_wrapper.top
            anchors.right: utilities_wrapper.right
        }
        MouseArea{
            id: utilities_mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }

// GROCERIES
    Rectangle{
        id: groceries_wrapper
        height: my_categories_wrapper.height/10
        width: 9*my_categories_wrapper.width/10
        color: "transparent"
        anchors.top: utilities_wrapper.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: my_categories_wrapper.horizontalCenter
        z: -1
        MyButton{
            id: groceries_btn
            text: "Groceries"
            textColor: "white"
            fontSize: size
            height: groceries_wrapper.height
            width: 4*groceries_wrapper.width/10
            anchors.top: groceries_wrapper.top
            anchors.left: groceries_wrapper.left
            anchors.right: groceries_amount_btn.left
            anchors.rightMargin: -10
        }
        MyButton{
            id: groceries_amount_btn
            text: "$" + groceriesSpent
            textColor: "white"
            fontSize: size
            height: groceries_wrapper.height
            width: 6*groceries_wrapper.width/10
            anchors.top: groceries_wrapper.top
            anchors.right: groceries_wrapper.right
        }
        MouseArea{
            id: groceries_mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }

// CLOTHING
    Rectangle{
        id: clothing_wrapper
        height: my_categories_wrapper.height/10
        width: 9*my_categories_wrapper.width/10
        color: "transparent"
        anchors.top: groceries_wrapper.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: my_categories_wrapper.horizontalCenter
        z: -1
        MyButton{
            id: clothing_btn
            text: "Clothing"
            textColor: "white"
            fontSize: size
            height: clothing_wrapper.height
            width: 4*clothing_wrapper.width/10
            anchors.top: clothing_wrapper.top
            anchors.left: clothing_wrapper.left
            anchors.right: clothing_amount_btn.left
            anchors.rightMargin: -10
        }
        MyButton{
            id: clothing_amount_btn
            text: "$" + clothingSpent
            textColor: "white"
            fontSize: size
            height: clothing_wrapper.height
            width: 6*clothing_wrapper.width/10
            anchors.top: clothing_wrapper.top
            anchors.right: clothing_wrapper.right
        }
        MouseArea{
            id: clothing_mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }

// EATING OUT
    Rectangle{
        id: eating_wrapper
        height: my_categories_wrapper.height/10
        width: 9*my_categories_wrapper.width/10
        color: "transparent"
        anchors.top: clothing_wrapper.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: my_categories_wrapper.horizontalCenter
        z: -1
        MyButton{
            id: eating_btn
            text: "Eating"
            textColor: "white"
            fontSize: size
            height: eating_wrapper.height
            width: 4*eating_wrapper.width/10
            anchors.top: eating_wrapper.top
            anchors.left: eating_wrapper.left
            anchors.right: eating_amount_btn.left
            anchors.rightMargin: -10
        }
        MyButton{
            id: eating_amount_btn
            text: "$" + eatingSpent
            textColor: "white"
            fontSize: size
            height: eating_wrapper.height
            width: 6*eating_wrapper.width/10
            anchors.top: eating_wrapper.top
            anchors.right: eating_wrapper.right
        }
        MouseArea{
            id: eating_mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }

// GAS
    Rectangle{
        id: gas_wrapper
        height: my_categories_wrapper.height/10
        width: 9*my_categories_wrapper.width/10
        color: "transparent"
        anchors.top: eating_wrapper.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: my_categories_wrapper.horizontalCenter
        z: -1
        MyButton{
            id: gas_btn
            text: "Gas"
            textColor: "white"
            fontSize: size
            height: gas_wrapper.height
            width: 4*gas_wrapper.width/10
            anchors.top: gas_wrapper.top
            anchors.left: gas_wrapper.left
            anchors.right: gas_amount_btn.left
            anchors.rightMargin: -10
        }
        MyButton{
            id: gas_amount_btn
            text: "$" + gasSpent
            textColor: "white"
            fontSize: size
            height: gas_wrapper.height
            width: 6*gas_wrapper.width/10
            anchors.top: gas_wrapper.top
            anchors.right: gas_wrapper.right
        }
        MouseArea{
            id: gas_mouseArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }
}

