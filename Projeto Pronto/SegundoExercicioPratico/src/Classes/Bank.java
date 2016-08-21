package Classes;

import java.util.ArrayList;

public class Bank extends Object
{
    /* 
     * Propriedades
     */
    
    private final ArrayList< BankAccount> accounts;
    
    /* Construtores
     * 
     */
    
    public Bank()
    {
        super();
        this.accounts = new ArrayList<>();
    }
    
    /* 
     * Métodos
     */
    
    /*
     * Adiciona uma nova conta no banco
     */
    public void addAccount(BankAccount account)
    {
         this.accounts.add(account);
    }
    
    /*
     *  Obtem o saldo total de todas as contas
     */
    public double getTotalBalance()
    {
      double balance = 0.0;
      for(BankAccount account : this.accounts)
      {
          balance += account.getBalance();
      }
      return balance;
    }
    
    /*
     * Encontra uma conta no banco dado um número de conta
     */
    public BankAccount find(int accountNumber)
    {
        for(BankAccount account : this.accounts)
        {
            if(account.getAccountNumber() == accountNumber)
            {
                return account;
            }
        }
        return null;
    }
    
    /*
     * Devolve a conta de maior saldo
     */
    public BankAccount getMaximum()
    {
        if(accounts.isEmpty())
        {
            return null;
        }
        else
        {
            BankAccount maximumBalanceAccount = this.accounts.get(0);
            for(int index = 1; index < this.accounts.size(); index++)
            {
                BankAccount account = this.accounts.get(index);
                if(account.getBalance() > maximumBalanceAccount.getBalance())
                {
                    maximumBalanceAccount = account;
                }
            }    
            return maximumBalanceAccount;
        }
    }
    
    /*
     * Calcula o número de contas com saldo superior ou igual a um limite
     */
    public int count(int limit)
    {
        int count = 0;
        for(BankAccount account : this.accounts)
        {
            if(account.getBalance() >= limit)
            {
                count++;
            }
        }
        return count;
    }

    /*
     * Devolve a lista de contas
     */
    public ArrayList<BankAccount> getAccounts()
    {
        return this.accounts;
    }
}
