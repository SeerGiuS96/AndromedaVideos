# ========= CREACION DE TABLAS =================================================
CREATE DATABASE IF NOT EXISTS andromeda;
USE andromeda;

SET FOREIGN_KEY_CHECKS=0; 

DROP TABLE IF EXISTS genero;
CREATE TABLE genero (
  id_genero INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre_genero VARCHAR(45) NULL
);

DROP TABLE IF EXISTS formato;
CREATE TABLE formato (
  id_formato INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre_formato VARCHAR(20) NULL
);

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
  id_usuario INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nb_usuario VARCHAR(45) NULL,
  correo VARCHAR(45) NULL,
  pass VARCHAR(255) NULL
);

DROP TABLE IF EXISTS tipo_multimedia;
CREATE TABLE tipo_multimedia (
  id_tipo_multimedia INTEGER PRIMARY KEY AUTO_INCREMENT,
  nb_tipo_multimedia VARCHAR(55) NULL
);

DROP TABLE IF EXISTS director;
CREATE TABLE director (
  id_director INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre_director VARCHAR(45) NULL,
  foto VARCHAR(45) NULL
);

DROP TABLE IF EXISTS actor;
CREATE TABLE actor (
  id_actor INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre_actor VARCHAR(45) NULL,
  foto VARCHAR(45) NULL
);

DROP TABLE IF EXISTS mi_lista;
CREATE TABLE mi_lista (
  id_lista INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_usuario INTEGER NOT NULL,
  contenido VARCHAR(255) NULL,
    
  CONSTRAINT FK_milista1 FOREIGN KEY (id_usuario)
  REFERENCES usuario(id_usuario) ON DELETE CASCADE 
);

DROP TABLE IF EXISTS multimedia;
CREATE TABLE multimedia (
  id_multimedia INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre_multimedia VARCHAR(45) NULL, 
  url VARCHAR(45) NULL,
  descripcion VARCHAR(255) NULL,
  duracion INTEGER NULL,
  año INTEGER(4) NULL,
  temporada VARCHAR(25) NULL,
  puntuacion DOUBLE NULL,
  id_formato INTEGER NOT NULL ,
  id_tipo_multimedia INTEGER NOT NULL,

  CONSTRAINT FK_multimedia1 FOREIGN KEY (id_formato)
  REFERENCES formato(id_formato) ON DELETE CASCADE,
    
  CONSTRAINT FK_multimedia2 FOREIGN KEY (id_tipo_multimedia)
  REFERENCES tipomultimedia(id_tipo_multimedia) ON DELETE CASCADE
);

DROP TABLE IF EXISTS valoracion;
CREATE TABLE valoracion (
  id_valoracion INTEGER PRIMARY KEY AUTO_INCREMENT,
  valor_valoracion INTEGER NOT NULL,
  id_multimedia INTEGER NOT NULL,
  id_usuario INTEGER NOT NULL,

  CONSTRAINT FK_valoracion1 FOREIGN KEY (id_multimedia)
  REFERENCES multimedia(id_multimedia) ON DELETE CASCADE,
    
  CONSTRAINT FK_valoracion2 FOREIGN KEY (id_usuario)
  REFERENCES usuario(id_usuario) ON DELETE CASCADE    
);

DROP TABLE IF EXISTS clasificacion;
CREATE TABLE clasificacion (
  id_genero INTEGER,
  id_multimedia INTEGER,
    
  PRIMARY KEY (id_genero, id_multimedia),
    
  CONSTRAINT FK_clasificion1 FOREIGN KEY (id_genero)
  REFERENCES genero(id_genero) ON DELETE CASCADE,    
    
  CONSTRAINT FK_clasificion2 FOREIGN KEY (id_multimedia)
  REFERENCES multimedia(id_multimedia) ON DELETE CASCADE
);

DROP TABLE IF EXISTS dirige;
CREATE TABLE dirige (
  id_director INTEGER,
  id_multimedia INTEGER,

  PRIMARY KEY (id_director, id_multimedia),
    
  CONSTRAINT FK_dirige1 FOREIGN KEY (id_director)
  REFERENCES director(id_director) ON DELETE CASCADE,   
    
  CONSTRAINT FK_dirige2 FOREIGN KEY (id_multimedia)
  REFERENCES multimedia(id_multimedia) ON DELETE CASCADE
);

