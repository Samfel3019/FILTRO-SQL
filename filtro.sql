DROP DATABASE IF EXISTS transporte;

CREATE DATABASE transporte;

USE transporte;

DROP TABLE IF EXISTS `Rutas`;

CREATE TABLE `Rutas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Rutas` VALUES (1,'Universidades'),(2,'Cafe Madrid'),(3,'Cacique'),(4,'Diamantes'),(5,'Terminal'),(6,'Prado'),(7,'Cabecera'),(8,'Ciudadela'),(9,'Punta Estrella'),(10,'Niza'),(11,'Autopista'),(12,'Lagos'),(13,'Centro Florida');

DROP TABLE IF EXISTS `Estaciones`;

CREATE TABLE `Estaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Estaciones` VALUES (1,'Colseguros'),(2,'Clínica Chicamocha'),(3,'Plaza Guarín'),(4,'Mega Mall'),(5,'UIS'),(6,'UDI'),(7,'Santo Tomás'),(8,'Boulevard Santander'),(9,'Búcaros'),(10,'Rosita'),(11,'Puerta del sol'),(12,'Cacique'),(13,'Plaza Satélite'),(14,'La Sirena'),(15,'Provenza'),(16,'Fontana'),(17,'Gibraltar'),(18,'Terminal'),(19,'Mutis'),(20,'Plaza Real');

DROP TABLE IF EXISTS `estacionRutas`;

CREATE TABLE `estacion_Ruta` (
  `id_rutas` int NOT NULL,
  `id_estacion` int NOT NULL,
  `duracion` double NOT NULL,
  KEY `estacionRutas_id_rutas_fk` (`id_rutas`),
  KEY `estacionRutas_id_estacion_fk` (`id_estacion`),
  CONSTRAINT `estacionRutas_id_estacion_fk` FOREIGN KEY (`id_estacion`) REFERENCES `estacion` (`id`),
  CONSTRAINT `estacionRutas_id_rutas_fk` FOREIGN KEY (`id_rutas`) REFERENCES `Ruta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `estacion_Ruta` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(3,8),(3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(5,16),(5,17),(8,18),(8,19),(8,20);

DROP TABLE IF EXISTS `conductor`;

CREATE TABLE `conductor` (
  `id_buses` int NOT NULL,
  `id_rutas` int NOT NULL,
  `state` enum('Activo','Terminado','Cancelado') DEFAULT NULL,
  KEY `conductor_id_rutas_fk` (`id_rutas`),
  CONSTRAINT `conductor_id_rutas_fk` FOREIGN KEY (`id_rutas`) REFERENCES `Rutas` (`id`),
  CONSTRAINT `conductor_id_buses_pk` FOREIGN KEY (`id_buses`) REFERENCES `buses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `conductor` VALUES (1,'Andrés Manuel López Obrador'),(2,'Nicolás Maduro Moros'),(3,'Alberto Fernández'),(4,'Luiz Inácio Lula da Silva'),(5,'Gabriel Boric'),(6,'Miguel Diaz Canel'),(7,'Daniel Ortega'),(8,'Gustavo Petro Urrego'),(9,'Luis Arce'),(10,'Xiomara Castro');

DROP TABLE IF EXISTS `buses`;

CREATE TABLE `Buses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `buses` VALUES (1,'XVH345'),(2,'XDL965'),(3,'SXFG847'),(4,'XRJ452'),(5,'XDF459'),(6,'XET554'),(7,'XKL688'),(8,'XXL757');

CREATE TABLE `Camino` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Camino` WRITE;

INSERT INTO `Camino` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miércoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sabado'),(7,'Domingo');


