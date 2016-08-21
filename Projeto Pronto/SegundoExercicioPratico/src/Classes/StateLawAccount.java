package Classes;

import java.util.Date;

public class StateLawAccount extends LawAccount
{
    /*
     *  Propriedades
     */
    
    private final String state;
    
    /*
     *  Construtores
     */
    
    public StateLawAccount(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, String state)
    {
        super(accountNumber,password,owner,balance,aim,start,end,admFee);
        this.state = state;   
    }
    
    /*
     *  Métodos
     */
    
    /*
     *  Consulta o estado da conta
     */
    public String getState()
    {
        return this.state;
    }
}

