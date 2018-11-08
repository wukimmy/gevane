<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gevane - Login</title>
    <link type="text/css" href="./css/login.css" rel="stylesheet">
    <link type="text/css" href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="./images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>
<body style="background-image:'https://media4.s-nbcnews.com/i/newscms/2017_26/2053956/170627-better-grocery-store-main-se-539p_80a9ba9c8d466788799ca27568ee0d43.jpg'">
    <div class="login">
        <div class="bg-info">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                    </div>
                    <div class="col-sm">
                        <div class="title">
                            Bem Vindo ao Gevane!
                        </div>
                        <div class="campos">
                            <form class="cont" action ="Login" method = "post">
                                <br>
                                <label for="email" >Email</label>
                                <input type="email" name="email">
                                <br>
                                <label for="password" >Senha</label>
                                <input type="password" name="senha">
                                <br>
                                <br>
                                <button class="btn btn-info">Login</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</body>
</html>