DROP TABLE IF EXISTS participa;
CREATE TABLE participa (
  id_actor INTEGER,
  id_multimedia INTEGER,

  PRIMARY KEY (id_actor, id_multimedia),

  CONSTRAINT FK_participa1 FOREIGN KEY (id_actor)
  REFERENCES actor(id_actor) ON DELETE CASCADE,
   
  CONSTRAINT FK_participa2 FOREIGN KEY (id_multimedia)
  REFERENCES multimedia(id_multimedia) ON DELETE CASCADE
);

DROP TABLE IF EXISTS guarda;
CREATE TABLE guarda (
  id_multimedia INTEGER,
  id_lista INTEGER,

  PRIMARY KEY (id_multimedia, id_lista),
    
  CONSTRAINT FK_guarda1 FOREIGN KEY (id_lista)
  REFERENCES mi_lista(id_lista) ON DELETE CASCADE,
    
  CONSTRAINT FK_guarda2 FOREIGN KEY (id_multimedia)
  REFERENCES multimedia(id_multimedia) ON DELETE CASCADE
);

DROP TABLE IF EXISTS comentario;
CREATE TABLE comentario (
  id_comentario INTEGER PRIMARY KEY AUTO_INCREMENT,
  comentario VARCHAR(255) NOT NULL,
  id_multimedia INTEGER NOT NULL,
  id_usuario INTEGER NOT NULL,
    
  CONSTRAINT FK_comentario1 FOREIGN KEY (id_multimedia)
  REFERENCES multimedia(id_multimedia) ON DELETE CASCADE,
    
  CONSTRAINT FK_comentario2 FOREIGN KEY (id_usuario)
  REFERENCES usuario(id_usuario) ON DELETE CASCADE  
);

# =========== INSERT INTO ===============
#***********  TABLA USUARIO  ***************

INSERT INTO usuario VALUES (0001,'sergio'  ,'sergiohd@gmail.com'  ,'123456');
INSERT INTO usuario VALUES (0002,'fernando','fernandohd@gmail.com','123456');
INSERT INTO usuario VALUES (0003,'guillen' ,'guillen@gmail.com'   ,'123456');
INSERT INTO usuario VALUES (0004,'oliver'  ,'oliver@gmail.com'    ,'123456');


#***********  TABLA COMENTARIO ***************

INSERT INTO comentario VALUES (01,'esta pelicula es muy buena',1001,0001);
INSERT INTO comentario VALUES (02,'esta pelicula es muy buena',1002,0002);
INSERT INTO comentario VALUES (03,'esta pelicula es muy buena',1003,0003);
INSERT INTO comentario VALUES (04,'esta pelicula es muy buena',1004,0004);
INSERT INTO comentario VALUES (05,'esta pelicula es muy buena',1005,0001);
INSERT INTO comentario VALUES (06,'esta pelicula es muy buena',1005,0002);
INSERT INTO comentario VALUES (07,'esta pelicula es muy buena',1006,0003);
INSERT INTO comentario VALUES (08,'esta pelicula es muy buena',1001,0004);


#***********  TABLA VALORACION ***************

INSERT INTO valoracion VALUES (01,'5',1001,0001);
INSERT INTO valoracion VALUES (02,'5',1001,0004);
INSERT INTO valoracion VALUES (03,'5',1002,0002);
INSERT INTO valoracion VALUES (04,'5',1003,0003);
INSERT INTO valoracion VALUES (05,'5',1004,0004);
INSERT INTO valoracion VALUES (06,'5',1005,0001);
INSERT INTO valoracion VALUES (07,'5',1005,0002);
INSERT INTO valoracion VALUES (08,'5',1006,0003);



#***********  TABLA mi_lista ***************

INSERT INTO mi_lista VALUES (01,'+12',1001);
INSERT INTO mi_lista VALUES (02,'+12',1002);
INSERT INTO mi_lista VALUES (03,'+12',1003);
INSERT INTO mi_lista VALUES (04,'+12',1004);


#***********  TABLA guarda ***************

INSERT INTO guarda VALUES (01,1001);
INSERT INTO guarda VALUES (02,1002);
INSERT INTO guarda VALUES (03,1001);
INSERT INTO guarda VALUES (04,1003);


#***********  TABLA multimedia ***************

