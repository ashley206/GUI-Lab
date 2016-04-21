#ifndef BUDGET_H
#define BUDGET_H

#include <list>
#include "Item.h";

using std::list;

class Budget
{
public:
    Budget();
protected:
    list<Categories> m_budget;
    int m_budget;
};

#endif // BUDGET_H
