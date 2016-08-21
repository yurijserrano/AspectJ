package Classes;

import java.util.Date;

public abstract class LawAccount extends BankAccount
{
    /*
     *  Propriedades
     */
    
    @SuppressWarnings("unused")
	private final String aim;
    @SuppressWarnings("unused")
	private final Date start, end;
    private final double admFee;
    
    /*
     *  Construtores
     */
    
    public LawAccount(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee)
    {
        super(accountNumber,password,owner,balance); 
        this.aim = aim;
        this.start = start;
        this.end = end;
        this.admFee = admFee;
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
        return this.balance * (1 - this.admFee / 100);
    }
}