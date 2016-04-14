#ifndef USER_H
#define USER_H


class User
{
public:
    User();
    User(char * name, int budget);
    User( const User & user);
    // Overloading Op=?

    char * getName();
    void setName(char * name);
    int getBudget();
    void setBudget(int budget);

    ~User();
private:
    char * m_name;
    int m_budget;

};

#endif // USER_H
