package Aspecto;

import java.util.Date;

public aspect LawAccountAspecto extends Object
{
	/*
	 *  Pointcuts
	 */
	
    pointcut lawAccountConstrutor(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee) : execution(Classes.LawAccount.new(int,String,String,double,String,Date,Date,double)) && args(accountNumber,password,owner,balance,aim,start,end,admFee);
    pointcut cityLawAccountConstrutor(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, String city) : call(Classes.CityLawAccount.new(int,String,String,double,String,Date,Date,double,String)) && args(accountNumber,password,owner,balance,aim,start,end,admFee,city);
    pointcut stateLawAccountConstrutor(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, String state) : call(Classes.StateLawAccount.new(int,String,String,double,String,Date,Date,double,String)) && args(accountNumber,password,owner,balance,aim,start,end,admFee,state);
    pointcut federationLawAccountConstrutor(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, int instance) : call(Classes.FederationLawAccount.new(int,String,String,double,String,Date,Date,double,int)) && args(accountNumber,password,owner,balance,aim,start,end,admFee,instance);

    /*
     * Advices
     */
    
    before(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee) : lawAccountConstrutor(accountNumber,password,owner,balance,aim,start,end,admFee)
    {
        Boolean sentinela = false;
        if(accountNumber < 0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"accountNumber\" está está negativo (" + accountNumber + ")",false);
           sentinela = true;
        }
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"password\" está está nulo",false);
           sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"owner\" está está nulo",false);
           sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"balance\" está negativo (" + balance + ")",false);
           sentinela = true;
        }
        if(aim == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"aim\" está nulo",false);
           sentinela = true;
        }
        if(start == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"start\" está nulo",false);
           sentinela = true;
        }
        if(end == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"end\" está nulo",false);
           sentinela = true;
        }
        if(admFee < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"admFee\" está negativo (" + admFee + ")",false);
           sentinela = true;
        }
        else if(admFee > 100.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"LawAccount\" o parâmetro \"admFee\" (" + admFee + ") está inválido (0.0 até 100.0)",false);
           sentinela = true;
        }
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }

    before(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, String city) : cityLawAccountConstrutor(accountNumber,password,owner,balance,aim,start,end,admFee,city)
    {
        Boolean sentinela = false;
        if(accountNumber < 0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"accountNumber\" está negativo (" + accountNumber + ")",false);
           sentinela = true;
        }
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"password\" está nulo",false);
           sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"owner\" está nulo",false);
           sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"balance\" está negativo (" + balance + ")",false);
           sentinela = true;
        }
        if(aim == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"aim\" está nulo",false);
           sentinela = true;
        }
        if(start == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"start\" está nulo",false);
           sentinela = true;
        }
        if(end == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"end\" está nulo",false);
           sentinela = true;
        }
        if(admFee < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"admFee\" está negativo (" + admFee + ")",false);
           sentinela = true;
        }
        else if(admFee > 100.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"admFee\" (" + admFee + ") está inválido (0.0 até 100.0)",false);
           sentinela = true;
        }
        if(city == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"CityLawAccount\" o parâmetro \"city\" está nulo",false);
           sentinela = true;
        }
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }

    before(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, String state) : stateLawAccountConstrutor(accountNumber,password,owner,balance,aim,start,end,admFee,state)
    {
        Boolean sentinela = false;
        if(accountNumber < 0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"accountNumber\" está negativo (" + accountNumber + ")",false);
           sentinela = true;
        }
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"password\" está nulo",false);
           sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"owner\" está nulo",false);
           sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"balance\" está negativo (" + balance + ")",false);
           sentinela = true;
        }
        if(aim == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"aim\" está nulo",false);
           sentinela = true;
        }
        if(start == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"start\" está nulo",false);
           sentinela = true;
        }
        if(end == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"end\" está nulo",false);
           sentinela = true;
        }
        if(admFee < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"admFee\" está negativo (" + admFee + ")",false);
           sentinela = true;
        }
        else if(admFee > 100.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"admFee\" (" + admFee + ") está inválido (0.0 até 100.0)",false);
           sentinela = true;
        }
        if(state == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"state\" está nulo",false);
           sentinela = true;
        }
        else if(state.length() != 2)
        {
            this.manipulaErro("Na chamada do construtor da classe \"StateLawAccount\" o parâmetro \"state\" (" + state + ") com tamanho maior (" + state.length() + ") que permitido (2)" ,false);
           sentinela = true;
        }
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }

    before(int accountNumber, String password, String owner, double balance, String aim, Date start, Date end, double admFee, int instance) : federationLawAccountConstrutor(accountNumber,password,owner,balance,aim,start,end,admFee,instance)
    {
        Boolean sentinela = false;
        if(accountNumber < 0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"accountNumber\" está negativo (" + accountNumber + ")",false);
           sentinela = true;
        }
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"password\" está nulo",false);
           sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"owner\" está nulo",false);
           sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"balance\" está negativo (" + balance + ")",false);
           sentinela = true;
        }
        if(aim == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"aim\" está nulo",false);
           sentinela = true;
        }
        if(start == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"start\" está nulo",false);
           sentinela = true;
        }
        if(end == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"end\" está nulo",false);
           sentinela = true;
        }
        if(admFee < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"admFee\" está negativo (" + admFee + ")",false);
           sentinela = true;
        }
        else if(admFee > 100.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"admFee\" (" + admFee + ") está inválido (0.0 até 100.0)",false);
           sentinela = true;
        }
        if(instance < 1 || instance > 3)
        {
            this.manipulaErro("Na chamada do construtor da classe \"FederationLawAccount\" o parâmetro \"instance\" (" + instance + ") está inválido (1 até 3)",false);
           sentinela = true;
        }
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }

    /*
     *  Métodos
     */

    /*
     * Aqui a execução do programa é encerrada
     */
    private void terminaPrograma()
    {
    	System.err.println("Programa Finalizando sua Execução");
        System.exit(-1);
    }

    /*
     * Trata dos erros mesmo o programa terminando ou não
     */
    private void manipulaErro(String message, Boolean sentinela)
    {
        System.err.println(message);
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }
}

