package services;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DB;
import models.UsuarioModel;

public class UsuarioService {
	
	public UsuarioModel logar(String email, String senha) {
		try {
			ResultSet rs = DB.executarQuery("SELECT * FROM `Usuario` WHERE email = '" + email + "' AND senha = '" + senha + "'");
			if (rs.next()) {
				Integer idUsuario = rs.getInt("idUsuario");
				UsuarioModel user = new UsuarioModel(idUsuario);
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
