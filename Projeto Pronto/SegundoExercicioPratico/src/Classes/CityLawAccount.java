package Classes;

import java.util.Date;

public class CityLawAccount extends LawAccount
{
    /*
     *  Propriedades
     */
    
    private final String city;
    
    /*
     *  Construtores
     */
    
    public CityLawAccount(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, String city)
    {
        super(accountNumber,password,owner,balance,aim,start,end,admFee);
        this.city = city;   
    }
    
    /*
     *  Métodos
     */
    
    /*
     *  Consulta a comarca da conta
     */
    public String getCity()
    {
        return this.city;
    }
}
