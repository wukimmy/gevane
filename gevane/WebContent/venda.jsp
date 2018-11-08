<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gevane - Venda</title>
    <link type="text/css" href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="./css/theme.css" rel="stylesheet">
    <link type="text/css" href="./css/venda.css" rel="stylesheet">
    <link type="text/css" href="./images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>

<body>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <i class="icon-reorder shaded"></i>
                </a>
                <a class="brand" href="index.jsp">Gevane </a>
                <div class="nav-collapse collapse navbar-inverse-collapse">
                    <form class="navbar-search pull-left input-append" action="#">
                        <input type="text" class="span3">
                        <button class="btn" type="button">
                            <i class="icon-search"></i>
                        </button>
                    </form>
                    <ul class="nav pull-right">
                        <li class="nav-user dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Menu</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="venda.jsp">Vendas</a>
                                </li>
                                <li>
                                    <a href="usuario.jsp">Usuarios</a>
                                </li>
                                <li>
                                    <a href="./estoque.jspl">Estoque</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="logout.html">Logout</a>
                                </li>
                            </ul>
                        </li>
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
                            <li class="active">
                                <a href="estoque.jsp">
                                    <i class="menu-icon icon-dashboard"></i>Estoque
                                    <b class="label green pull-right">
                                    </b>
                                </a>
                            </li>
                            <li>
                                <a href="venda.jsp">
                                    <i class="menu-icon icon-bullhorn"></i>Vendas </a>
                            </li>
                            <li>
                                <a href="usuario.jsp">
                                    <i class="menu-icon icon-inbox"></i>Usuários </a>
                            </li>
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
                        <label for="">Codigo de barras</label>
                        <input type="text">
                        <label for="">Nome do produto</label>
                        <input type="text">
                        <label for="">Quantidade</label>
                        <input type="number">
                        <label for="comment">Lista:</label>
                        <textarea class="form-control" rows="5" cols="50" id="comment"></textarea>
                        <br>
                        <button type="button" class="btn btn-success">Finalizar a compra</button>
                        <button type="button" class="btn btn-warning">Cancelar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--/.wrapper-->
    <div class="footer">
        <div class="container">
            <b class="copyright">&copy; 2018 Bruno Sudré e Kimmy Wu </b>All rights reserved.
        </div>
    </div>
</body>

</html>