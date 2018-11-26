use gevane;

create table login (
	id_login int not null primary key auto_increment,
	email varchar(60) not null,
    senha varchar(30) not null
) engine=InnoDb;


insert into login values (null, 'bruninhosudre@gmail.com', 'bruno');
insert into login values (null, 'kimmywu1999@gmail.com', 'kimmy');

update login set email = 'bruninhosudre@gmail.com', senha = 'bruno' where id_login = 1;


select * from login;
drop table produto;
create table produto (
	id_produto int primary key auto_increment not null,
    codigo varchar(30) not null,
    nome varchar(30) not null,
    quantidade_atual int not null default 0,
    quantidade_minima int not null default 0 
);

select * from produto;

update produto set nome =  'Iphone 10' where id_produto = "";





