<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import = "br.com.gevane.dao.*, java.sql.*" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gevane - Produtos</title>
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
     		if ((request.getParameter("codigo") != null) && (request.getParameter("nome") != null)) {

     			String codigo, nome, categoria, descricao;
     			int qtd_atual, qtd_min, ativo;
     			double preco;
     			codigo = request.getParameter("codigo");
     			nome = request.getParameter("nome");
     			preco = Double.parseDouble(request.getParameter("preco"));
     			categoria = request.getParameter("categoria");
     			ativo = Integer.parseInt(request.getParameter("ativo"));
     			descricao = request.getParameter("descricao");
     			qtd_atual = Integer.parseInt(request.getParameter("atual"));
     			qtd_min = Integer.parseInt(request.getParameter("min"));
     			
     			PreparedStatement pst = conexao.prepareStatement("insert into produto (codigo_barras, nome, preco, categoria, descricao, quantidade_atual, quantidade_minima, ativo) values (?,?,?,?,?,?,?,?)");
     			
     			pst.setString(1, codigo);
     			pst.setString(2, nome);
     			pst.setDouble(3, preco);
     			pst.setString(4, categoria);
     			pst.setString(5, descricao);
     			pst.setInt(6, qtd_atual);
     			pst.setInt(7, qtd_min);
     			pst.setInt(8, ativo);
 				pst.execute();

  				response.sendRedirect("produto.jsp");

     		} else { 
     			System.out.println("Valores nulos");
     		}
     		
     		if (request.getParameter("id") != null) {
	 			
     			Statement st;
	 			ResultSet rs;
	 			String codigo, nome, categoria, descricao;
	 			int qtd_atual, qtd_min, ativo;
	 			double preco;
	 			String id = request.getParameter("id");
	 			st = conexao.createStatement();
	 			rs = st.executeQuery("select * from produto where id_produto ="+id+"");
	 			rs.first();
	 			
	 			codigo = rs.getString("codigo_barras");
	 			nome = rs.getString("nome");
	 			categoria = rs.getString("categoria");
	 			descricao = rs.getString("descricao");
	 			preco = rs.getDouble("preco");
	 			ativo = rs.getInt("ativo");
	 			qtd_atual = rs.getInt("quantidade_atual");
	 			qtd_min = rs.getInt("quantidade_minima");
	 			
	 			request.setAttribute("atrCodigo", codigo);
	 			request.setAttribute("atrCategoria", categoria);
	 			request.setAttribute("atrDescricao", descricao);
	 			request.setAttribute("atrPreco", preco);
	 			request.setAttribute("atrNome", nome);
	 			request.setAttribute("atrQtdAtual", qtd_atual);
	 			request.setAttribute("atrQtdMin", qtd_min);
	 			request.setAttribute("atrAtivo", ativo);
	 			
	 			if (request.getParameter("submit") != null) {
	 				
	 				PreparedStatement pst = conexao.prepareStatement("update produto set codigo_barras = '"+ codigo + "', nome = '"+nome+"', preco = "+preco+", categoria ='"+categoria+"' , descricao = '"+descricao+"', quantidade_atual="+qtd_atual+",quantidade_minima="+qtd_min+", ativo="+ativo+" where id_produto="+id);
	 				pst.execute();
	 			}
     		} else {
	 			request.setAttribute("atrCodigo", "");
	 			request.setAttribute("atrCategoria", "");
	 			request.setAttribute("atrDescricao", "");
	 			request.setAttribute("atrPreco", "");
	 			request.setAttribute("atrNome", "");
	 			request.setAttribute("atrQtdAtual", "");
	 			request.setAttribute("atrQtdMin", "");
	 			request.setAttribute("atrAtivo", "");     			
     			
     		}
     		
     	} else {
     		System.out.println("Não conectado");
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
						<img src="./images/estoque.jpg">
					</div>
					<form action="produto.jsp" method="post">
						<h1>Produto</h1>
						
						<label for="">Código de barras</label> <input type="text" name="codigo" value = '<%=request.getAttribute("atrCodigo")%>' required/>												
						<label for="">Nome</label> <input type="text" name="nome" value = '<%=request.getAttribute("atrNome")%>' required/> 
						<label for="">Preço</label> <input type="number" placeholder="R$" step="any" min=0 name="preco" value = '<%=request.getAttribute("atrPreco")%>' required/>
						<label for="">Categoria</label> <input type="text" name="categoria" value = '<%=request.getAttribute("atrCategoria")%>' required/>
						<label for="">Quantidade atual</label> <input type="number" name="atual" min=0 value = '<%=request.getAttribute("atrQtdAtual")%>' required/> 
						<label for="">Quantidade minima</label> <input type="number" name="min" min=0 value = '<%=request.getAttribute("atrQtdMin")%>' required/>
						<label for="">Descrição</label> <input type="text" name="descricao" value = '<%=request.getAttribute("atrDescricao")%>'/> <br>
						<label for="">Ativo</label> 
							<input type="radio" name="ativo" value = 1  required/> Sim					
							<input type="radio" name="ativo" value = 0 /> Não <br><br>
							
						<button type="submit" class="btn btn-success" value="submit">Salvar</button>
					</form>
				</div>
			</div>
		</div>
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