package Aspecto;

import Classes.BankAccount;
import Classes.RegularAccount;
import Classes.SavingsAccount;
import Classes.LawAccount;
import Classes.CityLawAccount;
import Classes.StateLawAccount;
import Classes.FederationLawAccount;

public aspect BankAccountAspecto extends Object
{
	/*
	 *  Pointcuts
	 */
	
    pointcut construtor(int accountNumber, String password, String owner, double balance) : execution(Classes.BankAccount.new(int,String,String,double)) && args(accountNumber,password,owner,balance);
    pointcut funcaodeposit(double amount) : call(* *.deposit(double)) && args(amount);
    pointcut funcaowithDraw(double amount) : call(* *.withDraw(double)) && args(amount);

    /*
     *  Advices
     */
    
    before(int accountNumber, String password, String owner, double balance) : construtor(accountNumber,password,owner,balance)
    {
        Boolean sentinela = false;
    	if(accountNumber < 0)
    	{
        	this.manipulaErro("Na chamada do construtor da classe \"BankAccount\" o parâmetro \"accountNumber\" está negativo (" + accountNumber + ")",false);
            sentinela = true;
    	}
        if(password == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"BankAccount\" o parâmetro \"password\" está nulo",false);
            sentinela = true;
        }
        if(owner == null)
        {
            this.manipulaErro("Na chamada do construtor da classe \"BankAccount\" o parâmetro \"owner\" está nulo",false);
            sentinela = true;
        }
        if(balance < 0.0)
        {
            this.manipulaErro("Na chamada do construtor da classe \"BankAccount\" o parâmetro \"balance\" está negativo (" + balance + ")",false);
            sentinela = true;
        }
        if(sentinela)
        {
            this.terminaPrograma();
        },,
    }

    before(double amount) : funcaodeposit(amount)
    {
        if(amount < 0.0)
        {
            this.manipulaErro("Na chamada do método \"deposit\" da classe \"" + thisJoinPoint.getTarget().getClass().getName() + "\" o parâmetro \"amount\" está negativo (" + amount + ")",true);
        }
    }
    
   

    before(double amount) : funcaowithDraw(amount)
    {
        BankAccount conta = (BankAccount)thisJoinPoint.getTarget();
        double saldo;
        if(amount < 0.0)
        {
            this.manipulaErro("Na chamada do método \"withDraw\" da classe \"" + thisJoinPoint.getTarget().getClass().getName() + "\" o parâmetro \"amount\" está negativo (" + amount + ")",true);
        }
        if(conta instanceof RegularAccount)
        {
            saldo = ((RegularAccount)conta).getBalance();
            if(!this.verificaSaque(saldo,amount))
            {
                this.manipulaErro("Na chamada do método \"withDraw\" da classe \"RegularAccount\" o parâmetro \"amount\" que tem  (" + amount + ") está maior que o saldo permitido que é de (" + saldo + ")",true);
            }
        }
        else if(conta instanceof SavingsAccount)
        {
            saldo = ((SavingsAccount)conta).getBalance();
            if(!this.verificaSaque(saldo,amount))
            {
                this.manipulaErro("Na chamada do método \"withDraw\" da classe \"SavingsAccount\" o parâmetro \"amount\" que tem (" + amount + ") está maior que o saldo permitido que é de (" + saldo + ")",true);
            }
        }
        else if(conta instanceof LawAccount ||
                conta instanceof CityLawAccount ||
                conta instanceof StateLawAccount ||
                conta instanceof FederationLawAccount)
        {
            saldo = ((LawAccount)conta).getBalance();
            if(!this.verificaSaque(saldo,amount))
            {
                this.manipulaErro("Na chamada do método \"withDraw\" da classe \"" + thisJoinPoint.getTarget().getClass().getName() + "\" o parâmetro \"amount\" que tem (" + amount + ") está maior que o saldo permitido que é de (" + saldo + ")",true);
            }
        }
    }

    /*
     *  Métodos
     */

    // Termina a execução do programa
    private void terminaPrograma()
    {
    	System.err.println("Programa Finalizando sua Execução");
        System.exit(-1);
    }

    // Lida com erros terminando ou não a execução do programa
    private void manipulaErro(String message, Boolean sentinela)
    {
        System.err.println(message);
        if(sentinela)
        {
            this.terminaPrograma();
        }
    }

    /*
     * Verifica se a operação de saque pode ser feita
     */
    private Boolean verificaSaque(double saldo, double quantia)
    {
        return saldo - quantia >= 0.0;
    }
}

