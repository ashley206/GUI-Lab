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

void User::SetName(char * name)
{
    char * temp = new char[strlen(name) + 1];
    strcpy(temp, name);

    delete [] m_name;

    m_name = temp;
}

char * User::GetName()
{
    return m_name;
}

void User::SetBudget(int budget)
{
    m_budget = budget;
}

int User::GetBudget()
{
    return m_budget;
}

User::~User()
{
    delete[]m_name;
    m_budget = 0;
}
