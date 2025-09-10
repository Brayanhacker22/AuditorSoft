SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- ================================================================
-- 1. CREACIÓN DE TABLAS - ESTRUCTURA SIN LLAVES
-- ================================================================

-- Tabla: roles_app
CREATE TABLE `roles_app` (
  `id_rol` varchar(10) NOT NULL,
  `nombre_rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: usuario
CREATE TABLE `usuario` (
  `numero_documento` varchar(79) NOT NULL,
  `tipo_doc` varchar(100) NOT NULL,
  `nombre_completo` varchar(300) DEFAULT NULL,
  `contrasena` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `id_rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: cdp
CREATE TABLE `cdp` (
  `cdp_id` varchar(255) NOT NULL,
  `CODIGO_CDP` varchar(55) NOT NULL,
  `Numero_Documento` varchar(55) DEFAULT NULL,
  `Fecha_de_Registro` date DEFAULT NULL,
  `Fecha_de_Creacion` datetime DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Dependencia` varchar(255) DEFAULT NULL,
  `Rubro` text DEFAULT NULL,
  `Fuente` varchar(100) DEFAULT NULL,
  `Recurso` varchar(255) DEFAULT NULL,
  `Valor_Inicial` decimal(15,2) DEFAULT NULL,
  `Valor_Operaciones` decimal(15,2) DEFAULT NULL,
  `Valor_Actual` decimal(15,2) DEFAULT NULL,
  `Saldo_por_Comprometer` decimal(15,2) DEFAULT NULL,
  `Objeto` text DEFAULT NULL,
  `Compromisos` text DEFAULT NULL,
  `Cuentas_por_Pagar` text DEFAULT NULL,
  `Obligaciones` text DEFAULT NULL,
  `Ordenes_de_Pago` text DEFAULT NULL,
  `Reintegros` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: crp
CREATE TABLE `crp` (
  `rp_id` varchar(55) NOT NULL,
  `cdp_id` varchar(55) NOT NULL,
  `CODIGO_CRP` varchar(55) NOT NULL,
  `CODIGO_CDP` varchar(55) NOT NULL,
  `Numero_Documento` varchar(55) DEFAULT NULL,
  `Fecha_de_Registro` date DEFAULT NULL,
  `Fecha_de_Creacion` datetime DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Dependencia` varchar(255) DEFAULT NULL,
  `Rubro` text DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Fuente` varchar(100) DEFAULT NULL,
  `Valor_Inicial` decimal(15,2) DEFAULT NULL,
  `Valor_Operaciones` decimal(15,2) DEFAULT NULL,
  `Valor_Actual` decimal(15,2) DEFAULT NULL,
  `Saldo_por_Utilizar` decimal(15,2) DEFAULT NULL,
  `Tipo_Identificacion` varchar(255) DEFAULT NULL,
  `Identificacion` varchar(255) DEFAULT NULL,
  `Nombre_Razon_Social` varchar(255) DEFAULT NULL,
  `Medio_de_Pago` varchar(255) DEFAULT NULL,
  `Tipo_Cuenta` varchar(255) DEFAULT NULL,
  `Numero_Cuenta` varchar(255) DEFAULT NULL,
  `Estado_Cuenta` varchar(255) DEFAULT NULL,
  `Entidad_Nit` varchar(255) DEFAULT NULL,
  `Entidad_Descripcion` text DEFAULT NULL,
  `Solicitud_CDP` varchar(55) DEFAULT NULL,
  `CDP` varchar(55) DEFAULT NULL,
  `Compromisos` varchar(55) DEFAULT NULL,
  `Cuentas_por_Pagar` text DEFAULT NULL,
  `Obligaciones` text DEFAULT NULL,
  `Ordenes_de_Pago` text DEFAULT NULL,
  `Reintegros` text DEFAULT NULL,
  `Fecha_Documento_Soporte` datetime DEFAULT NULL,
  `Tipo_Documento_Soporte` varchar(255) DEFAULT NULL,
  `Numero_Documento_Soporte` varchar(255) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: op
CREATE TABLE `op` (
  `op_id` varchar(55) NOT NULL,
  `rp_id` varchar(55) NOT NULL,
  `cdp_id` varchar(55) NOT NULL,
  `CODIGO_OP` varchar(55) NOT NULL,
  `CODIGO_CRP` varchar(55) NOT NULL,
  `CODIGO_CDP` varchar(55) NOT NULL,
  `Numero_Documento` varchar(55) DEFAULT NULL,
  `Fecha_de_Registro` date DEFAULT NULL,
  `Fecha_de_Pago` datetime DEFAULT NULL,
  `Estado` varchar(255) DEFAULT NULL,
  `Valor_Bruto` decimal(15,2) DEFAULT NULL,
  `Valor_Deducciones` decimal(15,2) DEFAULT NULL,
  `Valor_Neto` decimal(15,2) DEFAULT NULL,
  `Tipo_Beneficiario` varchar(255) DEFAULT NULL,
  `Vigencia_Presupuestal` varchar(155) DEFAULT NULL,
  `Tipo_Identificacion` varchar(255) DEFAULT NULL,
  `Identificacion` varchar(255) DEFAULT NULL,
  `Nombre_Razon_Social` varchar(255) DEFAULT NULL,
  `Medio_de_Pago` varchar(255) DEFAULT NULL,
  `Tipo_Cuenta` varchar(255) DEFAULT NULL,
  `Numero_Cuenta` varchar(255) DEFAULT NULL,
  `Estado_Cuenta` varchar(255) DEFAULT NULL,
  `Entidad_Nit` varchar(255) DEFAULT NULL,
  `Entidad_Descripcion` text DEFAULT NULL,
  `Dependencia` varchar(255) DEFAULT NULL,
  `Dependencia_Descripcion` text DEFAULT NULL,
  `Rubro` text DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Fuente` varchar(100) DEFAULT NULL,
  `Recurso` varchar(255) DEFAULT NULL,
  `Sit` varchar(155) DEFAULT NULL,
  `Valor_Pesos` decimal(15,2) DEFAULT NULL,
  `Valor_Moneda` decimal(15,2) DEFAULT NULL,
  `Valor_Reintegrado_Pesos` decimal(15,2) DEFAULT NULL,
  `Valor_Reintegrado_Moneda` decimal(15,2) DEFAULT NULL,
  `Tesoreria_Pagadora` varchar(100) DEFAULT NULL,
  `Identificacion_Pagaduria` varchar(255) DEFAULT NULL,
  `Cuenta_Pagaduria` varchar(255) DEFAULT NULL,
  `Endosada` varchar(55) DEFAULT NULL,
  `Tipo_Identificacion2` varchar(255) DEFAULT NULL,
  `Identificacion3` varchar(255) DEFAULT NULL,
  `Razon_social` varchar(255) DEFAULT NULL,
  `Numero_Cuenta4` varchar(255) DEFAULT NULL,
  `Concepto_Pago` text DEFAULT NULL,
  `Solicitud_CDP` varchar(55) DEFAULT NULL,
  `CDP` varchar(55) DEFAULT NULL,
  `Compromisos` varchar(55) DEFAULT NULL,
  `Cuentas_por_Pagar` text DEFAULT NULL,
  `Fecha_Cuentas_por_Pagar` date DEFAULT NULL,
  `Obligaciones` text DEFAULT NULL,
  `Ordenes_de_Pago` text DEFAULT NULL,
  `Reintegros` text DEFAULT NULL,
  `Fecha_Doc_Soporte_Compromiso` date DEFAULT NULL,
  `Tipo_Doc_Soporte_Compromiso` varchar(100) DEFAULT NULL,
  `Num_Doc_Soporte_Compromiso` varchar(100) DEFAULT NULL,
  `Objeto_del_Compromiso` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: saldos_asignados
CREATE TABLE `saldos_asignados` (
  `ID_SALDO` int NOT NULL,
  `NOMBRE_PERSONA` varchar(255) NOT NULL,
  `DOCUMENTO_PERSONA` varchar(55) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date NOT NULL,
  `FECHA_PAGO` date DEFAULT NULL,
  `SALDO_ASIGNADO` decimal(15,2) NOT NULL,
  `rp_id` varchar(55) NOT NULL,
  `cdp_id` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: imagenes_saldos_asignados
CREATE TABLE `imagenes_saldos_asignados` (
  `ID_IMAGEN` int NOT NULL,
  `ID_SALDO` int NOT NULL,
  `NOMBRE_ORIGINAL` varchar(255) NOT NULL,
  `RUTA_IMAGEN` varchar(255) NOT NULL,
  `FECHA_SUBIDA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: registros_actualizaciones
CREATE TABLE `registros_actualizaciones` (
  `id` int NOT NULL,
  `tipo_tabla` enum('CDP','CRP','OP') NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registros_actualizados` int NOT NULL DEFAULT '0',
  `registros_nuevos` int NOT NULL DEFAULT '0',
  `usuario_id` varchar(79) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: proyectos_tecnoparque
CREATE TABLE `proyectos_tecnoparque` (
  `id_PBT` int NOT NULL,
  `tipo` enum('Tecnologico','Extensionismo') NOT NULL,
  `nombre_linea` varchar(55) NOT NULL,
  `terminados` int DEFAULT NULL,
  `en_proceso` int DEFAULT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: listadosvisitasApre
CREATE TABLE `listadosvisitasApre` (
  `id_visita` int NOT NULL,
  `nodo` varchar(100) DEFAULT 'Cundinamarca',
  `encargado` varchar(155) NOT NULL,
  `numAsistentes` int NOT NULL,
  `fechaCharla` datetime NOT NULL,
  `fecha_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: asesoramiento
CREATE TABLE `asesoramiento` (
  `id_asesoramiento` int NOT NULL,
  `tipo` enum('Asociaciones','Cooperativa') NOT NULL,
  `encargadoAsesoramiento` varchar(155) NOT NULL,
  `nombreEntidadImpacto` varchar(155) NOT NULL,
  `fechaAsesoramiento` datetime NOT NULL,
  `fecha_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: solicitudes_rol
CREATE TABLE `solicitudes_rol` (
  `id_solicitud` int NOT NULL,
  `numero_documento` varchar(79) NOT NULL,
  `email` varchar(200) NOT NULL,
  `id_rol_solicitado` varchar(10) NOT NULL,
  `motivo` text,
  `fecha_solicitud` datetime DEFAULT NULL,
  `estado` enum('enviada','aceptada','rechazada') NOT NULL DEFAULT 'enviada',
  `fecha_respuesta` datetime DEFAULT NULL,
  `admin_respuesta` varchar(79) DEFAULT NULL,
  `observaciones_admin` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- 2. LLAVES PRIMARIAS Y FORÁNEAS
-- ================================================================

-- Llaves Primarias
ALTER TABLE `roles_app` ADD PRIMARY KEY (`id_rol`);
ALTER TABLE `usuario` ADD PRIMARY KEY (`numero_documento`);
ALTER TABLE `cdp` ADD PRIMARY KEY (`cdp_id`);
ALTER TABLE `crp` ADD PRIMARY KEY (`rp_id`);
ALTER TABLE `op` ADD PRIMARY KEY (`op_id`);
ALTER TABLE `saldos_asignados` ADD PRIMARY KEY (`ID_SALDO`);
ALTER TABLE `imagenes_saldos_asignados` ADD PRIMARY KEY (`ID_IMAGEN`);
ALTER TABLE `registros_actualizaciones` ADD PRIMARY KEY (`id`);
ALTER TABLE `proyectos_tecnoparque` ADD PRIMARY KEY (`id_PBT`);
ALTER TABLE `listadosvisitasApre` ADD PRIMARY KEY (`id_visita`);
ALTER TABLE `asesoramiento` ADD PRIMARY KEY (`id_asesoramiento`);
ALTER TABLE `solicitudes_rol` ADD PRIMARY KEY (`id_solicitud`);

-- Configuración de AUTO_INCREMENT para las tablas que lo necesitan
ALTER TABLE `saldos_asignados` MODIFY `ID_SALDO` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `imagenes_saldos_asignados` MODIFY `ID_IMAGEN` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `registros_actualizaciones` MODIFY `id` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `proyectos_tecnoparque` MODIFY `id_PBT` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `listadosvisitasApre` MODIFY `id_visita` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `asesoramiento` MODIFY `id_asesoramiento` int NOT NULL AUTO_INCREMENT;
ALTER TABLE `solicitudes_rol` MODIFY `id_solicitud` int NOT NULL AUTO_INCREMENT;

-- Llaves Foráneas
ALTER TABLE `usuario` 
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles_app` (`id_rol`);

ALTER TABLE `saldos_asignados` 
  ADD CONSTRAINT `fk_saldos_crp` FOREIGN KEY (`rp_id`) REFERENCES `crp` (`rp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_saldos_cdp` FOREIGN KEY (`cdp_id`) REFERENCES `cdp` (`cdp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `imagenes_saldos_asignados` 
  ADD CONSTRAINT `fk_imagen_saldo` FOREIGN KEY (`ID_SALDO`) REFERENCES `saldos_asignados` (`ID_SALDO`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `registros_actualizaciones` 
  ADD CONSTRAINT `fk_registros_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`numero_documento`);

ALTER TABLE `solicitudes_rol` 
  ADD CONSTRAINT `fk_solicitud_usuario` FOREIGN KEY (`numero_documento`) REFERENCES `usuario` (`numero_documento`),
  ADD CONSTRAINT `fk_solicitud_rol` FOREIGN KEY (`id_rol_solicitado`) REFERENCES `roles_app` (`id_rol`),
  ADD CONSTRAINT `fk_solicitud_admin` FOREIGN KEY (`admin_respuesta`) REFERENCES `usuario` (`numero_documento`);

-- ================================================================
-- 3. INSERTS DE DATOS
-- ================================================================

-- Datos para la tabla roles_app
INSERT INTO `roles_app` (`id_rol`, `nombre_rol`) VALUES
('1', 'Admin'),
('2', 'Gestor'),
('3', 'Presupuesto'),
('4', 'SENNOVA'),
('5', 'Tecnoparque'),
('6', 'Tecnoacademia'),
('7', 'Acceso'),
('otro', 'Otro');

-- Datos para la tabla usuario
INSERT INTO `usuario` (`numero_documento`, `tipo_doc`, `nombre_completo`, `contrasena`, `email`, `telefono`, `id_rol`) VALUES
('1010244141', 'Cedula de ciudadania', 'Laura Lopez Rodriguez', '$2y$10$pDbPQMkUEjzzkfTd4yPi5O812xUQyLyhZuXyH040eijTQ98oS2jte', 'laulopezr@sena.edu.co', '3164101647', '3'),
('1030685664', 'Cedula de ciudadania', 'Natalia Gonzalez', '$2y$10$x8lvR7ryAQenFGTR6ICBneg7N.ybOMK0Qol6la4ikDSMQ/VycbpJa', 'nrgonzalez@sena.edu.co', '3005675202', '5'),
('1073672380', 'Cedula de ciudadania', 'Melqui Alexander Romero', '$2y$10$u2iloUCRe9Bahko.YETDz.vHr/kOfdRWEZ6iIO5t/4923X8/r0fH6', 'melquiveru@gmail.com', '3026074008', '1'),
('1111', 'Cedula de ciudadania', 'SENNOVA ADMINISTRADOR', '$2y$10$jNoWJl67VSkVt.avkTJtKu.LRB1A3xiZcgjcv4g8JZlxcAu.YRbBa', 'SENNOVA@ADMINISTRADOR.COM', '3000', '4'),
('2222', 'Cedula de ciudadania', 'Tecnoparque ADMINISTRADOR', '$2y$10$zOlah79nlXDP95M7jFzv7.3nJh0qH9gfm86frtCzEakHV1edvRDZS', 'Tecnoparque@ADMINISTRADOR.com', '2222', '5'),
('3333', 'Cedula de ciudadania', 'Tecnoacademia ADMINISTRADOR', '$2y$10$ONIqKEj/3gj7bSYQmVIlR.LdRIW0XBgzK.dna8QB4taR.4IMX.qry', 'Tecnoacademia@ADMINISTRADOR.com', '3333', '6'),
('52366315', 'Cedula de ciudadania', 'Carolina Cardenas Herrera', '$2y$10$TvAj3BiRQ6t62K7EKUZJ0OrfMY7Jb8br5EXCzmAgjLyxx2rXTwA0m', 'ccardenash@sena.edu.co', '3168975203', '4'),
('80062448', 'Cedula de ciudadania', 'Fabian Medina', '$2y$10$0kJAeSsQH9h2FQ23A1ge1uduPyQA2ss7PsbeL10.8tRVWWJ2IGIi2', 'medinab@sena.edu.co', '123445', '3'),
('80075242', 'Cedula de ciudadania', 'Jonathan Cortazar-Camelo', '$2y$10$XLyuJwgJ9W1KZBCJQdgJa.R.U/CtmKZgmkddslVb1J9igmaVM4gxi', 'jcortazar@sena.edu.co', '6015461500', '5'),
('80153856', 'Cedula de ciudadania', 'Juan Carlos Arias Chavarro', '$2y$10$fNkr/T7MA2JW3x/bfF5z3./HdyBU0HRjV.xa8w/opNVsWlk35Q3aq', 'jariasc@sena.edu.co', '3045766105', '6');

-- Datos para la tabla proyectos_tecnoparque
INSERT INTO `proyectos_tecnoparque` (`tipo`, `nombre_linea`, `terminados`, `en_proceso`) VALUES
('Tecnologico', 'Diseno', 4, 21),
('Tecnologico', 'Produccion', 3, 14),
('Tecnologico', 'TI', 5, 4),
('Tecnologico', 'UCL', 0, 0),
('Extensionismo', 'Extensionismo', 0, 0);

-- Datos para la tabla listadosvisitasApre
INSERT INTO `listadosvisitasApre` (`encargado`, `numAsistentes`, `fechaCharla`) VALUES
('Juan Perez', 25, '2024-05-15 10:00:00'),
('Maria Rodriguez', 30, '2024-05-16 14:30:00'),
('Carlos Gomez', 15, '2024-05-17 09:00:00');

-- Datos para la tabla asesoramiento
INSERT INTO `asesoramiento` (`tipo`, `encargadoAsesoramiento`, `nombreEntidadImpacto`, `fechaAsesoramiento`) VALUES
('Asociaciones', 'Melqui Romero', 'HolTecth', '2024-05-15 10:00:00'),
('Asociaciones', 'Angely Patino', 'Markect Medios', '2024-05-15 10:00:00'),
('Cooperativa', 'Alan Patino', 'Julio Cesar Turbay Ayala', '2024-05-15 10:00:00');

COMMIT;