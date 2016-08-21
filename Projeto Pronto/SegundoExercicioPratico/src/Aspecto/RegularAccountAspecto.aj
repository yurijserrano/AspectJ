package Aspecto;

public aspect RegularAccountAspecto extends Object
{
	/*
	 *  Pointcuts
	 */
	
    pointcut construtor(int accountNumber, String password, String owner, double balance, double specialBalance) : call(Classes.RegularAccount.new(int,String,String,double,double)) && args(accountNumber,password,owner,balance,specialBalance);

    /*
     *  Advices
     */
    
    before(int accountNumber, String password, String owner, double balance, double specialBalance) : construtor(accountNumber,password,owner,balance,specialBalance)
    {
        Boolean sentinela = false;
        if(accountNumber < 0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"RegularAccount\" o parâmetro \"accountNumber\" está negativo (" + accountNumber + ")",false);
            sentinela = true;
        }
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"RegularAccount\" o parâmetro \"password\" está nulo",false);
            sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"RegularAccount\" o parâmetro \"owner\" está nulo",false);
            sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"RegularAccount\" o parâmetro \"balance\" está negativo (" + balance + ")",false);
            sentinela = true;
        }
        if(specialBalance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"RegularAccount\" o parâmetro \"specialBalance\" está negativo (" + specialBalance + ")",false);
            sentinela = true;
        }
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }

    /*
     * Métodos
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

