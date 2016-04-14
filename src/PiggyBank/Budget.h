#ifndef BUDGET_H
#define BUDGET_H

#include <list>
#include "Item.h";

using std::list;

class Budget
{
public:

protected:
    list<Item> m_items;
    int m_budget;
};

#endif // BUDGET_H
