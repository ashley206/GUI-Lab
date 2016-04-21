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
    void AddItem(char * name, bool expense, int amount);
    void RemoveItem(Item item);
    void SetName(char * name);
    char * GetName();
    EditItem(Item item);
    ~Category();
private:
    char * m_name;
    list<Item> m_items;
};

#endif // CATEGORY_H
