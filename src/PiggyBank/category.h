#ifndef CATEGORY_H
#define CATEGORY_H
#include <list>
#include <QString>
#include <string.h>
#include "Item.h"
using std::list;

class Category
{
public:
    Category(QString name);
    bool operator==(const Category & rhs);
    void addItem(QString name, bool expense, int amount);
    void removeItem(Item * item);
    void setName(QString name);
    QString getName();
    void editItem(Item item, QString name, bool expense, int amount);
    void purgeItems();
    ~Category();
private:
    QString m_name;
    list<Item *> m_items;
};

#endif // CATEGORY_H
