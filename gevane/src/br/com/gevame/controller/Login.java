package br.com.gevame.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gevane.model.Usuario;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		Usuario user = new Usuario();
		if(email.equals(user.getEmail()) && senha.equals(user.getSenha())) {
			response.sendRedirect("http://localhost:8080/gevane/index.jsp");
		}else {
			PrintWriter writer  = response.getWriter();
			response.setContentType("text/html");
			writer.println("<script type=\"text/javascript\">");
			writer.println("alert('Usuário ou senha errado');");
			writer.println("</script>");
			response.sendRedirect("http://localhost:8080/gevane/login.jsp");
		}
		
	}

}
