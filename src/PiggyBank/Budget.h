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

    void addItem(QString date, QString name, bool expense, double amnt);
    void removeItem(Item * item);
    void editItem(Item item, QString name, bool expense, double amount);

    Item * getItemAt(int i);

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
