drop database if exists hipopotamo;
create database hipopotamo;
use hipopotamo;

create table usuario(id_usr int primary key not null auto_increment, 
						nom_usr varchar(20),
                        password_pac varchar(15),
                        correo_usr varchar(30),
                        tipo_usr int);
                        
create table reportes(id_rep int primary key not null auto_increment, 
						report varchar(255),
                        estado int,
                        resp varchar(255),
                        fecha_in datetime,
                        fecha_ac datetime,
                        tipo_rep int);
                        
                        
insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('Bruno','12345','bruno@gmial.com',5);
insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('ofe','12345','ofe@gmail.com',3);
insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('mich','12345','mich@gmail.com',2);
insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('ali','12345','ali@gmail.com',1);
insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('fer','12345','fer@gmail.com',4);
insert into reportes(report,estado,fecha_in,fecha_ac) values ('esta dlv','1','2023-3-31 23:42:14','2023-3-31 23:42:14');
select * from usuario where nom_usr= 'ofelia' and password_pac='12345';
insert into reportes(report,estado,fecha_in,fecha_ac) values ('el codigo de subir pacientes no funciona debido a un error de sintaxis','1','2023-4-1 0:16:22','2023-4-1 0:16:22');
update reportes set estado = '2', resp = '3' ,fecha_ac='2023-3-31 23:42:14' where id_rep ='2';
select * from reportes where estado = '2';
select * from usuario;
select * from reportes;
select * from reportes where tipo_rep = '1';
insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('Gael','123456','gael@gmail.com','1');                        
delete from reportes where id_rep = '1';
select * from reportes where estado = '2' and resp="" ;
select * from reportes where estado = '2' ;
update reportes set estado = '3', resp= 'asada',fecha_ac='2023-4-2 19:33:4' where id_rep ='2' ;