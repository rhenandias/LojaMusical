package services;

import mail.SendMail;

public class EnviarEmail {
	
	/*
	 * host = "smtp.mailtrap.io"
  port = 2525
  ssl = no
  tls = yes
  user = "906bf44ad96ffc"
  password = "30fda99aef3761"
	 */
	
	public static void enviarEmailAtravesDoGoogle(String emailTO, String titulo, String mensagem) {
		SendMail sm = new SendMail("smtp.mailtrap.io", "2525", "906bf44ad96ffc", "30fda99aef3761", "tls");
		
		sm.send("testeifspgru@gmail.com", emailTO, titulo, mensagem);
	}

}
