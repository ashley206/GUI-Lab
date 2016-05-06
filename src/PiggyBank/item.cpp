#include "Item.h"

Item::Item()
{
    m_name = "";
    m_isExpense = true;
    m_amount = 0;
}

Item::Item(QString name, bool expense, int amount)
{
    //m_name = new char[strlen(name) + 1];
    m_name = name;
    //strcpy(m_name, name);
    m_isExpense = expense;
    m_amount = amount;
}

//Item & Item::operator=(const Item & rhs)
//{
//    if (this != &rhs)
//    {
//        if (strlen(rhs.m_name) > strlen(m_name))
//        {
//            delete[]m_name;
//            m_name = new char[strlen(rhs.m_name) + 1];

//        }
//        strcpy(m_name, rhs.m_name);
//    }
//    m_amount = rhs.m_amount;
//    m_isExpense = rhs.m_isExpense;
//    return *this;
//}

bool Item::operator==(const Item & rhs)
{
    return ((m_name == rhs.m_name)
        &&
        (m_amount == rhs.m_amount)
        &&
        (m_isExpense == rhs.m_isExpense));
}

void Item::setName(QString name)
{
    m_name = name;
}

QString Item::getName()
{
    return m_name;
}

void Item::setAmount(int amount)
{
    m_amount = amount;
}

int Item::getAmount()
{
    return m_amount;
}

bool Item::isExpense()
{
    return m_isExpense;
}

void Item::setExpense(bool expense)
{
    m_isExpense = expense;
}

Item::~Item()
{
    m_name = "";
    m_amount = 0;
    m_isExpense = false;
}
