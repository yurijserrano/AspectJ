package Aspecto;

public aspect SavingsAccountAspecto extends Object
{
	/*
	 *  Pointcuts
	 */
	
    pointcut construtor(int accountNumber, String password, String owner, double balance, double interestRate) : call(Classes.SavingsAccount.new(int,String,String,double,double)) && args(accountNumber,password,owner,balance,interestRate);

    /*
     *  Advices
     */
    
    before(int accountNumber, String password, String owner, double balance, double interestRate) : construtor(accountNumber,password,owner,balance,interestRate)
    {
        Boolean sentinela = false;
        if(accountNumber < 0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"SavingsAccount\" o parâmetro \"accountNumber\" está negativo(" + accountNumber + ")",false);
            sentinela = true;
        }
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"SavingsAccount\" o parâmetro \"password\" está nulo",false);
            sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"SavingsAccount\" o parâmetro \"owner\" está nulo",false);
            sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"SavingsAccount\" o parâmetro \"balance\" está negativo(" + balance + ")",false);
            sentinela = true;
        }
        if(interestRate < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"SavingsAccount\" o parâmetro \"interestRate\" está negativo(" + interestRate + ")",false);
            sentinela = true;
        }
        else if(interestRate > 100.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"SavingsAccount\" o parâmetro \"interestRate\" (" + interestRate + ") está inválido (0.0 até 100.0)",false);
            sentinela = true;
        }
        if(sentinela)
        {
            this.terminate();
        }
    }

    /*
     *  Métodos
     */

    /*
     * Aqui a execução do programa é encerrada
     */
    private void terminate()
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
            this.terminate();
        }
    }
}

