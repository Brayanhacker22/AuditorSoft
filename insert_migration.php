<?php

$db = new PDO('sqlite:database/database.sqlite');

$migrations = [
    '2023_01_01_000001_create_activity_log_table',
    '2023_01_01_000001_create_roles_app_table',
    '2023_01_01_000002_create_announcements_table',
    '2023_01_01_000002_create_usuario_table',
    '2023_01_01_000003_create_cdp_table',
    '2023_01_01_000003_create_users_table',
    '2023_01_01_000004_create_competencias_table',
    '2023_01_01_000004_create_crp_table',
    '2023_01_01_000005_create_disenos_table',
    '2023_01_01_000005_create_op_table',
    '2023_01_01_000006_create_failed_jobs_table',
    '2023_01_01_000006_create_saldos_asignados_table',
    '2023_01_01_000007_create_grf_trj_complementaria_producion_table',
    '2023_01_01_000007_create_imagenes_saldos_asignados_table',
    '2023_01_01_000008_create_password_histories_table',
    '2023_01_01_000008_create_registros_actualizaciones_table',
    '2023_01_01_000009_create_password_resets_table',
    '2023_01_01_000009_create_proyectos_tecnoparque_table',
    '2023_01_01_000010_create_listadosvisitasApre_table',
    '2023_01_01_000010_create_permissions_tables',
    '2023_01_01_000011_create_asesoramiento_table',
    '2023_01_01_000011_create_personal_access_tokens_table',
    '2023_01_01_000012_create_raps_table',
    '2023_01_01_000012_create_solicitudes_rol_table',
    '2023_01_01_000013_create_roles_and_relationships_tables',
    '2023_01_01_000014_create_two_factor_authentications_table'
];

foreach ($migrations as $migration) {
    $db->exec("INSERT OR IGNORE INTO migrations (migration, batch) VALUES ('$migration', 6);");
}

echo "All pending migrations marked as run\n";
