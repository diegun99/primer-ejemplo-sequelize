-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TIPO_DOCUMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_DOCUMENTO` (
  `ID_TIPO_DOC` VARCHAR(3) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_TIPO_DOC`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ESTADO_CIVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO_CIVIL` (
  `ID_ESTADO_CIVIL` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_ESTADO_CIVIL`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`NIVEL_EDUCATIVO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NIVEL_EDUCATIVO` (
  `ID_NIVEL_EDUCATIVO` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_NIVEL_EDUCATIVO`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ESTRATO_SOCIOECONOMICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTRATO_SOCIOECONOMICO` (
  `ID_ESTRATO` INT NOT NULL COMMENT 'IDENTIFICADOR DEL ESTRATO',
  `DESCRIPCION` VARCHAR(45) NOT NULL COMMENT '\'DESCRIPCION DEL ESTRATO\'',
  PRIMARY KEY (`ID_ESTRATO`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`REGIMEN_SALUD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REGIMEN_SALUD` (
  `ID_REGIMEN_SALUD` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_REGIMEN_SALUD`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`GENERO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GENERO` (
  `ID_GENERO` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_GENERO`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ENTREVISTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ENTREVISTADO` (
  `CODIGO_ENTREVISTA` INT NOT NULL,
  `NUM_DOCUMENTO` INT NOT NULL,
  `TIPO_DOCUMENTO` VARCHAR(3) NOT NULL,
  `NUM_TELEFONO` VARCHAR(45) NULL,
  `ESTADO_CIVIL` INT NOT NULL,
  `NIVEL_EDUCATIVO` INT NOT NULL,
  `EDAD` INT NOT NULL COMMENT 'REGISTRA LA EDAD DEL ENTREVISTADO',
  `ID_ESTRATO` INT NOT NULL,
  `ID_REGIMEN_SALUD` INT NOT NULL,
  `EPS` VARCHAR(45) NOT NULL COMMENT '\'REGISTRA LA EPS DEL ENTREVISTADO\'',
  `ZONA_RESIDENCIA` VARCHAR(45) NULL DEFAULT 'RURAL' COMMENT '\'SOLO TOMA LOS VALORES UNO DE LOS SIGUIENTES VALORES: RURAL O URBANA\'',
  `DIRECCION` VARCHAR(45) NOT NULL,
  `ESTUDIA_ACTUALMENTE` INT(1) NOT NULL COMMENT 'REGISTRA SI O NO\nSI = 1, NO = 0',
  `TRABAJA_ACTUALMENTE` INT(1) NOT NULL COMMENT 'REGISTRA SI o NO\nSI = 1, NO = 0',
  `HIJOS` INT(1) NOT NULL COMMENT 'REGISTRA SI O NO\nSI =1\nNO =0',
  `NUM_HIJOS` INT NULL,
  `DEPENDENCIA_ECONOMICA` INT(1) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1, NO = 0',
  `GENERO_ID_GENERO` INT NOT NULL,
  PRIMARY KEY (`CODIGO_ENTREVISTA`),
  INDEX `fk_ENTREVISTADO_TIPO_DOCUMENTO_idx` (`TIPO_DOCUMENTO` ASC) ,
  INDEX `fk_ENTREVISTADO_ESTADO_CIVIL1_idx` (`ESTADO_CIVIL` ASC) ,
  INDEX `fk_ENTREVISTADO_NIVEL_EDUCATIVO1_idx` (`NIVEL_EDUCATIVO` ASC) ,
  INDEX `fk_ENTREVISTADO_ESTRATO_SOCIOECONOMICO1_idx` (`ID_ESTRATO` ASC) ,
  INDEX `fk_ENTREVISTADO_REGIMEN_SALUD1_idx` (`ID_REGIMEN_SALUD` ASC) ,
  INDEX `fk_ENTREVISTADO_GENERO1_idx` (`GENERO_ID_GENERO` ASC) )
ENGINE = InnoDB
KEY_BLOCK_SIZE = 16;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`INTERPRETACION_IMC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INTERPRETACION_IMC` (
  `ID_INTERPRETACION` INT NOT NULL,
  `IMC` REAL NOT NULL,
  `INTERPRETACION` VARCHAR(45) NOT NULL,
  `RECOMENDACION` TEXT(1000) NOT NULL,
  PRIMARY KEY (`ID_INTERPRETACION`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`FREC_CONS_FRUTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FREC_CONS_FRUTAS` (
  `ID_CONS_FRUTAS` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_CONS_FRUTAS`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`DIAGNOSTICO_DIABETES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DIAGNOSTICO_DIABETES` (
  `ID_DIAGNOSTICO_DIABETES` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_DIAGNOSTICO_DIABETES`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TAMIZAJE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TAMIZAJE` (
  `ID_TAMIZAJE` INT NOT NULL,
  `PESO` DOUBLE NOT NULL,
  `IMC` DOUBLE NULL,
  `PERIMETRO_ABDOMINAL` DOUBLE NOT NULL,
  `TENSION_ARTERIAL` INT NOT NULL,
  `ACTIVIDAD_FISICA` INT(1) NULL COMMENT 'ALMACENA SI o NO\nSI = 1, NO = 0',
  `CODIGO_ENTREVISTA` INT NOT NULL,
  `INTERPRETACION_IMC` INT NOT NULL,
  `FREC_CONS_FRUTAS` INT NOT NULL,
  `HIPERTENSION` INT(1) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1\nNO = 0\n',
  `MEDICAMENTOS_HTA` VARCHAR(2) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1\nNO = 0',
  `NIVEL_AZUCAR` VARCHAR(2) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1\nNO = 0',
  `DIAGNOSTICO_DIABETES` INT NOT NULL,
  `ES_DIABETICO` INT(1) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1 \nNO = 0',
  `FUMA` INT(1) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1\nNO = 0',
  PRIMARY KEY (`ID_TAMIZAJE`),
  INDEX `fk_TAMIZAJE_ENTREVISTADO1_idx` (`CODIGO_ENTREVISTA` ASC) ,
  INDEX `fk_TAMIZAJE_INTERPRETACION_IMC1_idx` (`INTERPRETACION_IMC` ASC) ,
  INDEX `fk_TAMIZAJE_FREC_CONS_FRUTAS1_idx` (`FREC_CONS_FRUTAS` ASC) ,
  INDEX `fk_TAMIZAJE_DIAGNOSTICO_DIABETES1_idx` (`DIAGNOSTICO_DIABETES` ASC) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`PUNTAJE_X_EDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PUNTAJE_X_EDAD` (
  `ID_PUNTAJE_EDAD` INT NOT NULL,
  `RANGO_EDAD` VARCHAR(45) NOT NULL,
  `ESCALA` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_PUNTAJE_EDAD`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`IMC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`IMC` (
  `ID_IMC` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `ESCALA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_IMC`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`PERIM_ABDOMEN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERIM_ABDOMEN` (
  `ID_PERIM_ABDOMEN` INT NOT NULL,
  `GENERO` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `ESCALA` TINYTEXT NOT NULL,
  PRIMARY KEY (`ID_PERIM_ABDOMEN`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ACTIV_FISICA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ACTIV_FISICA` (
  `ID_ACTIV_FISICA` INT NOT NULL,
  `DESCRIPCION` TINYTEXT NOT NULL,
  `ESCALA` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_ACTIV_FISICA`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CONS_FRUTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONS_FRUTAS` (
  `ID_CONS_FRUTAS` INT NOT NULL,
  `FRECUENCIA` VARCHAR(45) NOT NULL,
  `ESCALA` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_CONS_FRUTAS`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`MEDICAMENTOS_HTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICAMENTOS_HTA` (
  `ID_MEDICAMENTOS_HTA` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `ESCALA` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_MEDICAMENTOS_HTA`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`NIVEL_GLUCOSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NIVEL_GLUCOSA` (
  `ID_NIVEL_GLUCOSA` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `ESCALA` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_NIVEL_GLUCOSA`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`FAMILIA_DIABETICOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FAMILIA_DIABETICOS` (
  `ID_FAMILIA_DIABETICOS` INT NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `ESCALA` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_FAMILIA_DIABETICOS`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`INFO_RIESGO_DIABETES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INFO_RIESGO_DIABETES` (
  `ID_RIESGO_DIABETES` INT NOT NULL COMMENT 'LA TABLA ALMACENA EL MENSAJE QUE SE GENERA COMO RESULTADO DE SUMAR LAS VARIABLES QUE GENERAN EL PUNTAJE Y ASI OBTENER LA CLASIFICACION DE RIESGO PARA DIABETES',
  `DESCRIPCION_PUNTAJE` VARCHAR(45) NOT NULL COMMENT 'ALMACENA LOS RANGOS DE PUNTAJES PARA GENERAR LOS MENSAJES DE ORIENTACION AL ENTREVISTADO',
  `NIVEL_RIESGO` VARCHAR(45) NOT NULL COMMENT 'ALMACENA EL NIVEL DE RIESGO DE DIABETES',
  `MENSAJE` TEXT(1000) NOT NULL COMMENT 'CORRESPONDE AL MENSAJE QUE SE DA AL ENTREVISTADO A PARTIR DEL CALCULO DE RIESGO',
  PRIMARY KEY (`ID_RIESGO_DIABETES`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`RIESGO_DIABETES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RIESGO_DIABETES` (
  `ID_RIESGO_CARDIOVASCULAR` INT NOT NULL,
  `PUNTAJE_X_EDAD` INT NOT NULL,
  `IMC` INT NOT NULL,
  `PERIM_ABDOMEN` INT NOT NULL,
  `ACTIV_FISICA` INT NOT NULL,
  `CODIGO_ENTREVISTA` INT NOT NULL,
  `CONS_FRUTAS` INT NOT NULL,
  `MEDICAMENTOS_HTA` INT NOT NULL,
  `NIVEL_GLUCOSA` INT NOT NULL,
  `FAMILIA_DIABETICOS` INT NOT NULL,
  `RIESGO_DIABETES` INT NOT NULL,
  `PUNTAJE` TINYINT(3) NOT NULL,
  PRIMARY KEY (`ID_RIESGO_CARDIOVASCULAR`),
  INDEX `fk_RIESGO_CARDIOVASCULAR_PUNTAJE_X_EDAD1_idx` (`PUNTAJE_X_EDAD` ASC) ,
  INDEX `fk_RIESGO_CARDIOVASCULAR_IMC1_idx` (`IMC` ASC) ,
  INDEX `fk_RIESGO_CARDIOVASCULAR_PERIM_ABDOMEN1_idx` (`PERIM_ABDOMEN` ASC) ,
  INDEX `fk_RIESGO_CARDIOVASCULAR_ACTIV_FISICA1_idx` (`ACTIV_FISICA` ASC) ,
  INDEX `fk_RIESGO_DIABETES_ENTREVISTADO1_idx` (`CODIGO_ENTREVISTA` ASC) ,
  INDEX `fk_RIESGO_DIABETES_CONS_FRUTAS1_idx` (`CONS_FRUTAS` ASC) ,
  INDEX `fk_RIESGO_DIABETES_MEDICAMENTOS_HTA1_idx` (`MEDICAMENTOS_HTA` ASC) ,
  INDEX `fk_RIESGO_DIABETES_NIVEL_GLUCOSA1_idx` (`NIVEL_GLUCOSA` ASC) ,
  INDEX `fk_RIESGO_DIABETES_FAMILIA_DIABETICOS1_idx` (`FAMILIA_DIABETICOS` ASC) ,
  INDEX `fk_RIESGO_DIABETES_RESULTADO_DIABETES1_idx` (`RIESGO_DIABETES` ASC) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CALCULO_RCV`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CALCULO_RCV` (
  `ID_CALCULO_RCV` INT NOT NULL,
  `PORCENTAJE` INT(3) NOT NULL,
  `NIVEL_RIESGO` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL COMMENT 'REGISTRA LOS PORCENTAJES DE RIESGO',
  `COLOR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_CALCULO_RCV`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`RIESGO_CARDIOVASCULAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RIESGO_CARDIOVASCULAR` (
  `ID_RIESGO_CARDIOVASCULAR` INT NOT NULL COMMENT 'ESTA TABLA ALMACENA LOS DATOS PRECARGADOS PARA GENERAR RESULTADOS Y PODER INFORMAR SI EL ENTREVISTADO TIENE O NO RIESGO CARDIOVASCULAR, SEGUN LA TABLA Y LOS COLORES',
  `DIABETES` INT(1) NOT NULL COMMENT 'ALMACENA SI o NO\nSI=1\nNO =0',
  `GENERO` INT(1) NOT NULL COMMENT 'ALMACENA HOMBRE, MUJER\nHOMBRE = 1\nMUJER= 0',
  `FUMADOR` INT(1) NOT NULL COMMENT 'ALMACENA SI o NO\nSI = 1\nNO = 0',
  `PRESION_ARTERIAL` INT(3) NOT NULL,
  `COLOR` VARCHAR(45) NOT NULL,
  `PUNTAJE_BASE` INT(3) NOT NULL,
  `CALCULO_RCV` INT NOT NULL,
  PRIMARY KEY (`ID_RIESGO_CARDIOVASCULAR`),
  INDEX `fk_RIESGO_CARDIOVASCULAR_CALCULO_RCV1_idx` (`CALCULO_RCV` ASC) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`RESULTADO_RCV`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RESULTADO_RCV` (
  `ID_RESULTADO_RCV` INT NOT NULL,
  `ID_TAMIZAJE` INT NOT NULL,
  `RESULTADO_RIESGO_CV` INT NOT NULL,
  PRIMARY KEY (`ID_RESULTADO_RCV`, `ID_TAMIZAJE`),
  INDEX `fk_RESULTADO_RCV_TAMIZAJE1_idx` (`ID_TAMIZAJE` ASC) ,
  INDEX `fk_RESULTADO_RCV_RIESGO_CARDIOVASCULAR1_idx` (`RESULTADO_RIESGO_CV` ASC) )
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`TIPO_DOCUMENTO`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`TIPO_DOCUMENTO` (`ID_TIPO_DOC`, `DESCRIPCION`) VALUES ('1', 'CEDULA DE CIUDADANIA');
INSERT INTO `mydb`.`TIPO_DOCUMENTO` (`ID_TIPO_DOC`, `DESCRIPCION`) VALUES ('2', 'CEDULA DE EXTRANJERIA');
INSERT INTO `mydb`.`TIPO_DOCUMENTO` (`ID_TIPO_DOC`, `DESCRIPCION`) VALUES ('3', 'PASAPORTE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ESTADO_CIVIL`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ESTADO_CIVIL` (`ID_ESTADO_CIVIL`, `DESCRIPCION`) VALUES (1, 'SOLTERO(A)');
INSERT INTO `mydb`.`ESTADO_CIVIL` (`ID_ESTADO_CIVIL`, `DESCRIPCION`) VALUES (2, 'CASADO(A)');
INSERT INTO `mydb`.`ESTADO_CIVIL` (`ID_ESTADO_CIVIL`, `DESCRIPCION`) VALUES (3, 'UNION LIBRE');
INSERT INTO `mydb`.`ESTADO_CIVIL` (`ID_ESTADO_CIVIL`, `DESCRIPCION`) VALUES (4, 'OTRO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`NIVEL_EDUCATIVO`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (1, 'BASICA PRIMARIA (1-5 PRIMARIA)');
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (2, 'BASICA SECUNDARIA (6-9 BACHILLERATO)');
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (3, 'MEDIA (10 Y 11 BACHILLERATO)');
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (4, 'TECNICO');
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (5, 'TECNOLOGICO');
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (6, 'UNIVERSITARIO');
INSERT INTO `mydb`.`NIVEL_EDUCATIVO` (`ID_NIVEL_EDUCATIVO`, `DESCRIPCION`) VALUES (7, 'POSTGRADO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ESTRATO_SOCIOECONOMICO`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ESTRATO_SOCIOECONOMICO` (`ID_ESTRATO`, `DESCRIPCION`) VALUES (1, 'ESTRATO 1');
INSERT INTO `mydb`.`ESTRATO_SOCIOECONOMICO` (`ID_ESTRATO`, `DESCRIPCION`) VALUES (2, 'ESTRATO 2');
INSERT INTO `mydb`.`ESTRATO_SOCIOECONOMICO` (`ID_ESTRATO`, `DESCRIPCION`) VALUES (3, 'ESTRATO 3');
INSERT INTO `mydb`.`ESTRATO_SOCIOECONOMICO` (`ID_ESTRATO`, `DESCRIPCION`) VALUES (4, 'ESTRATO 4');
INSERT INTO `mydb`.`ESTRATO_SOCIOECONOMICO` (`ID_ESTRATO`, `DESCRIPCION`) VALUES (5, 'ESTRATO 5');
INSERT INTO `mydb`.`ESTRATO_SOCIOECONOMICO` (`ID_ESTRATO`, `DESCRIPCION`) VALUES (6, 'ESTRATO 6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`REGIMEN_SALUD`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`REGIMEN_SALUD` (`ID_REGIMEN_SALUD`, `DESCRIPCION`) VALUES (1, 'CONTRIBUTIVO');
INSERT INTO `mydb`.`REGIMEN_SALUD` (`ID_REGIMEN_SALUD`, `DESCRIPCION`) VALUES (2, 'SUBSIDIADO');
INSERT INTO `mydb`.`REGIMEN_SALUD` (`ID_REGIMEN_SALUD`, `DESCRIPCION`) VALUES (3, 'ESPECIAL');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`GENERO`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`GENERO` (`ID_GENERO`, `DESCRIPCION`) VALUES (1, 'MASCULINO');
INSERT INTO `mydb`.`GENERO` (`ID_GENERO`, `DESCRIPCION`) VALUES (2, 'FEMENINO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`INTERPRETACION_IMC`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`INTERPRETACION_IMC` (`ID_INTERPRETACION`, `IMC`, `INTERPRETACION`, `RECOMENDACION`) VALUES (1, 18.5, 'BAJO PESO', 'Usted tiene bajo peso. Son diversas las causas de bajo peso y  por eso le sugerimos que visite a su médico para recibir la  orientación profesional correspondiente');
INSERT INTO `mydb`.`INTERPRETACION_IMC` (`ID_INTERPRETACION`, `IMC`, `INTERPRETACION`, `RECOMENDACION`) VALUES (2, 24.9, 'PESO NORMAL', 'Usted tiene un peso normal. Controle su peso mensualmente, haga ejercicio de manera regular e incluya el consumo de frutas y  verduras en su alimentación diaria y disminuya el consumo de  sal, azúcares, grasas saturadas y grasas trans.');
INSERT INTO `mydb`.`INTERPRETACION_IMC` (`ID_INTERPRETACION`, `IMC`, `INTERPRETACION`, `RECOMENDACION`) VALUES (3, 29.9, 'SOBRE PESO', 'Usted tiene sobrepeso. Esto indica un peso no saludable y una acumulación excesiva de grasa en el cuerpo. Tenga en cuenta que el sobrepeso está relacionado con enfermedades como la diabetes, la hipertensión, el infarto, la trombosis, la artritis y algunos tipos de cánceres como el cáncer de mama y el cáncer de colon. Le recomendamos hacer ejercicio de manera regular e incluir alimentos naturales y frescos como las frutas y las verduras en su alimentación diaria; disminuya el consumo de sal, azúcares, grasas saturadas y grasas trans. Visite a su  médico para recibir la orientación profesional correspondiente');
INSERT INTO `mydb`.`INTERPRETACION_IMC` (`ID_INTERPRETACION`, `IMC`, `INTERPRETACION`, `RECOMENDACION`) VALUES (4, 34.9, 'OBESIDAD CLASE I', 'Usted sufre de obesidad, lo cual indica un rango de peso no saludable y una acumulación excesiva de grasa en el cuerpo. Tenga en cuenta que la obesidad está relacionada con enfermedades como la diabetes, la hipertensión, el infarto, la trombosis, la artritis y algunos tipos de cánceres como el cáncer de mama y el cáncer de colon. Le recomendamos hacer ejercicio de forma regular e incluir en su alimentación diaria alimentos naturales y frescos como las frutas y las verduras; disminuya el consumo de sal, azúcares, grasas saturadas y grasas trans, que generalmente están presentes en los alimentos procesados y ultraprocesados. Visite a su médico para recibir la orientación  profesional correspondiente');
INSERT INTO `mydb`.`INTERPRETACION_IMC` (`ID_INTERPRETACION`, `IMC`, `INTERPRETACION`, `RECOMENDACION`) VALUES (5, 39.9, 'OBESIDAD CLASE II', 'Usted sufre de obesidad, lo cual indica un rango de peso no saludable y una acumulación excesiva de grasa en el cuerpo. Tenga en cuenta que la obesidad está relacionada con enfermedades como la diabetes, la hipertensión, el infarto, la trombosis, la artritis y algunos tipos de cánceres como el cáncer de mama y el cáncer de colon. Le recomendamos hacer ejercicio de forma regular e incluir en su alimentación diaria alimentos naturales y frescos como las frutas y las verduras; disminuya el consumo de sal, azúcares, grasas saturadas y grasas trans, que generalmente están presentes en los alimentos procesados y ultraprocesados. Visite a su médico para recibir la orientación  profesional correspondiente');
INSERT INTO `mydb`.`INTERPRETACION_IMC` (`ID_INTERPRETACION`, `IMC`, `INTERPRETACION`, `RECOMENDACION`) VALUES (6, 40, 'OBESIDAD CLASE III', 'Usted sufre de obesidad, lo cual indica un rango de peso no saludable y una acumulación excesiva de grasa en el cuerpo. Tenga en cuenta que la obesidad está relacionada con enfermedades como la diabetes, la hipertensión, el infarto, la trombosis, la artritis y algunos tipos de cánceres como el cáncer de mama y el cáncer de colon. Le recomendamos hacer ejercicio de forma regular e incluir en su alimentación diaria alimentos naturales y frescos como las frutas y las verduras; disminuya el consumo de sal, azúcares, grasas saturadas y grasas trans, que generalmente están presentes en los alimentos procesados y ultraprocesados. Visite a su médico para recibir la orientación  profesional correspondiente');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`FREC_CONS_FRUTAS`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`FREC_CONS_FRUTAS` (`ID_CONS_FRUTAS`, `DESCRIPCION`) VALUES (1, 'TODOS LOS DIAS');
INSERT INTO `mydb`.`FREC_CONS_FRUTAS` (`ID_CONS_FRUTAS`, `DESCRIPCION`) VALUES (2, 'NO TODOS LOS DIAS');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`DIAGNOSTICO_DIABETES`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`DIAGNOSTICO_DIABETES` (`ID_DIAGNOSTICO_DIABETES`, `DESCRIPCION`) VALUES (1, 'SÍ: PADRES, HERMANOS, HIJOS');
INSERT INTO `mydb`.`DIAGNOSTICO_DIABETES` (`ID_DIAGNOSTICO_DIABETES`, `DESCRIPCION`) VALUES (2, 'SÍ: ABUELOS, TIOS, PRIMOS');
INSERT INTO `mydb`.`DIAGNOSTICO_DIABETES` (`ID_DIAGNOSTICO_DIABETES`, `DESCRIPCION`) VALUES (3, 'NO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`PUNTAJE_X_EDAD`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`PUNTAJE_X_EDAD` (`ID_PUNTAJE_EDAD`, `RANGO_EDAD`, `ESCALA`) VALUES (1, 'MENOS DE 45 AÑOS', 0);
INSERT INTO `mydb`.`PUNTAJE_X_EDAD` (`ID_PUNTAJE_EDAD`, `RANGO_EDAD`, `ESCALA`) VALUES (2, '45 - 54 AÑOS', 2);
INSERT INTO `mydb`.`PUNTAJE_X_EDAD` (`ID_PUNTAJE_EDAD`, `RANGO_EDAD`, `ESCALA`) VALUES (3, '55 - 64 AÑOS', 3);
INSERT INTO `mydb`.`PUNTAJE_X_EDAD` (`ID_PUNTAJE_EDAD`, `RANGO_EDAD`, `ESCALA`) VALUES (4, 'MÁS DE 64 AÑOS', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`IMC`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`IMC` (`ID_IMC`, `DESCRIPCION`, `ESCALA`) VALUES (1, 'MENOR DE 25 Kg/m2', '0');
INSERT INTO `mydb`.`IMC` (`ID_IMC`, `DESCRIPCION`, `ESCALA`) VALUES (2, 'ENTRE 25 - 30 Kg/m2', '1');
INSERT INTO `mydb`.`IMC` (`ID_IMC`, `DESCRIPCION`, `ESCALA`) VALUES (3, 'MAYOR DE 30 Kg/m2', '3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`PERIM_ABDOMEN`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`PERIM_ABDOMEN` (`ID_PERIM_ABDOMEN`, `GENERO`, `DESCRIPCION`, `ESCALA`) VALUES (1, 'EN HOMBRES', 'MENOS DE 94 CM', '0');
INSERT INTO `mydb`.`PERIM_ABDOMEN` (`ID_PERIM_ABDOMEN`, `GENERO`, `DESCRIPCION`, `ESCALA`) VALUES (2, 'EN MUJERES', 'MENOS DE 90 CM', '0');
INSERT INTO `mydb`.`PERIM_ABDOMEN` (`ID_PERIM_ABDOMEN`, `GENERO`, `DESCRIPCION`, `ESCALA`) VALUES (3, 'EN HOMBRES', '94 CM O MAS', '4');
INSERT INTO `mydb`.`PERIM_ABDOMEN` (`ID_PERIM_ABDOMEN`, `GENERO`, `DESCRIPCION`, `ESCALA`) VALUES (4, 'EN MUJERES', '90 CM O MAS', '4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ACTIV_FISICA`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ACTIV_FISICA` (`ID_ACTIV_FISICA`, `DESCRIPCION`, `ESCALA`) VALUES (1, 'SI', 0);
INSERT INTO `mydb`.`ACTIV_FISICA` (`ID_ACTIV_FISICA`, `DESCRIPCION`, `ESCALA`) VALUES (2, 'NO', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`CONS_FRUTAS`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`CONS_FRUTAS` (`ID_CONS_FRUTAS`, `FRECUENCIA`, `ESCALA`) VALUES (1, 'TODOS LOS DIAS', 0);
INSERT INTO `mydb`.`CONS_FRUTAS` (`ID_CONS_FRUTAS`, `FRECUENCIA`, `ESCALA`) VALUES (2, 'NO TODOS LOS DIAS', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`MEDICAMENTOS_HTA`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`MEDICAMENTOS_HTA` (`ID_MEDICAMENTOS_HTA`, `DESCRIPCION`, `ESCALA`) VALUES (1, 'NO', 0);
INSERT INTO `mydb`.`MEDICAMENTOS_HTA` (`ID_MEDICAMENTOS_HTA`, `DESCRIPCION`, `ESCALA`) VALUES (2, 'SI', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`NIVEL_GLUCOSA`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`NIVEL_GLUCOSA` (`ID_NIVEL_GLUCOSA`, `DESCRIPCION`, `ESCALA`) VALUES (1, 'NO', 0);
INSERT INTO `mydb`.`NIVEL_GLUCOSA` (`ID_NIVEL_GLUCOSA`, `DESCRIPCION`, `ESCALA`) VALUES (2, 'SI', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`FAMILIA_DIABETICOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`FAMILIA_DIABETICOS` (`ID_FAMILIA_DIABETICOS`, `DESCRIPCION`, `ESCALA`) VALUES (1, 'NO', 0);
INSERT INTO `mydb`.`FAMILIA_DIABETICOS` (`ID_FAMILIA_DIABETICOS`, `DESCRIPCION`, `ESCALA`) VALUES (2, 'SI: EN ABUELOS, TIA, TIO PRIMO HERMANO', 3);
INSERT INTO `mydb`.`FAMILIA_DIABETICOS` (`ID_FAMILIA_DIABETICOS`, `DESCRIPCION`, `ESCALA`) VALUES (3, 'SI: EN PADRES, HERMANOS O HIJOS', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`INFO_RIESGO_DIABETES`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`INFO_RIESGO_DIABETES` (`ID_RIESGO_DIABETES`, `DESCRIPCION_PUNTAJE`, `NIVEL_RIESGO`, `MENSAJE`) VALUES (1, 'MAYOR A 12 PUNTOS', 'ALTO', 'Usted tiene un riesgo alto de tener diabetes y prediabetes. Sugerimos que usted pida una cita a su EPS o su médico para  que le realice una prueba de glicemia en ayuno y reciba  consejo sobre cómo cambiar sus hábitos de vida para mejorar  su salud.');
INSERT INTO `mydb`.`INFO_RIESGO_DIABETES` (`ID_RIESGO_DIABETES`, `DESCRIPCION_PUNTAJE`, `NIVEL_RIESGO`, `MENSAJE`) VALUES (2, '10 - 12 PUNTOS', 'MEDIO', 'Usted tiene un riesgo moderado de tener diabetes y prediabetes. Sugerimos que considere aumentar su actividad física, mejorar sus hábitos de alimentación y prestar atención a su peso, para prevenir el desarrollo de diabetes. Los cambios en su estilo de vida pueden prevenir completamente la diabetes o al menos retrasar su inicio hasta edades ya muy avanzadas.');
INSERT INTO `mydb`.`INFO_RIESGO_DIABETES` (`ID_RIESGO_DIABETES`, `DESCRIPCION_PUNTAJE`, `NIVEL_RIESGO`, `MENSAJE`) VALUES (3, 'MENOR A 10 PUNTOS', 'BAJO', '¡Felicitaciones! Usted tiene un riesgo bajo para desarrollar diabetes. Le sugerimos que controle su peso regularmente, consuma frutas y verduras diariamente y practique al menos 30 minutos de actividad física con intensidad moderada por día, para así mantener y mejorar su salud.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`CALCULO_RCV`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`CALCULO_RCV` (`ID_CALCULO_RCV`, `PORCENTAJE`, `NIVEL_RIESGO`, `DESCRIPCION`, `COLOR`) VALUES (1, 10, 'RIESGO BAJO', '< 10 %', 'VERDE');
INSERT INTO `mydb`.`CALCULO_RCV` (`ID_CALCULO_RCV`, `PORCENTAJE`, `NIVEL_RIESGO`, `DESCRIPCION`, `COLOR`) VALUES (2, 20, 'RIESGO MODERADO', '10 a < 20%', 'AMARILLO');
INSERT INTO `mydb`.`CALCULO_RCV` (`ID_CALCULO_RCV`, `PORCENTAJE`, `NIVEL_RIESGO`, `DESCRIPCION`, `COLOR`) VALUES (3, 30, 'RIESGO ALTO', '20 a <30%', 'NARANJA');
INSERT INTO `mydb`.`CALCULO_RCV` (`ID_CALCULO_RCV`, `PORCENTAJE`, `NIVEL_RIESGO`, `DESCRIPCION`, `COLOR`) VALUES (4, 39, 'RIESGO MUY ALTO', '30 a <40%', 'ROJO');
INSERT INTO `mydb`.`CALCULO_RCV` (`ID_CALCULO_RCV`, `PORCENTAJE`, `NIVEL_RIESGO`, `DESCRIPCION`, `COLOR`) VALUES (5, 40, 'RIESGO EXTREMADAMENTE ALTO', '>= 40%', 'VINO TINTO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`RIESGO_CARDIOVASCULAR`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (1, 0, 1, 0, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (2, 0, 1, 0, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (3, 0, 1, 0, 160, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (4, 0, 1, 0, 180, 'NARANJA', 30, 3);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (5, 0, 1, 1, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (6, 0, 1, 1, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (7, 0, 1, 1, 160, 'AMARILLO', 20, 2);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (8, 0, 1, 1, 180, 'VINO TINTO', 40, 5);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (9, 0, 2, 0, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (10, 0, 2, 0, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (11, 0, 2, 0, 160, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (12, 0, 2, 0, 180, 'ROJO', 39, 4);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (13, 0, 2, 1, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (14, 0, 2, 1, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (15, 0, 2, 1, 160, 'AMARILLO', 20, 2);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (16, 0, 2, 1, 180, 'VINO TINTO', 40, 5);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (17, 1, 1, 0, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (18, 1, 1, 0, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (19, 1, 1, 0, 160, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (20, 1, 1, 0, 180, 'ROJO', 39, 4);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (21, 1, 1, 1, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (22, 1, 1, 1, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (23, 1, 1, 1, 160, 'NARANJA', 30, 3);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (24, 1, 1, 1, 180, 'VINO TINTO', 40, 5);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (25, 1, 2, 0, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (26, 1, 2, 0, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (27, 1, 2, 0, 160, 'AMARILLO', 20, 2);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (28, 1, 2, 0, 180, 'VINO TINTO', 40, 5);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (29, 1, 2, 1, 120, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (30, 1, 2, 1, 140, 'VERDE', 10, 1);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (31, 1, 2, 1, 160, 'ROJO', 39, 4);
INSERT INTO `mydb`.`RIESGO_CARDIOVASCULAR` (`ID_RIESGO_CARDIOVASCULAR`, `DIABETES`, `GENERO`, `FUMADOR`, `PRESION_ARTERIAL`, `COLOR`, `PUNTAJE_BASE`, `CALCULO_RCV`) VALUES (32, 1, 2, 1, 180, 'VINO TINTO', 40, 5);

COMMIT;

