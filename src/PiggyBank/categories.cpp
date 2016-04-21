#include "Categories.h"

Categories::Categories()
{

}


Categories::AddCategory(char * name)
{
    Category cat = new Category(name);
    m_categories.push_back(cat);
}

Categories::RemoveCategory(Category c)
{
    std::list<Category>::iterator it;
    for (it = items.begin(); it != items.end(); it++)
    {
        if (*it == c)
            items.erase(it++);
    }
}

Categories::~Categories()
{
    PurgeCategories();
}

void Categories::PurgeCategories()
{
    for(int i = 0; i < m_categories.size(); i++)
    {
        delete m_categories[i];
    }
}
