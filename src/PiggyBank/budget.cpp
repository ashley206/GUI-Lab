#include "Budget.h"

Budget::Budget(): m_budget(0), m_count(0)
{
}

int Budget::getCount()
{
    return m_count;
}

void Budget::addCategory(QString name)
{
    Category * cat = new Category(name);
    m_categories.push_back(cat);
    m_count++;
}

void Budget::removeCategory(Category *c)
{
//    std::list<Category *>::iterator it;
//    bool found = false;
//    for (it = m_categories.begin(); it != m_categories.end(); it++)
//    {
//        if (*it == c)
//        {
//            found = true;
//            m_categories.erase(it++);
//        }
//    }
//    if(found)
//        m_count--;
    if(m_categories.contains(c))
    {
        QList<Category *>::iterator it = m_categories.begin();
        if((*it) == c)
            it = m_categories.erase(it);
        else
            it++;
//        int index = 0;
//        QListIterator<Category *> i(m_categories);
//        if(i.next() != c)
//        {
//            i.next();
//            index++;
//        }
//        m_categories.removeAt(index);
    }
}

void Budget::purgeCategories()
{
    QList<Category *>::iterator it = m_categories.begin();
    while(it != m_categories.end())
        it = m_categories.erase(it++);

//    std::list<Category *>::iterator it;
//    for (it = m_categories.begin(); it != m_categories.end(); it++)
//    {
//        m_categories.erase(it++);
//    }

}

QString Budget::displayCategoryName(int i)
{
    return m_categories.at(i)->getName();
}

Budget::~Budget()
{
    purgeCategories();
}
