package Classes;

public abstract class BankAccount extends Object
{
    /*
     *  Propriedades
     */
    
    private final int accountNumber;
    private final String password;
    private final String owner;
    protected double balance;
    
    /*
     * Construtores
     */

    public BankAccount(int accountNumber, String password, String owner, double balance)
    {
        super();
        this.accountNumber = accountNumber;
        this.password = password;
        this.owner = owner;
        this.balance = balance;
    }

    /*
     *  Métodos
     */
    
    /*
     *  Deposita valor na conta bancária
     */
    public void deposit(double amount)
    {
        this.balance += amount;
    }

    /*
     *  Retira valor da conta bancária
     */
    public void withDraw(double amount)
    {
        this.balance -= amount;
    }

    /*
     *  Consulta o saldo da conta
     */
    public abstract double getBalance();
    
    /*
     * Consulta o número da conta bancária
     */
    public int getAccountNumber()
    {
        return this.accountNumber;
    }
    
    /*
     * Consulta a senha
     */
    public String getPassword()
    {
        return this.password;
    }
    
    /*
     * Consulta o proprietário da conta
     */
    public String getOwner()
    {    
        return this.owner;
    }
}

