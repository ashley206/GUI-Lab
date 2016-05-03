# Class Project for CST 238

![Alt text](https://github.com/ashley206/cst-238/blob/master/gui%20project%20logo.png?raw=true)

#Description 

All labs for the Graphical User Interface class, CST 238, are included in this repository. This will build towards a final project of my choosing that will demonstrate my ability to use GUI concepts and tailor them towards a specific project.

The project is a cross platform application that will become a budget application. This application is inteded for users who want to monitor their spending. This is a simple, helpful application that will utilize numerous GUI development techniques. The user will be able to track their transactions and understand their spending habits better. The user's various budget updates will be stored using an SQLite database. 

#Technologies

The project uses the following technologies
Qt, C++, QML, Javascript, SQLite.

#Screenshots/Mockup

This is the main screen, after the splash screen (to be devloped later). This will show current expenses and incomes that have been tracked recently. This could be for the current month of transactions. 

![Alt text](https://github.com/ashley206/cst-238/blob/master/gui%20project%20mockup.png?raw=true)

The History tab (bottom right) will take the user to a screen that lists the previous budgets and amounts spent each month. If over the budget, text will be red. If within the budget, the text will be green. Tapping on a month will take the user to a breakdown of the month's included transactions.

![Alt text](https://github.com/ashley206/cst-238/blob/master/gui%20project%20mockup2.png?raw=true)

The '+' button will add a new transaction, which will lead to this page. The user will define it as an income or expense. They will define a category that the money falls under. Then, the amount to add or remove to the budget. The page will list where the budget currently stands before the changes. Below the line, the budget will be updated budget based on the transaction. 

![Alt text](https://github.com/ashley206/cst-238/blob/master/gui%20project%20mockup3.png?raw=true)

The categories created will be listed here, along with any transactions that have been filed under them. As shown, food transactions will be listed in the food category (groceries, eating out, etc); Any fun activities will be listed in the entertainment category (seeing a movie, going bowling, etc). The user can add however trends they want with the click of a button. 

![Alt text](https://github.com/ashley206/cst-238/blob/master/gui%20project%20mockup4.png?raw=true)

#Progress:

5/2/2016:
Splash Page:

![Alt text](https://github.com/ashley206/cst-238/blob/master/Week%206_splash.PNG?raw=true)

Settings Page: (settings will save after close and keep the last state) 

![Alt text](https://github.com/ashley206/cst-238/blob/master/Week%206_settings.PNG?raw=true)

Add Page:

![Alt text](https://github.com/ashley206/cst-238/blob/master/Week%206_add.PNG?raw=true)

#Installation Instructions

To run the Qt Framework: 
1. Install Qt 5.6
2. Open Project
3. Clean all, run qmake, build all, run

To install the application: 
[ To be determined upon installation creation... ]

#Contribution Guidelines

There will be no other contributors for this project.

#Bugs

Application has not undergone any development, no bugs to report.

#TODO List

TODO: Start the application! The first task will be the splash screen that leads into the app, as well as the home screen. We have not learned much about animations yet, so most of the "flashy" parts of the splash screen will have to wait. 
5/2/2016: Implement C++ code behind for adding items and categories. Make pages for adding items and categories. 

#Contributor List

Ashley Wagner's brain. :)

#Credits, Inspiration, Alternatives

Credits to the group that aided in brainstorming together for possible GUI Project ideas: 
Coryna Johnson
Ryan Williams
Jared Smith
Joseph Maurer

Inspiration came from thinking of simplistic applications that could still be useful as well as fulfill the requirements necessary for the project. Many ideas were given at the brainstorming session, and this one appeared the most interesting. The goal is to make the core of the application invigorating and useful, but also help extend knowledge of the Qt framework to gain the most from the project.

#License

There is no license currently associated with this project.
