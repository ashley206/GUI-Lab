#ifndef USER_H
#define USER_H


class User
{
public:
    User();
    User(char * name, int budget);
    User( const User & user);
    // Overloading Op=?

    char * GetName();
    void SetName(char * name);
    int GetBudget();
    void SetBudget(int budget);

    ~User();
private:
    char * m_name;
    int m_budget;

};

#endif // USER_H
