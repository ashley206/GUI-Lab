#ifndef CATEGORY_H
#define CATEGORY_H
#include <list>
#include <string.h>
#include "Item.h"
using std::list;

class Category
{
public:
    Category(char * name);
    bool operator==(const Category & rhs);
    void AddItem(char * name, bool expense, int amount);
    void RemoveItem(Item * item);
    void SetName(char * name);
    char * GetName();
    void EditItem(Item item, char * name, bool expense, int amount);
    void PurgeItems();
    ~Category();
private:
    char * m_name;
    list<Item *> m_items;
};

#endif // CATEGORY_H
