#include "Budget.h"
#include <math.h>

Budget::Budget(): m_budget(0), m_count(0)
{
}

int Budget::getCount()
{
    return m_count;
}

void Budget::setBudget(double budget)
{
    m_budget = budget;
}

double Budget::getBudget()
{
    return (ceilf(m_budget * 100) / 100);
}

double Budget::getAmountSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        // If an expense, add to total spend. Else, "saved".
        total -= m_items[i]->getAmount();
    }
    return total;
}

double Budget::getRemainingBudget()
{
    return m_budget - (ceilf(getAmountSpent() * 100) / 100);
}

Item * Budget::getItemAt(int i)
{
    return m_items.at(i);
}

double Budget::getItemAmount(int i)
{
    return getItemAt(i)->getAmount();
}

QString Budget::getItemPurchase(int i)
{
    return getItemAt(i)->getName();
}

QString Budget::getItemCategory(int i)
{
    return getItemAt(i)->getCategory();
}

QString Budget::getItemDate(int i)
{
    return getItemAt(i)->getDate();
}



void Budget::addItem(QString date, QString name, bool expense, double amnt, QString category)
{
    Item * item = new Item(date, name, expense, amnt, category);
    m_items.push_back(item);
    m_count++;
}



void Budget::editItem(Item item, QString name, bool expense, double amount, QString category)
{
    item.setName(name);
    item.setExpense(expense);
    item.setAmount(amount);
    item.setCategory(category);
}

double Budget::getRentSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        if(m_items[i]->getCategory() == "Rent")
            total += m_items[i]->getAmount();
    }
    return ceilf(total * 100) / 100;
}

double Budget::getUtilitiesSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        if(m_items[i]->getCategory() == "Utilities")
            total += m_items[i]->getAmount();
    }
    return ceilf(total * 100) / 100;
}

double Budget::getGroceriesSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        if(m_items[i]->getCategory() == "Groceries")
            total += m_items[i]->getAmount();
    }
    return ceilf(total * 100) / 100;
}

double Budget::getClothingSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        if(m_items[i]->getCategory() == "Clothing")
            total += m_items[i]->getAmount();
    }
    return ceilf(total * 100) / 100;
}

double Budget::getEatingSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        if(m_items[i]->getCategory() == "Eating Out")
            total += m_items[i]->getAmount();
    }
    return ceilf(total * 100) / 100;
}

double Budget::getGasSpent()
{
    double total = 0;
    for(int i = 0; i < m_count; i++)
    {
        if(m_items[i]->getCategory() == "Gas")
            total += m_items[i]->getAmount();
    }
    return ceilf(total * 100) / 100;
}


Budget::~Budget()
{
}
