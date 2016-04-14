#include "category.h"

Category::Category()
{

}

bool Category::operator==(const Category & rhs)
{
    // todo
    //bool equal
}

void Category::AddItem(char * name, bool expense, int amount)
{
    Item item = new Item(name, expense, amount);
    m_items.push_back(item);
}

void Category::RemoveItem(Item item)
{
    std::list<Item>::iterator it;
    for (it = items.begin(); it != items.end(); it++)
    {
        if (*it == item)
            items.erase(it++);
    }
}

Category::EditItem(Item item)
{

}
