SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- ================================================================
-- 1. CREACIÓN DE TABLAS - ESTRUCTURA COMPLETA
-- ================================================================

-- Tabla: activity_log
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`),
  KEY `causer` (`causer_id`,`causer_type`),
  KEY `subject` (`subject_id`,`subject_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: announcements
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area` enum('frontend','backend') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: roles_app
CREATE TABLE `roles_app` (
  `id_rol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_rol` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: usuario
CREATE TABLE `usuario` (
  `numero_documento` varchar(79) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_doc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contrasena` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`numero_documento`),
  KEY `fk_usuario_rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: users
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: cdp
CREATE TABLE `cdp` (
  `cdp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODIGO_CDP` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Numero_Documento` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_de_Registro` date DEFAULT NULL,
  `Fecha_de_Creacion` datetime DEFAULT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Dependencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Rubro` text COLLATE utf8mb4_unicode_ci,
  `Fuente` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Recurso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Valor_Inicial` decimal(15,2) DEFAULT NULL,
  `Valor_Operaciones` decimal(15,2) DEFAULT NULL,
  `Valor_Actual` decimal(15,2) DEFAULT NULL,
  `Saldo_por_Comprometer` decimal(15,2) DEFAULT NULL,
  `Objeto` text COLLATE utf8mb4_unicode_ci,
  `Compromisos` text COLLATE utf8mb4_unicode_ci,
  `Cuentas_por_Pagar` text COLLATE utf8mb4_unicode_ci,
  `Obligaciones` text COLLATE utf8mb4_unicode_ci,
  `Ordenes_de_Pago` text COLLATE utf8mb4_unicode_ci,
  `Reintegros` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cdp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: crp
CREATE TABLE `crp` (
  `rp_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cdp_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODIGO_CRP` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODIGO_CDP` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Numero_Documento` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_de_Registro` date DEFAULT NULL,
  `Fecha_de_Creacion` datetime DEFAULT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Dependencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Rubro` text COLLATE utf8mb4_unicode_ci,
  `Descripcion` text COLLATE utf8mb4_unicode_ci,
  `Fuente` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Valor_Inicial` decimal(15,2) DEFAULT NULL,
  `Valor_Operaciones` decimal(15,2) DEFAULT NULL,
  `Valor_Actual` decimal(15,2) DEFAULT NULL,
  `Saldo_por_Utilizar` decimal(15,2) DEFAULT NULL,
  `Tipo_Identificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Identificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nombre_Razon_Social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Medio_de_Pago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_Cueta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numero_Cuenta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado_Cuenta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Entidad_Nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Entidad_Descripcion` text COLLATE utf8mb4_unicode_ci,
  `Solicitud_CDP` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CDP` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Compromisos` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cuentas_por_Pagar` text COLLATE utf8mb4_unicode_ci,
  `Obligaciones` text COLLATE utf8mb4_unicode_ci,
  `Ordenes_de_Pago` text COLLATE utf8mb4_unicode_ci,
  `Reintegros` text COLLATE utf8mb4_unicode_ci,
  `Fecha_Documento_Soporte` datetime DEFAULT NULL,
  `Tipo_Documento_Soporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numero_Documento_Soporte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Observaciones` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`rp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: op
