<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.gevane.dao.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gevane - Cadastro de Usuário</title>
<link type="text/css" href="./bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="./css/theme.css" rel="stylesheet">
<link type="text/css" href="./css/venda.css" rel="stylesheet">
<link type="text/css" href="./images/icons/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css"
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
	rel='stylesheet'>
</head>

<%
     	ConfigDAO conn = new ConfigDAO();
    
     	Connection conexao = conn.conectaMysql();
     	
     	if (conexao!=null) {
     		
  			Statement st;
 			ResultSet rs;
 			PreparedStatement pst;
 			String nome, email, senha;
 			int ativo, vendedor, administrador;
	 			
     		if ((request.getParameter("email") != null) && (request.getParameter("senha") != null)) {
     		
     			email = request.getParameter("email");
     			nome = request.getParameter("nome");
     			senha = request.getParameter("senha");
     			vendedor = Integer.parseInt(request.getParameter("vendedor"));
     			administrador = Integer.parseInt(request.getParameter("administrador"));
     			ativo = Integer.parseInt(request.getParameter("ativo"));
     			
     			pst = conexao.prepareStatement("insert into usuario (nome, email, senha, vendedor, administrador, ativo) values (?,?,?,?,?,?)");
     			
     			pst.setString(1, nome);
     			pst.setString(2, email);
     			pst.setString(3, senha);
     			pst.setInt(4, vendedor);
     			pst.setInt(5, administrador);
     			pst.setInt(6, ativo);
 				pst.execute();

  				response.sendRedirect("usuario.jsp");
     	}	
     		
  		if (request.getParameter("id") != null) {
  		 			
  		 			int id = Integer.parseInt(request.getParameter("id"));
  		 			st = conexao.createStatement();
  		 			rs = st.executeQuery("select * from usuario where id_usuario ="+id+"");
  		 			rs.first();
  		 			
  		 		
  		 			nome = rs.getString("nome");
  		 			email = rs.getString("email");
  		 			senha = rs.getString("senha");
  		 			ativo = rs.getInt("ativo");
  		 			
  		 			request.setAttribute("atrNome", nome);
  		 			request.setAttribute("atrEmail", email);
  		 			request.setAttribute("atrSenha", senha);
  		 			request.setAttribute("atrAtivo", ativo);
  		 			
  		 			if (request.getParameter("submit") != null) {
  		 				
  		 				pst = conexao.prepareStatement("update usuario set nome = '"+ nome + "', email = '"+email+"', senha = '"+senha+"', ativo="+ativo+" where id_produto="+id);
  		 				pst.execute();
  		 			}
  	     		} else {
  		 			request.setAttribute("atrNome", "");
  		 			request.setAttribute("atrEmail", "");
  		 			request.setAttribute("atrSenha", "");
  		 			request.setAttribute("atrAtivo", "");
  	     			
  	     		}
     		} else { 
     			System.out.println("Valores nulos");
     		}	
%>  

<body>
   		
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".navbar-inverse-collapse"> <i
					class="icon-reorder shaded"></i>
				</a> <a class="brand" href="index.jsp">Gevane </a>
				<div class="nav-collapse collapse navbar-inverse-collapse">
					<ul class="nav pull-right">
							<ul class="dropdown-menu">
								<li><a href="venda.jsp">Vendas</a></li>
								<li><a href="usuario.jsp">Usuarios</a></li>
								<li><a href="./estoque.jsp">Estoque</a></li>
								<li class="divider"></li>
								<li><a href="logout.html">Logout</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
		</div>
		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">
						<ul class="widget widget-menu unstyled">
							<li class="active"><a href="estoque.jsp"> <i
									class="menu-icon icon-dashboard"></i>Estoque <b
									class="label green pull-right"> </b>
							</a></li>
							<li><a href="venda.jsp"> <i
									class="menu-icon icon-bullhorn"></i>Vendas
							</a></li>
							<li><a href="usuario.jsp"> <i
									class="menu-icon icon-inbox"></i>Usuários
							</a></li>
						</ul>

					</div>
					<!--/.sidebar-->
				</div>
				<!--/.span3-->
				<div class="span9">
					<div class="img">
						<img src="./images/user.jpg">
					</div>
					<form action="cadastro_usuario.jsp" method="post">
						<h1>Usuário</h1>
						<label for="">Nome</label> <input type="text" name="nome" value = '<%=request.getAttribute("atrNome")%>' required>
						<label for="email">Email</label> <input type="email" name="email" value = '<%=request.getAttribute("atrEmail")%>' required>
						<label for="password">Senha</label> <input type="password"
							name="senha" value = '<%=request.getAttribute("atrSenha")%>'> <br>
						<label for="">Vendedor</label> 
							<input type="radio" name="vendedor" value = 1  required/> Sim					
							<input type="radio" name="vendedor" value = 0 /> Não <br><br>	
						<label for="">Administrador</label> 
							<input type="radio" name="administrador" value = 1  required/> Sim					
							<input type="radio" name="administrador" value = 0 /> Não <br><br>							
						<label for="">Ativo</label> 
							<input type="radio" name="ativo" value = 1  required/> Sim					
							<input type="radio" name="ativo" value = 0 /> Não <br><br>	
						<button type="submit" class="btn btn-success">Salvar</button>
						<button type="reset" class="btn btn-warning">Cancelar</button>
					</form>
				</div>
				<!--/.span9-->
			</div>
		</div>
		<!--/.container-->
	</div>
	<!--/.wrapper-->
	<div class="footer">
		<div class="container">
			<b class="copyright">&copy; 2018 Bruno Sudré e Kimmy Wu </b>All
			rights reserved.
		</div>
	</div>
</body>

</html>