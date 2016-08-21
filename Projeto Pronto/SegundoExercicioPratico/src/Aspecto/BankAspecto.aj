package Aspecto;


import Classes.Bank;
import Classes.BankAccount;



public aspect BankAspecto extends Object 
{
	/*
	 * Aqui situam-se os pointcuts
	 */
	pointcut funcaocount(int limit) : execution(* Classes.Bank.count(int)) && args(limit);
    pointcut funcaofind(int accountNumber) : call(* Classes.Bank.find(int)) && args(accountNumber);
    pointcut funcaoaddAccount(BankAccount account) : call(* Classes.Bank.addAccount(BankAccount)) && args(account);
    

    /*
     * Aqui situam-se os advices
     */

    
   
    before(int limit):funcaocount(limit)
    {
    	if(limit < 0)
    	{
        	this.manipulaErro("Na chamada da função \"count\" da classe \"Bank\" o parâmetro \"limit\" está negativo (" + limit + ")",true);
    	}
    }

    before(int accountNumber) : funcaofind(accountNumber)
    {
    	if(accountNumber < 0)
    	{
        	this.manipulaErro("Na chamada da função \"find\" da classe \"Bank\" o parâmetro \"accountNumber\" está negativo (" + accountNumber + ")",true);
    	}
    }

    before(BankAccount account) : funcaoaddAccount(account)
    {
    	if(account == null)
    	{
	       	this.manipulaErro("Na chamada do método \"addAccount\" da classe \"Bank\" o parâmetro \"account\" está nulo",true);
    	}
        for(BankAccount currentAccount : ((Bank)thisJoinPoint.getTarget()).getAccounts())
        {
            if(currentAccount.getAccountNumber() == account.getAccountNumber())
            {
                this.manipulaErro("Chamada do método \"addAccount\" da classe \"Bank\" o parâmetro \"account\" com a propriedade \"accountNumber\" (" + account.getAccountNumber() + ") é inválida pois já consta no banco uma conta com esse número",true);
            }
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