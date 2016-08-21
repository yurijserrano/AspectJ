package Teste;

import java.util.Date;
import java.util.Scanner;
import Classes.Bank;
import Classes.BankAccount;
import Classes.CityLawAccount;
import Classes.FederationLawAccount;
import Classes.RegularAccount;
import Classes.SavingsAccount;
import Classes.StateLawAccount;

public class BancoTeste extends Object
{
	public static void main(String [] args)
	{
		/*
		 * Aqui é criado uma instância de Bank
		 */
		Bank banco = new Bank();

		/*
		 * Aqui são criadas as contas dados os tipos existentess
		 */
		RegularAccount contaR = new RegularAccount(1,"naovaitergolpe","Dilma Bolada",5.0,50.0);
		SavingsAccount contaS = new SavingsAccount(2,"vaitergolpe","Eduardo Ladrão Cunha",10000.0,800.0);
		CityLawAccount contaC = new CityLawAccount(3,"harrypotter","Michel Voldemort Temer",5800.0,"Hogwarts",new Date(),new Date(),100.0,"Londres");
		StateLawAccount contaST = new StateLawAccount(4,"marolinha","Luis Sem Dedo da Silva",2.0,"Dedinho",new Date(),new Date(),10.0,"Estado da Marola");
		FederationLawAccount contaF = new FederationLawAccount(5,"florentinadejesus","Tiririca",800000.0,"Jesus",new Date(),new Date(),100000.0,2);

		/*
		 * Aqui é feito o registro das contas no banco
		 */
		banco.addAccount(contaR);
		banco.addAccount(contaS);
		banco.addAccount(contaC);
		banco.addAccount(contaST);
		banco.addAccount(contaF);

		/*
		 *  Fará a leitura dos dados
		 */
		Scanner entrada = new Scanner(System.in);

		/*
		 *  Controla o laço
		 */
		Boolean sentinela = false;

		
		
		
		/*
		 * Banco do Yuri
		 */
		
		
		System.out.println("*******************************************************************");
		System.out.println("*******************************************************************");
		System.out.println("*******************************************************************");
		System.out.println("*********************Banco do Yuri*********************************");
		System.out.println("*******************************************************************");
		System.out.println("*******************************************************************");
		System.out.println("*******************************************************************");
		
		/*
		 * Laço
		 */
		while(!sentinela)
		{
			/*
			 * Exibição das contas
			 */
			System.out.println("Contas:\n");
			for(BankAccount conta : banco.getAccounts())
			{
				System.out.println("\t[" + conta.getAccountNumber() + "] - " + conta.getOwner() + " (Saldo: $" + conta.getBalance() + ")");
			}
			System.out.println("Número da conta: ");
			Integer numeroConta = entrada.nextInt();

			/*
			 *  Obtem a conta dado o número da mesma
			 */
			BankAccount conta = banco.find(numeroConta);

			/*
			 * Exibe as opções que o Banco Yuri dispõem
			 */
			System.out.println("\nEscolha a operação que o Banco Yuri dispõem:\n\n\t[1] - Depositar\n\t[2] - Sacar\n\t[3] - Sair\n");
			System.out.print("Número da operação: ");
			Integer operacao = entrada.nextInt();
			double valor = 0.0;

			/*
			 * Detecção de operação desejada
			 */
			switch(operacao)
			{
				case 1:
					/*
					 * Depósito - Opção
					 */
					System.out.println();
					System.out.println("Qual o valor que você deseja depositar na conta de número " + numeroConta + "?\n");
					System.out.print("Valor: R$ ");
					valor = entrada.nextDouble();

					/*
					 *  Reliza o depósito
					 */
					conta.deposit(valor);
					System.out.println();
					System.out.println("Depósito realizado com sucesso na conta de número " + numeroConta + "!!!!!!!!\n");
					break;
				case 2:
					/*
					 *  Saque - Opção
					 */
					System.out.println();
					System.out.println("Qual o valor que deseja sacar da conta de número " + numeroConta + "?\n");
					System.out.print("Valor: R$ ");
					valor = entrada.nextDouble();

					/*
					 *  Reliza o saque
					 */
					conta.withDraw(valor);
					System.out.println();
					System.out.println("Saque realizado com sucesso da conta de número " + numeroConta + "!!!!!!!!\n");
					break;
				default:
					/*
					 * Aqui a variável de controle é alterada para sair do laço em que qualquer valor diferente de 1 até 2 faz com que
					 * entre aqui.
					 */
					sentinela = true;
					break;
			}
		}
	}
}