INSERT INTO multimedia VALUES (1001,'ALADIN'  ,'pelicula/infantil/disney' ,'Basada en el famoso cuento "Aladino y la lámpara maravillosa", la trama se sitúa en el exótico paisaje del mítico reino árabe de Agrabah. '                 ,83,1992,'pelicula','5',9001,1);
INSERT INTO multimedia VALUES (1002,'SHERK'   ,'pelicula/infantil/disney' ,'En un pantano muy lejano un ogro cascarrabias llamado Shrek, cuya preciada soledad se ve imprevistamente convulsionada por una invasión de molestos personajes de cuentos. ',90,2001,'pelicula','5',9001,1);
INSERT INTO multimedia VALUES (1003,'ONE PIECE' ,'series/anime/'      ,'El “Rey de los Piratas” Gold Roger, el hombre más poderoso del mundo, antes de morir desveló el paradero de su gran tesoro'                         ,24,2001,'1x1'   ,'9',9002,2);
INSERT INTO multimedia VALUES (1004,'ONE PIECE' ,'series/anime/'      ,'El “Rey de los Piratas” Gold Roger, el hombre más poderoso del mundo, antes de morir desveló el paradero de su gran tesoro'                         ,26,2001,'1x2'   ,'9',9002,2);

#***********  TABLA tipo_multimedia ***************

INSERT INTO tipo_multimedia VALUES (01,'PELICULA');
INSERT INTO tipo_multimedia VALUES (02,'SERIE'   );


#***********  TABLA genero ***************

INSERT INTO genero VALUES (01,'Acción y aventura'       );
INSERT INTO genero VALUES (02,'Anime'             );
INSERT INTO genero VALUES (03,'Infantil'            );
INSERT INTO genero VALUES (04,'Clásicas '           );
INSERT INTO genero VALUES (05,'Comedias'            );
INSERT INTO genero VALUES (06,'Documentales'          );
INSERT INTO genero VALUES (07,'Dramas'              );
INSERT INTO genero VALUES (08,'Terror '             );
INSERT INTO genero VALUES (09,'Románticas'            );
INSERT INTO genero VALUES (10,'Ciencia ficción y fantásticas ');
INSERT INTO genero VALUES (11,'Deportes'            );
INSERT INTO genero VALUES (12,'Thrillers'           );
INSERT INTO genero VALUES (13,'Series'              );

#***********  TABLA clasificacion  ***************

INSERT INTO clasificacion VALUES (03,1001);
INSERT INTO clasificacion VALUES (03,1002);
INSERT INTO clasificacion VALUES (13,1003);
INSERT INTO clasificacion VALUES (13,1004);

#***********  TABLA director  ***************

INSERT INTO director VALUES (01,'Ron Clements'  ,'/fotos/director');
INSERT INTO director VALUES (02,'John Musker'   ,'/fotos/director');
INSERT INTO director VALUES (03,'Andrew Adamson','/fotos/director');
INSERT INTO director VALUES (04,'Vicky Jenson'  ,'/fotos/director');
INSERT INTO director VALUES (05,'Eiichiro Oda'  ,'/fotos/director');


#***********  TABLA dirige  ***************

INSERT INTO dirige VALUES (1001,01);
INSERT INTO dirige VALUES (1001,02);
INSERT INTO dirige VALUES (1002,03);
INSERT INTO dirige VALUES (1002,04);
INSERT INTO dirige VALUES (1003,05);
INSERT INTO dirige VALUES (1004,05);


#***********  TABLA actor  ***************

INSERT INTO actor VALUES (01,'will smith','/fotos/actor');
INSERT INTO actor VALUES (02,'Mike Myers','/fotos/actor');
INSERT INTO actor VALUES (03,'lufy'      ,'/fotos/actor');
INSERT INTO actor VALUES (04,'zoro'      ,'/fotos/actor');


#***********  TABLA participa  ***************

INSERT INTO participa VALUES (01,1001);
INSERT INTO participa VALUES (02,1002);
INSERT INTO participa VALUES (03,1003);
INSERT INTO participa VALUES (04,1003);
INSERT INTO participa VALUES (03,1004);
INSERT INTO participa VALUES (04,1004);


#***********  TABLA formato  ***************

INSERT INTO formato VALUES (01,'AVI'  );
INSERT INTO formato VALUES (02,'MPG'  );
INSERT INTO formato VALUES (03,'WMV'  );
INSERT INTO formato VALUES (04,'H.264');
INSERT INTO formato VALUES (05,'MKV'  );
INSERT INTO formato VALUES (06,'DIVX' );
INSERT INTO formato VALUES (07,'XVID' );
INSERT INTO formato VALUES (08,'FLV'  );
INSERT INTO formato VALUES (09,'MP4'  );