package br.com.gevame.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gevane.dao.ProdutoDAO;
import br.com.gevane.model.Produto;

/**
 * Servlet implementation class ProdutoController
 */
@WebServlet("/ProdutoController")
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("cod");
		String nome = request.getParameter("nome");
		String atual = request.getParameter("atual");
		String minimo = request.getParameter("min");
		
		Produto prod = new Produto();
		
		prod.setCodBarra(codigo);
		prod.setNome(nome);
		prod.setQtdAtual(Integer.parseInt(atual));
		prod.setQtdMinima(Integer.parseInt(minimo));
		
		ProdutoDAO banco =  new ProdutoDAO();
		/*IMPLEMENTAR CODIGO DO BANCO DE DADOS*/
	}

}
