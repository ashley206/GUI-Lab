#ifndef CATEGORIES_H
#define CATEGORIES_H
#include "Category.h"
#include <list>
#include <string.h>
#include "Category.h"

using std::list;

class Categories
{
public:
    Categories();
    AddCategory(char * name);
    RemoveCategory(Category c);
    ~Categories();
private:
    list<Category> m_categories;
    int m_count;
};

#endif // CATEGORIES_H
