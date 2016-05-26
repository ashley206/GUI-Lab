#include "Item.h"

Item::Item()
{
    m_name = "";
    m_isExpense = true;
    m_amount = 0;
}

Item::Item(QString date, QString name, bool expense, double amount, QString category)
{
    m_date = date;
    m_name = name;
    m_isExpense = expense;
    m_amount = amount;
    m_category = category;
}


bool Item::operator==(const Item & rhs)
{
    return ((m_name == rhs.m_name)
        &&
        (m_amount == rhs.m_amount)
        &&
        (m_isExpense == rhs.m_isExpense)
        &&
        (m_date == rhs.m_date)
        &&
        (m_category == rhs.m_category));
}


void Item::setName(QString name)
{
    m_name = name;
}

QString Item::getName()
{
    return m_name;
}

void Item::setDate(QString date)
{
    m_date = date;
}

QString Item::getDate()
{
    return m_date;
}

void Item::setAmount(double amount)
{
    m_amount = amount;
}

double Item::getAmount()
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

void Item::setCategory(QString category)
{
    m_category = category;
}

QString Item::getCategory()
{
    return m_category;
}

Item::~Item()
{
    m_name = "";
    m_amount = 0;
    m_isExpense = false;
    m_date = "";
    m_category = "";
}
