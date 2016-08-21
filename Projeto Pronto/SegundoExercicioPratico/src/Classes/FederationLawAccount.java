package Classes;

import java.util.Date;

public class FederationLawAccount extends LawAccount
{
    /*
     *  Propriedades
     */
    
    private final int instance; 
    
    /*
     *  Construtores
     */
    
    public FederationLawAccount(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, int instance)
    {
        super(accountNumber,password,owner,balance,aim,start,end,admFee);
        this.instance = instance;   
    }
    
    /*
     *  Métodos
     */
    
    /*
     *  Consulta o número da instância do processo
     */
    public int getInstance()
    {
        return this.instance;
    }
}
