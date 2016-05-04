#ifndef BUDGET_H
#define BUDGET_H

#include <QObject>
#include <QDebug>
#include <QtGlobal>
//#include <QTime>

#include <list>
#include "Item.h"
#include "Category.h"
#include <string.h>
using std::list;

class Budget : public QObject
{
    Q_OBJECT

public:
    Budget();
    void AddCategory(char * name);
    void RemoveCategory(Category * c);
    void PurgeCategories();

    ~Budget();
protected:
    list<Category *> m_categories;
    int m_budget;
    int m_count;
};

#endif // BUDGET_H
