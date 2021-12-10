package services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import database.DB;
import models.ProdutoModel;
import models.StatusMethod;
import models.enums.STATUS;

public class ProdutoService {
	
	public StatusMethod inserirVendaProduto(ProdutoModel produto, int idVendaTotal) {
		StatusMethod st = new StatusMethod();
		
		ProdutoModel produtoNoBanco = pegarDadosProduto(produto.getIdProduto());
		if (produtoNoBanco.getQuantidade() < produto.getQuantidade()) {
			st.setStatusTitutloMensagem(STATUS.ERROR, "Quantidade insuficiente", "A quantidade disponivel é menor do que a requerida");
		} else {
			String query = "INSERT INTO `VendaProduto`\r\n" + 
					"(`idVenda`,`idProduto`,`quantidade`,`valor`) VALUES ('" 
					+ idVendaTotal + "','" + produto.getIdProduto() + "','" + produto.getQuantidade() + "','" + produto.getPreco() + "');";
			ResultSet rs = DB.executarQuery(query, true);
			try {
				if (rs.next()) {
					st = new StatusMethod(STATUS.SUCCESS, "Inserido com sucesso!", "Venda do produto inserido com sucesso!!!");
				} else {
					st = new StatusMethod(STATUS.ERROR, "Falha ao Inserir o produto", "Houve uma falha ao inserir o produto e não foi SQLException!!!");
				}
			} catch (SQLException e) {
				st = new StatusMethod(STATUS.ERROR, "Erro!! SQLException", "Falha ao inserir o produto");
				e.printStackTrace();
			}
		}
		
		
		return st;
	}
	
	public ProdutoModel pegarDadosProduto(int idProduto) {
		ResultSet rs = DB.executarQuery("Select * from `Produto` where idProduto = " + idProduto + ";");
		
		try {
			rs.next();
		
			ProdutoModel produto = new ProdutoModel(
				rs.getInt("idProduto"), rs.getInt("idCategoria"), rs.getInt("idFornecedor"),
				rs.getString("nome"), rs.getString("marca"),
				rs.getDouble("preco"), rs.getDouble("custo"), rs.getInt("quantidade"),
				rs.getString("imagem"), rs.getString("descricao")
				);
			return produto;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public Integer inserirVendaTotal(Double valorTotal, Integer idUsuario) {
		String stringIdUsuario = String.valueOf(idUsuario);
		String stringValorTotal = String.valueOf(valorTotal);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mysqlDateString = formatter.format(new Date());
		
		String query = "INSERT INTO `Venda` (`idVenda`,`idUsuario`,`idStatus`,`data`,`valor`) VALUES "+ 
										"(null,'" + stringIdUsuario + "','" + "1" + "','" + mysqlDateString + "','" + stringValorTotal + "');";
		
		System.out.println(query);
		ResultSet rs = DB.executarQuery(query, true);
		try {
			rs.next();
			String idRetornado = rs.getString(1);
			
			return Integer.parseInt(idRetornado);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		
	}

}
