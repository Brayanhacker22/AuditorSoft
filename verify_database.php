<?php

$db = new PDO('sqlite:database/database.sqlite');

echo "=== VERIFICACIÓN DE BASE DE DATOS ===\n\n";

// Verificar tablas existentes
$tables = $db->query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;")->fetchAll(PDO::FETCH_COLUMN);

echo "Tablas encontradas en la base de datos:\n";
foreach ($tables as $table) {
    echo "- $table\n";
}
echo "\n";

// Verificar estructura de tablas clave
$expectedTables = [
    'activity_log',
    'announcements',
    'roles_app',
    'usuario',
    'users',
    'cdp',
    'crp',
    'op',
    'saldos_asignados',
    'imagenes_saldos_asignados',
    'registros_actualizaciones',
    'proyectos_tecnoparque',
    'listadosvisitasApre',
    'asesoramiento',
    'solicitudes_rol',
    'competencias',
    'diseños',
    'failed_jobs',
    'grf_trj_complementaria_producion',
    'migrations',
    'password_histories',
    'password_resets',
    'permissions',
    'model_has_permissions',
    'personal_access_tokens',
    'raps',
    'roles',
    'model_has_roles',
    'role_has_permissions',
    'two_factor_authentications'
];

$missingTables = array_diff($expectedTables, $tables);
$extraTables = array_diff($tables, $expectedTables);

if (empty($missingTables)) {
    echo "✅ Todas las tablas esperadas están presentes.\n";
} else {
    echo "❌ Tablas faltantes: " . implode(', ', $missingTables) . "\n";
}

if (!empty($extraTables)) {
    echo "ℹ️  Tablas adicionales encontradas: " . implode(', ', $extraTables) . "\n";
}

echo "\n=== VERIFICACIÓN DE DATOS ===\n\n";

// Verificar datos en roles_app
$rolesCount = $db->query("SELECT COUNT(*) FROM roles_app")->fetchColumn();
echo "Registros en roles_app: $rolesCount (esperado: 8)\n";

// Verificar datos en usuario
$usuariosCount = $db->query("SELECT COUNT(*) FROM usuario")->fetchColumn();
echo "Registros en usuario: $usuariosCount (esperado: 10)\n";

// Verificar datos en proyectos_tecnoparque
$proyectosCount = $db->query("SELECT COUNT(*) FROM proyectos_tecnoparque")->fetchColumn();
echo "Registros en proyectos_tecnoparque: $proyectosCount (esperado: 5)\n";

// Verificar datos en listadosvisitasApre
$visitasCount = $db->query("SELECT COUNT(*) FROM listadosvisitasApre")->fetchColumn();
echo "Registros en listadosvisitasApre: $visitasCount (esperado: 3)\n";

// Verificar datos en asesoramiento
$asesoramientoCount = $db->query("SELECT COUNT(*) FROM asesoramiento")->fetchColumn();
echo "Registros en asesoramiento: $asesoramientoCount (esperado: 3)\n";

echo "\n=== VERIFICACIÓN DE MIGRACIONES ===\n\n";

// Verificar estado de migraciones
$migrationsCount = $db->query("SELECT COUNT(*) FROM migrations")->fetchColumn();
echo "Total de migraciones registradas: $migrationsCount\n";

$migrations = $db->query("SELECT migration, batch FROM migrations ORDER BY batch, migration")->fetchAll(PDO::FETCH_ASSOC);
foreach ($migrations as $migration) {
    echo "Batch {$migration['batch']}: {$migration['migration']}\n";
}

echo "\n=== VERIFICACIÓN COMPLETA ===\n";
