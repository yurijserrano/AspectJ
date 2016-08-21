package Classes;

public interface BankAccountOperation
{
    /*
     *  Consulta o saldo de uma determinada conta
     */
	
    public double getBalance(int accountNumber);

    /*
     * Deposita um valor em uma determinada conta
     */
    
    public void deposit(int accountNumber, double value);
    
    /*
     *  Retira um valor de uma determinada conta
     */
    
    public void withdraw(int accountNumber, double value);
}
