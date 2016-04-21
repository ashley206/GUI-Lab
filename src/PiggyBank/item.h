#ifndef ITEM_H
#define ITEM_H

class Item
{
public:
    Item();
    Item(char * name, bool expense, int amount);
    Item & operator=(const Item & rhs);
    bool operator==(const Item & rhs);
    void SetName(char * name);
    char * GetName();
    void SetAmount(int amount);
    int GetAmount();
    bool IsExpense();
    void SetExpense(bool expense);
    ~Item();
private:
    char * m_name;
    bool m_isExpense = true;
    int m_amount;

};

#endif // ITEM_H
