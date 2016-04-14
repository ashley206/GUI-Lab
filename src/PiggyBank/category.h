#ifndef CATEGORY_H
#define CATEGORY_H
#include <list>
#include <string.h>
#include "Item.h"
using std::list;

class Category
{
public:
    Category();
    void AddItem(char * name, bool expense, int amount);
    void RemoveItem(Item item);
    EditItem(Item item);
private:
    list<Item> m_items;
};

#endif // CATEGORY_H
