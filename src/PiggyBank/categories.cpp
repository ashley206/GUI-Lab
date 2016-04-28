#include "Categories.h"

Categories::Categories()
{

}


void Categories::AddCategory(char * name)
{
    Category * cat = new Category(name);
    m_categories.push_back(cat);
}

void Categories::RemoveCategory(Category * c)
{
    std::list<Category *>::iterator it;
    for (it = m_categories.begin(); it != m_categories.end(); it++)
    {
        if (*it == c)
            m_categories.erase(it++);
    }
}

Categories::~Categories()
{
    PurgeCategories();
}

void Categories::PurgeCategories()
{
    std::list<Category *>::iterator it;
    for (it = m_categories.begin(); it != m_categories.end(); it++)
    {
        m_categories.erase(it++);
    }
}
