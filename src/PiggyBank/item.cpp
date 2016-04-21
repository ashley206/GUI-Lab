#include "Item.h"

Item::Item()
{
    m_name = nullptr;
    m_isExpense = true;
    m_amount = 0;
}

Item::Item(char *name, bool expense, int amount)
{
    m_name = new char[strlen(name) + 1];
    strcpy(m_name, name);
    m_isExpense = expense;
    m_amount = amount;
}

Item & Item::operator=(const Item & rhs)
{
    if (this != &rhs)
    {
        if (strlen(rhs.m_name) > strlen(m_name))
        {
            delete[]m_name;
            m_name = new char[strlen(rhs.m_name) + 1];

        }
        strcpy(m_name, rhs.m_name);
    }
    m_amount = rhs.m_amount;
    m_isExpense = rhs.m_isExpense;
    return *this;
}

bool Item::operator==(const Item & rhs)
{
    return ((m_name == rhs.m_name)
        &&
        (m_amount == rhs.m_amount)
        &&
        (m_isExpense == rhs.m_isExpense));
}

void Item::SetName(char * name)
{
    char * temp = new char[strlen(name) + 1];
    strcpy(temp, name);

    delete [] m_name;

    m_name = temp;
}

char * Item::GetName()
{
    return m_name;
}

void Item::SetAmount(int amount)
{
    m_amount = amount;
}

int Item::GetAmount()
{
    return m_amount;
}

bool Item::IsExpense()
{
    return m_isExpense;
}

void Item::SetExpense(bool expense)
{
    m_isExpense = expense;
}

Item::~Item()
{
    delete [] m_name;
    m_amount = 0;
    m_isExpense = false;
}
