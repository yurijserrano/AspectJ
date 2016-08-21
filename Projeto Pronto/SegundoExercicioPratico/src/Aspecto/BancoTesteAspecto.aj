package Aspecto;



import java.util.NoSuchElementException;
import java.lang.NullPointerException;

public aspect BancoTesteAspecto extends Object
{
	/*
	 *  Pointcuts
	 */
	
    pointcut funcaomain() : execution(* Teste.BancoTeste.main(..));

    /*
     *  Advices
     */
    
    void around() : funcaomain()
    {
        try
        {
            proceed();
        }
        catch(NoSuchElementException exception)
        {
            this.manipulaErro("Por favor informe um valor correto para a entrada",true);
        }
        catch(NullPointerException exception)
        {
            this.manipulaErro("Por favor informe uma conta válida",true);
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

