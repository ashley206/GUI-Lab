#ifndef BUDGET_H
#define BUDGET_H

#include <QString>
#include <QObject>
#include <QDebug>
#include <QtGlobal>
#include <QList>
//#include <QTime>

#include <list>
//#include "Item.h"
#include "Category.h"
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
    void addCategory(QString name);
    void removeCategory(Category * c);
    void purgeCategories();
    QString displayCategoryName(int i);

protected:
    QList<Category *> m_categories;
    int m_budget;
    int m_count;
};

#endif // BUDGET_H
