#include "Category.h"

Category::Category(QString name)
{
    m_name = name;
}

bool Category::operator==(const Category & rhs)
{
    return (m_items == rhs.m_items && m_name == rhs.m_name);
//    std::list<Item *>::iterator it;
//    for (it = m_items.begin(); it != m_items.end() && valid; it++)
//    {
//       std::list<Item *>::iterator it2;
//       for(it2 = const_cast<Category>(rhs).m_items.begin(); it2 != rhs.m_items.end(); it2++)
//       {
//           if(it == it2)
//               valid = false;
//       }
//    }

}
void Category::setName(QString name)
{
//    char * temp = new char[strlen(name) + 1];
//    strcpy(temp, name);

//    delete [] m_name;

    m_name = name;
}
QString Category::getName()
{
    return m_name;
}

void Category::addItem(QString name, bool expense, int amount)
{
    Item * item = new Item(name, expense, amount);
    m_items.push_back(item);
}

void Category::removeItem(Item * item)
{
    std::list<Item *>::iterator it;
    for (it = m_items.begin(); it != m_items.end(); it++)
    {
        if (*it == item)
            m_items.erase(it++);
    }
}

void Category::editItem(Item item, QString name, bool expense, int amount)
{
    item.setName(name);
    item.setExpense(expense);
    item.setAmount(amount);
}

Category::~Category()
{
    m_name = "";
    purgeItems();
}

void Category::purgeItems()
{
    for(int i = 0; i < m_items.size(); i++)
    {
        //delete m_items[i];
    }
}