CREATE TABLE `op` (
  `op_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rp_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cdp_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODIGO_OP` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODIGO_CRP` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODIGO_CDP` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Numero_Documento` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fecha_de_Registro` date DEFAULT NULL,
  `Fecha_de_Pago` datetime DEFAULT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Valor_Bruto` decimal(15,2) DEFAULT NULL,
  `Valor_Deducciones` decimal(15,2) DEFAULT NULL,
  `Valor_Neto` decimal(15,2) DEFAULT NULL,
  `Tipo_Beneficiario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vigencia_Presupuestal` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_Identificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Identificacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nombre_Razon_Social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Medio_de_Pago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_Cuenta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numero_Cuenta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado_Cuenta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Entidad_Nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Entidad_Descripcion` text COLLATE utf8mb4_unicode_ci,
  `Dependencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Dependencia_Descripcion` text COLLATE utf8mb4_unicode_ci,
  `Rubro` text COLLATE utf8mb4_unicode_ci,
  `Descripcion` text COLLATE utf8mb4_unicode_ci,
  `Fuente` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Recurso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sit` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Valor_Pesos` decimal(15,2) DEFAULT NULL,
  `Valor_Moneda` decimal(15,2) DEFAULT NULL,
  `Valor_Reintegrado_Pesos` decimal(15,2) DEFAULT NULL,
  `Valor_Reintegrado_Moneda` decimal(15,2) DEFAULT NULL,
  `Tesoreria_Pagadora` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Identificacion_Pagaduria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cuenta_Pagaduria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Endosada` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tipo_Identificacion2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Identificacion3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Razon_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Numero_Cuenta4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Concepto_Pago` text COLLATE utf8mb4_unicode_ci,
  `Solicitud_CDP` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CDP` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Compromisos` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cuentas_por_Pagar` text COLLATE utf8mb4_unicode_ci,
  `Fecha_Cuentas_por_Pagar` date DEFAULT NULL,
  `Obligaciones` text COLLATE utf8mb4_unicode_ci,
  `Ordenes_de_Pago` text COLLATE utf8mb4_unicode_ci,
  `Reintegros` text COLLATE utf8mb4_unicode_ci,
  `Fecha_Doc_Soporte_Compromiso` date DEFAULT NULL,
  `Tipo_Doc_Soporte_Compromiso` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Num_Doc_Soporte_Compromiso` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Objeto_del_Compromiso` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: saldos_asignados
CREATE TABLE `saldos_asignados` (
  `ID_SALDO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_PERSONA` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOCUMENTO_PERSONA` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date NOT NULL,
  `FECHA_PAGO` date DEFAULT NULL,
  `SALDO_ASIGNADO` decimal(15,2) NOT NULL,
  `rp_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cdp_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_SALDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: imagenes_saldos_asignados
CREATE TABLE `imagenes_saldos_asignados` (
  `ID_IMAGEN` int NOT NULL AUTO_INCREMENT,
  `ID_SALDO` int NOT NULL,
  `NOMBRE_ORIGINAL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RUTA_IMAGEN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FECHA_SUBIDA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_IMAGEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: registros_actualizaciones
CREATE TABLE `registros_actualizaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_tabla` enum('CDP','CRP','OP') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registros_actualizados` int NOT NULL DEFAULT '0',
  `registros_nuevos` int NOT NULL DEFAULT '0',
  `usuario_id` varchar(79) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: proyectos_tecnoparque
CREATE TABLE `proyectos_tecnoparque` (
  `id_PBT` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Tecnologico','Extensionismo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_linea` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terminados` int DEFAULT NULL,
  `en_proceso` int DEFAULT NULL,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_PBT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: listadosvisitasApre
CREATE TABLE `listadosvisitasApre` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `nodo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Cundinamarca',
  `encargado` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numAsistentes` int NOT NULL,
  `fechaCharla` datetime NOT NULL,
  `fecha_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_visita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: asesoramiento
CREATE TABLE `asesoramiento` (
  `id_asesoramiento` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Asociaciones','Cooperativa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `encargadoAsesoramiento` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreEntidadImpacto` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaAsesoramiento` datetime NOT NULL,
  `fecha_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_asesoramiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla: solicitudes_rol
CREATE TABLE `solicitudes_rol` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `numero_documento` varchar(79) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rol_solicitado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivo` text COLLATE utf8mb4_unicode_ci,
  `fecha_solicitud` datetime DEFAULT NULL,
  `estado` enum('enviada','aceptada','rechazada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enviada',
  `fecha_respuesta` datetime DEFAULT NULL,
  `admin_respuesta` varchar(79) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones_admin` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tablas adicionales de la segunda estructura
CREATE TABLE `competencias` (
  `codigoDiseñoCompetenciaReporte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoCompetenciaReporte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoCompetenciaPDF` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombreCompetencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `normaUnidadCompetencia` text COLLATE utf8mb4_unicode_ci,
  `horasDesarrolloCompetencia` decimal(10,2) DEFAULT NULL,
  `requisitosAcademicosInstructor` text COLLATE utf8mb4_unicode_ci,
  `experienciaLaboralInstructor` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`codigoDiseñoCompetenciaReporte`),
  KEY `idx_codigo_competencia` (`codigoCompetenciaReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `diseños` (
  `codigoDiseño` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoPrograma` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versionPrograma` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrePrograma` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lineaTecnologica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redTecnologica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redConocimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `horasDesarrolloLectiva` decimal(10,2) DEFAULT NULL,
  `horasDesarrolloProductiva` decimal(10,2) DEFAULT NULL,
  `mesesDesarrolloLectiva` decimal(10,2) DEFAULT NULL,
  `mesesDesarrolloProductiva` decimal(10,2) DEFAULT NULL,
  `horasDesarrolloDiseño` decimal(10,2) DEFAULT NULL,
  `mesesDesarrolloDiseño` decimal(10,2) DEFAULT NULL,
  `nivelAcademicoIngreso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gradoNivelAcademico` int DEFAULT NULL,
  `formacionTrabajoDesarrolloHumano` enum('Si','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edadMinima` int DEFAULT NULL,
  `requisitosAdicionales` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`codigoDiseño`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `grf_trj_complementaria_producion` (
  `ficha` int DEFAULT NULL,
  `fecha_reporte` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_documento` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` int DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competencia` text COLLATE utf8mb4_unicode_ci,
  `resultado_aprendizaje` text COLLATE utf8mb4_unicode_ci,
  `juicio_evaluacion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_hora_juicio` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcionario_registro` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `sort` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_parent_id_foreign` (`parent_id`),
  CONSTRAINT `permissions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `raps` (
  `codigoDiseñoCompetenciaReporteRap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigoRapReporte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreRap` text COLLATE utf8mb4_unicode_ci,
  `horasDesarrolloRap` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigoDiseñoCompetenciaReporteRap`),
  KEY `idx_codigo_rap` (`codigoRapReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `two_factor_authentications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint unsigned NOT NULL,
  `shared_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digits` tinyint unsigned NOT NULL DEFAULT '6',
  `seconds` tinyint unsigned NOT NULL DEFAULT '30',
  `window` tinyint unsigned NOT NULL DEFAULT '0',
  `algorithm` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sha1',
  `recovery_codes` longtext COLLATE utf8mb4_bin,
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` longtext COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2fa_auth_type_auth_id_index` (`authenticatable_type`,`authenticatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users_backup_migracion` (
  `id` bigint unsigned DEFAULT '0',
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) DEFAULT '0',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `usuario_backup_migracion` (
  `numero_documento` varchar(79) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_doc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contrasena` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- 2. LLAVES FORÁNEAS
-- ================================================================

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
-- 3. TRIGGERS PARA SINCRONIZACIÓN
-- ================================================================

DELIMITER $$

CREATE TRIGGER `sync_user_delete` AFTER DELETE ON `users` FOR EACH ROW
BEGIN
    DELETE FROM usuario WHERE numero_documento = CAST(OLD.id AS CHAR);
END$$

CREATE TRIGGER `sync_user_insert` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM usuario WHERE numero_documento = CAST(NEW.id AS CHAR)) THEN
        INSERT INTO usuario (
            numero_documento,
            tipo_doc,
            nombre_completo,
            contrasena,
            email,
            telefono,
            id_rol
        ) VALUES (
            CAST(NEW.id AS CHAR),
            'CC',
            COALESCE(NEW.name, 'Sin nombre'),
            NEW.password,
            NEW.email,
            'Sin teléfono',
            '7'
        );
    END IF;
END$$

CREATE TRIGGER `sync_user_update` AFTER UPDATE ON `users` FOR EACH ROW
BEGIN
    IF (OLD.name != NEW.name) OR (OLD.email != NEW.email) OR (OLD.password != NEW.password) THEN
        UPDATE usuario
        SET
            nombre_completo = COALESCE(NEW.name, 'Sin nombre'),
            email = NEW.email,
            contrasena = NEW.password
        WHERE numero_documento = CAST(NEW.id AS CHAR);

        IF ROW_COUNT() = 0 THEN
            INSERT INTO usuario (
                numero_documento,
                tipo_doc,
                nombre_completo,
                contrasena,
                email,
                telefono,
                id_rol
            ) VALUES (
                CAST(NEW.id AS CHAR),
                'CC',
                COALESCE(NEW.name, 'Sin nombre'),
                NEW.password,
                NEW.email,
                'Sin teléfono',
                '7'
            );
        END IF;
    END IF;
END$$

DELIMITER ;

-- ================================================================
-- 4. INSERTS DE DATOS
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