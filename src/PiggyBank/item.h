#ifndef ITEM_H
#define ITEM_H
#include <QString>

#include <QtGlobal>
class Item
{


public:
    Item();
    Item(QString name, bool expense, int amount);
    //Item & operator=(const Item & rhs);
    bool operator==(const Item & rhs);
    void setName(QString name);
    QString getName();
    void setAmount(int amount);
    int getAmount();
    bool isExpense();
    void setExpense(bool expense);
    ~Item();
private:
    QString m_name;
    bool m_isExpense = true;
    int m_amount;

};

#endif // ITEM_H
