package br.com.gevame.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gevane.dao.UsuarioDAO;
import br.com.gevane.model.Usuario;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		Usuario user = new Usuario();
		user.setNome(nome);
		user.setEmail(email);
		user.setSenha(senha);
		
		UsuarioDAO banco = new UsuarioDAO();
		/*IMPLEMENTAR O CODIGO PARA CONECTAR COM O BANCO*/
	}

}
