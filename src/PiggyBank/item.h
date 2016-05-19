#ifndef ITEM_H
#define ITEM_H
#include <QString>

#include <QtGlobal>
class Item
{


public:
    Item();
    Item(QString date, QString name, bool expense, double amount);
    //Item & operator=(const Item & rhs);
    bool operator==(const Item & rhs);
    //bool operator!=(const Item & rhs);
    void setName(QString name);
    QString getName();
    void setDate(QString date);
    QString getDate();
    void setAmount(double amount);
    double getAmount();
    bool isExpense();
    void setExpense(bool expense);
    ~Item();
private:
    QString m_date;
    QString m_name;
    bool m_isExpense = true;
    double m_amount;

};

#endif // ITEM_H
