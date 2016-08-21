package Classes;

public class SavingsAccount extends BankAccount
{
    /*
     *  Propriedades
     */
    
    private final double interestRate;

    /*
     *  Construtores
     */
    
    public SavingsAccount(int accountNumber, String password, String owner, double balance, double interestRate)
    {
        super(accountNumber,password,owner,balance); 
        this.interestRate = interestRate;
    }

    /*
     *  Métodos(non-Javadoc)
     * @see Classes.BankAccount#getBalance()
     */
    
    /*
     *  Consulta o saldo da conta(non-Javadoc)
     * @see Classes.BankAccount#getBalance()
     */
    @Override
    public double getBalance()
    {
        return this.balance * (1 + this.interestRate);
    }
}