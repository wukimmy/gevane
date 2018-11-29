<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import = "br.com.gevane.dao.*, java.sql.*" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gevane - Cadastro de Venda</title>
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
	
	PreparedStatement pst;
	Statement st;
	ResultSet rs, rsUsuario, rsProduto;
	String vendedor, produto, forma_pagamento, codigo;
	int devolucao, ativo, desconto, id, id_usuario, id_produto, quantidade_atual;
	double preco, valor_total;
	
	if (conexao!=null) {
		
		st = conexao.createStatement();
		
		if ((request.getParameter("vendedor") != null) && (request.getParameter("produto") != null && (request.getParameter("forma_pagamento") != null))) {
			
			vendedor = request.getParameter("vendedor");
			produto = request.getParameter("produto");
			codigo = request.getParameter("codigo");
			desconto = Integer.parseInt(request.getParameter("desconto"));
			forma_pagamento = request.getParameter("forma_pagamento");
			ativo = Integer.parseInt(request.getParameter("ativo"));
			devolucao = Integer.parseInt(request.getParameter("devolucao"));

			rsUsuario = st.executeQuery("select * from usuario where nome ='"+vendedor+"' and vendedor=1");
			rsUsuario.first();
	
			id_usuario = rsUsuario.getInt("id_usuario");
			
			rsProduto = st.executeQuery("select * from produto where codigo_barras ='"+codigo+"'");
			rsProduto.first();
			id_produto = rsProduto.getInt("id_produto");
			preco = rsProduto.getDouble("preco");
			valor_total = (preco - (preco*desconto/100));
			
			quantidade_atual = rsProduto.getInt("quantidade_atual") - 1;
			pst = conexao.prepareStatement("insert into venda (id_usuario, id_produto, forma_pagamento, desconto, valor_total, devolucao, ativo) values (?,?,?,?,?,?,?)");
			
			pst.setInt(1, id_usuario);
			pst.setInt(2, id_produto);
			pst.setString(3, forma_pagamento);
			pst.setInt(4, desconto);
			pst.setDouble(5, valor_total);
			pst.setInt(6, devolucao);
			pst.setInt(7, ativo);
			pst.execute();

			pst = conexao.prepareStatement("update produto set quantidade_atual = "+quantidade_atual+" where id_produto = "+id_produto);
			pst.execute();
			response.sendRedirect("venda.jsp");

		} else { 
			System.out.println("Valores nulos");
		}
		
		if (request.getParameter("id") != null) {

			id = Integer.parseInt(request.getParameter("id"));
			st = conexao.createStatement();
			rs = st.executeQuery("select * from venda where id_venda="+id+"");
			rs.first();
			
			vendedor = rs.getString("id_usuario");
			produto = rs.getString("id_produto");
			forma_pagamento = rs.getString("forma_pagamento");
			desconto = rs.getInt("desconto");
			devolucao = rs.getInt("devolucao");
			ativo = rs.getInt("ativo");
			
			if (rs.next()) {
				
				rsProduto = st.executeQuery("select * from produto where id_produto=" +rs.getInt("id_produto"));
			
				if (rsProduto.next()) {
					codigo = rsProduto.getString("codigo_barras");
					request.setAttribute("atrCodigo", codigo);
				}

				request.setAttribute("atrVendedor", vendedor);
				request.setAttribute("atrProduto", produto);
				request.setAttribute("atrFormaPagamento", forma_pagamento);
				request.setAttribute("atrDesconto", desconto);
				request.setAttribute("atrDevolucao", devolucao);
				request.setAttribute("atrAtivo", ativo);
			} else {
				request.setAttribute("atrVendedor", "");
				request.setAttribute("atrProduto", "");
				request.setAttribute("atrCodigo", "");
				request.setAttribute("atrFormaPagamento", "");
				request.setAttribute("atrDesconto", "");
				request.setAttribute("atrDevolucao", "");
				request.setAttribute("atrAtivo", "");
				
			}
			
			if (request.getParameter("submit") != null) {
				
				pst = conexao.prepareStatement("update venda set id_usuario = '"+ vendedor + "', id_produto = '"+produto+"', forma_pagamento = '"+forma_pagamento+"', desconto ="+desconto+" , devolucao = "+devolucao+", ativo="+ativo+" where id_venda="+id);
				pst.execute();
			}
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
								<li><a href="./estoque.jspl">Estoque</a></li>
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
						<img src="./images/caixa.jpg">
					</div>
					<form>
						<h1>Venda</h1>
						<label for="">Código de barras</label> <input type="text" name="codigo" style="width:207px" value = '<%=request.getAttribute("atrCodigo")%>' required/>
						<label for="">Vendedor</label>
							<select name="vendedor" required>
							  <%
							 	out.println("<option>Selecione...</option>");
								st = conexao.createStatement();
								rs = st.executeQuery("select * from usuario where vendedor = 1 order by nome");
							if (rs.first()) {
								do {
									out.println("<option>"+rs.getString("nome")+"</option>");
								}	
								while (rs.next());	
							}
							
							  %>
							</select>
													
						<label for="">Produto</label>
							<select name="produto" required>
							  <%
							  	out.println("<option>Selecione...</option>");
								st = conexao.createStatement();
								rs = st.executeQuery("select * from produto order by nome");

								if (rs.first()) {
									do {
										out.println("<option>"+rs.getString("nome")+"</option>");
									}	
									while (rs.next());	
								}
							  %>
							</select> 
							
						<label for="">Forma de Pagamento</label> 
							<select name="forma_pagamento" required>
							  <option value="">Selecione...</option>
							  <option value="Debito" <% if(request.getAttribute("atrFormaPagamento") == "Debito"){ %> selected <% }%>>Cartão de débito</option>
							  <option value="Credito" <% if(request.getAttribute("atrFormaPagamento") == "Credito"){ %> selected <% }%>>Cartão de crédito</option>
							  <option value="Dinheiro" <% if(request.getAttribute("atrFormaPagamento") == "Dinheiro"){ %> selected <% };%>>Dinheiro</option>
							  <option value="Cheque" <% if(request.getAttribute("atrFormaPagamento") == "Cheque"){ %> selected <% };%>>Cheque</option>
							</select>
							
						<label for="">Desconto (%)</label> <input type="number" min=1 max=99 placeholder="1 - 99" name="desconto" style="width:207px" value='<%=request.getAttribute("atrDesconto")%>'>
						
						<label for="">Devolução</label> 
							<input type="radio" name="devolucao" value = 1  required/> Sim					
							<input type="radio" name="devolucao" value = 0 /> Não <br><br>
						
						<label for="">Ativo</label> 
							<input type="radio" name="ativo" value = 1  required/> Sim					
							<input type="radio" name="ativo" value = 0 /> Não <br><br>
						<br>
						
						<button type="submit" class="btn btn-success">Finalizar venda</button>
						<button type="reset" class="btn btn-warning">Cancelar</button>
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