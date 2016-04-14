#ifndef ITEM_H
#define ITEM_H

class Item
{
public:
    Item();
    Item(char * name, bool expense, int amount);
    Item & operator=(const Item & rhs);
    bool operator==(const Item & rhs);
    void setName(char * name);
    char * getName();
    void setAmount(int amount);
    int getAmount();
    bool IsExpense();
    ~Item();
private:
    char * m_name;
    bool m_isExpense = true;
    int m_amount;

};

#endif // ITEM_H
