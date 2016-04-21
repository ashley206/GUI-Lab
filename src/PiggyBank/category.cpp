#include "Category.h"

Category::Category(char * name)
{
    m_name = new char[strlen(name) + 1];
    strcpy(m_name, name);
}

bool Category::operator==(const Category & rhs)
{
    bool valid = true;  // assume items are equivalent
    for(int i = 0; i < m_items.size() && valid; i++)
    {
        if(m_items[i] != rhs.m_items[i])
            valid = false;
    }
    return valid;
}
void Category::SetName(char * name)
{
    char * temp = new char[strlen(name) + 1];
    strcpy(temp, name);

    delete [] m_name;

    m_name = temp;
}
char * Category::GetName()
{
    return m_name;
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

Category::EditItem(Item item, char * name, bool expense, int amount)
{
    item.SetName(name);
    item.SetExpense(expense);
    item.SetAmount(amount);
}

Category::~Category()
{
    delete []m_name;
    PurgeItems();
}

void Category::PurgeItems()
{
    for(int i = 0; i < m_items.size(); i++)
    {
        delete m_items[i];
    }
}
