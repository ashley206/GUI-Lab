#ifndef BUDGET_H
#define BUDGET_H

#include <list>
#include "Item.h"
#include "Categories.h"
#include <string.h>

using std::list;

class Budget
{
public:
    Budget();
protected:
    list<Categories *> m_categories_list;
    int m_budget;
};

#endif // BUDGET_H
