package Classes;

public class RegularAccount extends BankAccount
{
    /*
     *  Propriedades
     */
    
    private final double specialBalance;
    
    /*
     *  Construtores
     */
    
    public RegularAccount(int accountNumber, String password, String owner, double balance, double specialBalance)
    {
        super(accountNumber,password,owner,balance);
        this.specialBalance = specialBalance;
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
        return this.balance + this.specialBalance;   
    }    
}
