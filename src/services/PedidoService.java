package services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.DB;
import models.Pedido;

public class PedidoService {

	public List<Pedido> listarPedidosPorUsuario(int idUsuario) {
		List<Pedido> pedidos = new ArrayList<>();
		String query = "SELECT \r\n" + 
				"v.idVenda,\r\n" + 
				"v.idStatus,\r\n" +
				"sa.nome as `statusNome`,\r\n" +
				"v.`data`,\r\n" + 
				"vp.quantidade,\r\n" + 
				"vp.valor as `valorIndividual`,\r\n" + 
				"p.idProduto,\r\n" + 
				"p.nome,\r\n" +
				"p.imagem\r\n" + 
				" FROM `Venda` v\r\n" + 
				"INNER JOIN `VendaProduto` vp ON v.idVenda = vp.idVenda \r\n" + 
				"INNER JOIN `Produto` p ON vp.idProduto = p.idProduto\r\n" + 
				"INNER JOIN `StatusAndamento` sa ON sa.idStatus = v.idStatus\r\n" +
				"WHERE v.idUsuario = " + idUsuario + ";";
		
		ResultSet rs = DB.executarQuery(query);
		try {
			while (rs.next()) {
				Pedido pedido = new Pedido(
					rs.getInt("idVenda"), rs.getInt("idStatus"),rs.getString("statusNome"),
					rs.getString("data"), rs.getInt("quantidade"),
					rs.getDouble("valorIndividual"), rs.getInt("idProduto"),
					rs.getString("nome"), rs.getString("imagem")
				);
				pedidos.add(pedido);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pedidos;
	}
	
}
