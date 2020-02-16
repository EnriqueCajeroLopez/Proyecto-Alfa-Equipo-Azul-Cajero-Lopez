-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Recursos_Humanos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Recursos_Humanos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Recursos_Humanos` DEFAULT CHARACTER SET utf8 ;
USE `Recursos_Humanos` ;

-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Estado_Civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Estado_Civil` (
  `idEstado_Civil` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstado_Civil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Candidato` (
  `Curp` VARCHAR(18) NOT NULL,
  `RFC` VARCHAR(13) NULL,
  `Nombre` VARCHAR(50) NULL,
  `Domicilio` VARCHAR(100) NULL,
  `Telefono` VARCHAR(15) NULL,
  `Email` VARCHAR(50) NULL,
  `Sexo` CHAR NULL,
  `Edad` TINYINT(2) NULL,
  `NSS` VARCHAR(11) NULL,
  `Fotografia` BLOB NULL,
  `idEstado_Civil` INT NOT NULL,
  PRIMARY KEY (`Curp`),
  CONSTRAINT `fk_Candidato_Estado_Civil1`
    FOREIGN KEY (`idEstado_Civil`)
    REFERENCES `Recursos_Humanos`.`Estado_Civil` (`idEstado_Civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Carrera` (
  `idCarrera` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCarrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Puesto` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(90) NULL,
  `Salario_Anual` DECIMAL(7) NULL,
  `Beneficios` VARCHAR(100) NULL,
  `Bonos` DECIMAL(7) NULL,
  `N_Vacantes` INT NULL,
  `N_solicitantes` INT NULL,
  `Plazas` INT NULL,
  `Localizacion` VARCHAR(50) NULL,
  `Autorizacion` VARCHAR(10) NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Nivel_Academico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Nivel_Academico` (
  `idNivel_Academico` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idNivel_Academico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Idioma` (
  `idIdioma` INT NOT NULL AUTO_INCREMENT,
  `Lenguaje` VARCHAR(30) NULL,
  PRIMARY KEY (`idIdioma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Nivel_Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Nivel_Idioma` (
  `idNivel_Idioma` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  `idIdioma` INT NOT NULL,
  PRIMARY KEY (`idNivel_Idioma`),
  CONSTRAINT `fk_Nivel_Idioma_Idioma1`
    FOREIGN KEY (`idIdioma`)
    REFERENCES `Recursos_Humanos`.`Idioma` (`idIdioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `Descrpcion` VARCHAR(250) NULL,
  `idPuesto` INT NOT NULL,
  `idNivel_Academico` INT NOT NULL,
  `Carrera_idCarrera` INT NOT NULL,
  `idNivel_Idioma` INT NOT NULL,
  PRIMARY KEY (`idPerfil`),
  CONSTRAINT `fk_Perfil_Puesto1`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `Recursos_Humanos`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Nivel_Academico1`
    FOREIGN KEY (`idNivel_Academico`)
    REFERENCES `Recursos_Humanos`.`Nivel_Academico` (`idNivel_Academico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `Recursos_Humanos`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Nivel_Idioma1`
    FOREIGN KEY (`idNivel_Idioma`)
    REFERENCES `Recursos_Humanos`.`Nivel_Idioma` (`idNivel_Idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Medio_Publicidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Medio_Publicidad` (
  `idMedio_Publicidad` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedio_Publicidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Datos_de_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Datos_de_empresa` (
  `Nombre_de_empresa` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(100) NULL,
  `Estructura_Juridica` VARCHAR(50) NULL,
  `Razon_Social` VARCHAR(50) NULL,
  `Email` VARCHAR(50) NULL,
  `Domicilo` VARCHAR(100) NULL,
  `Telefono` VARCHAR(20) NULL,
  `Encargado` VARCHAR(50) NULL,
  `CIF_de_empresa` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre_de_empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Contacto` (
  `idcomtacto` INT NOT NULL,
  `Nombre` VARCHAR(90) NULL,
  `Email_de_Contacto` VARCHAR(50) NULL,
  `Numero_Telefonico` VARCHAR(15) NULL,
  PRIMARY KEY (`idcomtacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Anuncio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Anuncio` (
  `idAnuncio` INT NOT NULL AUTO_INCREMENT,
  `Titulo_Del_Puesto` VARCHAR(45) NULL,
  `Fecha_de_cierre` DATE NULL,
  `idPuesto` INT NOT NULL,
  `idMedio_Publicidad` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  `Nombre_de_empresa` VARCHAR(100) NOT NULL,
  `Contacto_idcomtacto` INT NOT NULL,
  PRIMARY KEY (`idAnuncio`),
  CONSTRAINT `fk_Anuncio_Puesto1`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `Recursos_Humanos`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anuncio_Medio_Publicidad1`
    FOREIGN KEY (`idMedio_Publicidad`)
    REFERENCES `Recursos_Humanos`.`Medio_Publicidad` (`idMedio_Publicidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anuncio_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anuncio_Datos_de_empresa1`
    FOREIGN KEY (`Nombre_de_empresa`)
    REFERENCES `Recursos_Humanos`.`Datos_de_empresa` (`Nombre_de_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anuncio_Contacto1`
    FOREIGN KEY (`Contacto_idcomtacto`)
    REFERENCES `Recursos_Humanos`.`Contacto` (`idcomtacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Estatus_Solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Estatus_Solicitud` (
  `idEstatus_Solicitud` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstatus_Solicitud`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Solicitud_de_Puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Solicitud_de_Puesto` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Puesto` VARCHAR(50) NULL,
  `Vacantes` INT NULL,
  `Solicitantes` INT NULL,
  `Fecha_Solicitud` DATE NULL,
  `Fecha_Estatus` DATE NULL,
  `idPuesto` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  `idEstatus_Solicitud` INT NOT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_Solicitud_de_Puesto_Puesto1`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `Recursos_Humanos`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_de_Puesto_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_de_Puesto_Estatus_Solicitud1`
    FOREIGN KEY (`idEstatus_Solicitud`)
    REFERENCES `Recursos_Humanos`.`Estatus_Solicitud` (`idEstatus_Solicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Area` (
  `idArea` INT NOT NULL AUTO_INCREMENT,
  `Area_Descripcion` VARCHAR(150) NULL,
  `Area_Nombre` VARCHAR(90) NULL,
  `Solicitud_de_Puesto_Id` INT NOT NULL,
  PRIMARY KEY (`idArea`),
  CONSTRAINT `fk_Area_Solicitud_de_Puesto1`
    FOREIGN KEY (`Solicitud_de_Puesto_Id`)
    REFERENCES `Recursos_Humanos`.`Solicitud_de_Puesto` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Solicitud_Candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Solicitud_Candidato` (
  `idSolicitud_Candidato` INT NOT NULL AUTO_INCREMENT,
  `Fecha_de_Solicitud` DATE NULL,
  `Status` VARCHAR(15) NULL,
  `idArea` INT NOT NULL,
  `idPuesto` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idSolicitud_Candidato`),
  CONSTRAINT `fk_Solicitud_Candidato_Area1`
    FOREIGN KEY (`idArea`)
    REFERENCES `Recursos_Humanos`.`Area` (`idArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Candidato_Puesto1`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `Recursos_Humanos`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Candidato_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `Nombre_de_empresa` VARCHAR(150) NULL,
  `Descripcion_del_Puesto` VARCHAR(250) NULL,
  PRIMARY KEY (`idExperiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Habilidad` (
  `idHabilidad` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(100) NULL,
  `Nivel` VARCHAR(200) NULL,
  PRIMARY KEY (`idHabilidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Resultado_Candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Resultado_Candidato` (
  `Estatus_Proceso` VARCHAR(15) NULL,
  `Comentarios` VARCHAR(250) NULL,
  `Comentarios_Ofertas_Salario` VARCHAR(250) NULL,
  `Comentarios_Area_Seleccion` VARCHAR(250) NULL,
  `Examen_Psicometico` VARCHAR(250) NULL,
  `Examen_Psicologico` VARCHAR(250) NULL,
  `Examen_Conocimiento` VARCHAR(250) NULL,
  `Examen_Salud` VARCHAR(250) NULL,
  `Candidato_Curp` VARCHAR(18) NOT NULL,
  `Solicitud_Candidato_idSolicitud_Candidato` INT NOT NULL,
  CONSTRAINT `fk_Resultado_Candidato_Candidato1`
    FOREIGN KEY (`Candidato_Curp`)
    REFERENCES `Recursos_Humanos`.`Candidato` (`Curp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resultado_Candidato_Solicitud_Candidato1`
    FOREIGN KEY (`Solicitud_Candidato_idSolicitud_Candidato`)
    REFERENCES `Recursos_Humanos`.`Solicitud_Candidato` (`idSolicitud_Candidato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Candidato_has_Idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Candidato_has_Idioma` (
  `Curp` VARCHAR(18) NOT NULL,
  `idIdioma` INT NOT NULL,
  CONSTRAINT `fk_Candidato_has_Idioma_Candidato1`
    FOREIGN KEY (`Curp`)
    REFERENCES `Recursos_Humanos`.`Candidato` (`Curp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Candidato_has_Idioma_Idioma1`
    FOREIGN KEY (`idIdioma`)
    REFERENCES `Recursos_Humanos`.`Idioma` (`idIdioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Experiencia_has_Candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Experiencia_has_Candidato` (
  `Curp` VARCHAR(18) NOT NULL,
  `idExperiencia` INT NOT NULL,
  `Nombre_de_empresa` VARCHAR(150) NULL,
  `Años` VARCHAR(45) NULL,
  CONSTRAINT `fk_Experiencia_has_Candidato_Experiencia1`
    FOREIGN KEY (`idExperiencia`)
    REFERENCES `Recursos_Humanos`.`Experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_has_Candidato_Candidato1`
    FOREIGN KEY (`Curp`)
    REFERENCES `Recursos_Humanos`.`Candidato` (`Curp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Candidato_has_Habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Candidato_has_Habilidad` (
  `Curp` VARCHAR(18) NOT NULL,
  `idHabilidad` INT NOT NULL,
  `Nivel` VARCHAR(250) NULL,
  CONSTRAINT `fk_Candidato_has_Habilidad_Candidato1`
    FOREIGN KEY (`Curp`)
    REFERENCES `Recursos_Humanos`.`Candidato` (`Curp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Candidato_has_Habilidad_Habilidad1`
    FOREIGN KEY (`idHabilidad`)
    REFERENCES `Recursos_Humanos`.`Habilidad` (`idHabilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Solicitud_Candidato_has_Puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Solicitud_Candidato_has_Puesto` (
  `Solicitud_Candidato_idSolicitud_Candidato` INT NOT NULL,
  `Puesto_idPuesto` INT NOT NULL,
  CONSTRAINT `fk_Solicitud_Candidato_has_Puesto_Solicitud_Candidato1`
    FOREIGN KEY (`Solicitud_Candidato_idSolicitud_Candidato`)
    REFERENCES `Recursos_Humanos`.`Solicitud_Candidato` (`idSolicitud_Candidato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Candidato_has_Puesto_Puesto1`
    FOREIGN KEY (`Puesto_idPuesto`)
    REFERENCES `Recursos_Humanos`.`Puesto` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Solicitud_Candidato_has_Anuncio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Solicitud_Candidato_has_Anuncio` (
  `idSolicitud_Candidato` INT NOT NULL,
  `idAnuncio` INT NOT NULL,
  CONSTRAINT `fk_Solicitud_Candidato_has_Anuncio_Solicitud_Candidato1`
    FOREIGN KEY (`idSolicitud_Candidato`)
    REFERENCES `Recursos_Humanos`.`Solicitud_Candidato` (`idSolicitud_Candidato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Candidato_has_Anuncio_Anuncio1`
    FOREIGN KEY (`idAnuncio`)
    REFERENCES `Recursos_Humanos`.`Anuncio` (`idAnuncio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Idioma_has_Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Idioma_has_Perfil` (
  `idIdioma` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  CONSTRAINT `fk_Idioma_has_Perfil_Idioma1`
    FOREIGN KEY (`idIdioma`)
    REFERENCES `Recursos_Humanos`.`Idioma` (`idIdioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Idioma_has_Perfil_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Experiencia_has_Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Experiencia_has_Perfil` (
  `idExperiencia` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  `Descripcion` VARCHAR(250) NULL,
  CONSTRAINT `fk_Experiencia_has_Perfil_Experiencia1`
    FOREIGN KEY (`idExperiencia`)
    REFERENCES `Recursos_Humanos`.`Experiencia` (`idExperiencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_has_Perfil_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Habilidad_has_Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Habilidad_has_Perfil` (
  `idHabilidad` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  `Descripcion` VARCHAR(250) NULL,
  CONSTRAINT `fk_Habilidad_has_Perfil_Habilidad1`
    FOREIGN KEY (`idHabilidad`)
    REFERENCES `Recursos_Humanos`.`Habilidad` (`idHabilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habilidad_has_Perfil_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`RegistroUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`RegistroUsuario` (
  `idUsuarioR` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  `Contraseña` VARCHAR(45) NULL,
  `Puesto` VARCHAR(45) NULL,
  `Usuarios_E_idUsuario` INT NOT NULL,
  `Descripcion` VARCHAR(80) NULL,
  PRIMARY KEY (`idUsuarioR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Perfil_has_RegistroUsuario1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Perfil_has_RegistroUsuario1` (
  `idPerfil` INT NOT NULL,
  `idUsuarioR` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Tipo_de_movimiento` VARCHAR(250) NULL,
  CONSTRAINT `fk_Perfil_has_RegistroUsuario1_Perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Recursos_Humanos`.`Perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_has_RegistroUsuario1_RegistroUsuario1`
    FOREIGN KEY (`idUsuarioR`)
    REFERENCES `Recursos_Humanos`.`RegistroUsuario` (`idUsuarioR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recursos_Humanos`.`Nivel_Academico_has_Candidato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recursos_Humanos`.`Nivel_Academico_has_Candidato` (
  `Curp` VARCHAR(18) NOT NULL,
  `idNivel_Academico` INT NOT NULL,
  `idCarrera` INT NOT NULL,
  `Institucion` VARCHAR(20) NULL,
  CONSTRAINT `fk_Nivel_Academico_has_Candidato_Candidato1`
    FOREIGN KEY (`Curp`)
    REFERENCES `Recursos_Humanos`.`Candidato` (`Curp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nivel_Academico_has_Candidato_Nivel_Academico1`
    FOREIGN KEY (`idNivel_Academico`)
    REFERENCES `Recursos_Humanos`.`Nivel_Academico` (`idNivel_Academico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nivel_Academico_has_Candidato_Carrera1`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `Recursos_Humanos`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
