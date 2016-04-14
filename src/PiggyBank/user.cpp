#include "User.h"

User::User()
{
    m_name = nullptr;
    m_budget = 0;
}

User::User(char *name, int budget)
{
    m_name = new char[strlen(name) + 1];
    strcpy(m_name, name);
    m_budget = budget;
}

User::User( const User & user)
{
    char * m_name = new char[strlen(user.m_name) + 1];
    strcpy(m_name, user.m_name);
    m_budget = user.m_budget;
}

void User::setName(char *name)
{
    char * str = new char[strlen(name) + 1];
    strcpy(str, name);
}

char * User::getName()
{
    return m_name;
}

void User::setBudget(int budget)
{
    m_budget = budget;
}

int User::getBudget()
{
    return m_budget;
}

User::~User()
{
    delete[]m_name;
    m_budget = 0;
}
