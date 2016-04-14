#include "categories.h"

Categories::Categories()
{

}


Categories::AddCategory(char * name)
{

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
