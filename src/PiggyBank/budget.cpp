#include "Budget.h"

Budget::Budget(): m_budget(0), m_count(0)
{

}

void Budget::AddCategory(char *name)
{
    Category * cat = new Category(name);
    m_categories.push_back(cat);
    m_count++;
}

void Budget::RemoveCategory(Category *c)
{
    std::list<Category *>::iterator it;
    bool found = false;
    for (it = m_categories.begin(); it != m_categories.end(); it++)
    {
        if (*it == c)
        {
            found = true;
            m_categories.erase(it++);
        }
    }
    if(found)
        m_count--;
}

void Budget::PurgeCategories()
{
    std::list<Category *>::iterator it;
    for (it = m_categories.begin(); it != m_categories.end(); it++)
    {
        m_categories.erase(it++);
    }
}

Budget::~Budget()
{
    PurgeCategories();
}
