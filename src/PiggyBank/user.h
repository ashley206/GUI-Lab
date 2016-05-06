#ifndef USER_H
#define USER_H
#include <string.h>
#include <QObject>
#include <QDebug>
#include <QtGlobal>
#include <QString>
class User
{
public:
    User();
    User(QString name, int budget);
    User( const User & user);
    // Overloading Op=?

    QString GetName();
    void SetName(QString name);
    int GetBudget();
    void SetBudget(int budget);

    ~User();
private:
    QString m_name;
    int m_budget;

};

#endif // USER_H
