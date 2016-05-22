#ifndef BUDGET_H
#define BUDGET_H

#include <QString>
#include <QObject>
#include <QDebug>
#include <QtGlobal>
#include <QList>
//#include <QTime>

#include <list>
#include "Item.h"
//#include "Category.h"
#include <string.h>
using std::list;

enum Categories {RENT, UTILITIES, CLOTHING, EATING_OUT, GROCERIES, GAS, INCOME};

class Budget : public QObject
{
    Q_OBJECT

public:
    Budget();
    ~Budget();
public slots:
    int getCount();
    void setBudget(double budget);
    double getBudget();
    double getAmountSpent();
    double getRemainingBudget();
    void addItem(QString date, QString name, bool expense, double amnt, QString category);
    void editItem(Item item, QString name, bool expense, double amount, QString category);

    Item * getItemAt(int i);

    double getItemAmount(int i);
    QString getItemPurchase(int i);
    QString getItemDate(int i);
    QString getItemCategory(int i);

    double getRentSpent();
    double getUtilitiesSpent();
    double getGroceriesSpent();
    double getClothingSpent();
    double getEatingSpent();
    double getGasSpent();

    //void addCategory(QString name);
    //void removeCategory(Category * c);
    //void purgeCategories();
    //QString displayCategoryName(int i);

protected:
    QList<Item *> m_items;
    //QList<Category *> m_categories;
    double m_budget;
    int m_count;
};

#endif // BUDGET_H
