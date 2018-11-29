<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import = "br.com.gevane.dao.*, java.sql.*" %>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gevane - Estoque</title>
<link type="text/css" href="./bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css"
	href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="./css/theme.css" rel="stylesheet">
<link type="text/css" href="./css/estoque.css" rel="stylesheet">
<link type="text/css" href="./images/icons/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css"
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
	rel='stylesheet'>
</head>

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
								<li><a href="./logout.html">Logout</a></li>
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
									class="menu-icon icon-inbox"></i>Usuarios
							</a></li>
							<li><a href="produto.jsp"> <b class="label green">
										Novo Produto </b>
							</a></li>
						</ul>

					</div>
					<!--/.sidebar-->
				</div>
				<!--/.span3-->
				<div class="span9">
					<h1>Estoque</h1>
					<form>

								<%
									ConfigDAO conn = new ConfigDAO();						    
					     			Connection conexao = conn.conectaMysql();
					     		
					     			Statement st;
					     			ResultSet rs;
					     			
					     			st = conexao.createStatement();
					     			rs = st.executeQuery("select * from produto order by nome");
					     			if (rs.first())	{
						     			String ativo;
					     		%>
					     <table>
							<thead>
								<tr>
									<th>Produto</th>
									<th>Preço</th>
									<th>Categoria</th>
									<th>Descricao</th>
									<th>Quantidade atual</th>
									<th>Quantidade mínima</th>
									<th>Código de barras</th>
									<th>Ativo</th>
									<th>Ações </th>
								</tr>
							</thead>
							<tbody>

								<tr>	
					     			<% do { %>
					     			<% if (rs.getInt("ativo") == 1) ativo = "Sim"; else ativo = "Não"; %>
					     			
					     			<%	out.println("<tr>"); %>
					     			<% 	out.println("<td>"+rs.getString("nome")+"</td>"); %>
					     			<% 	out.println("<td> R$ "+rs.getDouble("preco")+"</td>"); %>
					     			<% 	out.println("<td>"+rs.getString("categoria")+"</td>"); %>
					     			<% 	out.println("<td>"+rs.getString("descricao")+"</td>"); %>
					     			<% 	out.println("<td>"+rs.getInt("quantidade_atual")+"</td>"); %>
					     			<% 	out.println("<td>"+rs.getInt("quantidade_minima")+"</td>"); %>
					     			<% 	out.println("<td>"+rs.getString("codigo_barras")+"</td>"); %>
					     			<% 	out.println("<td>"+ativo+"</td>"); %>
					   
					     			<td><i class="fa fa-pencil" aria-hidden="true"></i><a
											href="produto.jsp?id=<%= rs.getInt("id_produto") %>">Editar</a></td>
											
				     			<% out.println("</tr>"); %>
					     		<%} while (rs.next()); } else { out.println("<h2> Não há registros de produto! <h2>"); } %>
								
								</tr>
								
							</tbody>
						</table>
					</form>
					<!--/.content-->
				</div>
				<!--/.span9-->
			</div>
		</div>
		<!--/.container-->
	</div>
	<!--/.wrapper-->
	<div class="footer">
		<div class="container">
			<b class="copyright">&copy; 2018 Bruno Sudre e Kimmy Wu </b>All
			rights reserved.
		</div>
	</div>
</body>

</html>