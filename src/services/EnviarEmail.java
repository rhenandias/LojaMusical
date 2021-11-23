package services;

import mail.SendMail;

public class EnviarEmail {
	
	public static void enviarEmailAtravesDoGoogle(String emailTO, String titulo, String mensagem) {
		SendMail sm = new SendMail("smtp.gmail.com", "587", "testeifspgru@gmail.com", "13246578", "tls");
		
		sm.send("testeifspgru@gmail.com", emailTO, titulo, mensagem);
	}

}
