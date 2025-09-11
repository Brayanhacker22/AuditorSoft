<?php

$db = new PDO('sqlite:database/database.sqlite');

// Leer el archivo SQL
$sqlContent = file_get_contents('database/Base_unida_2proyectos.sql');

// Extraer solo las consultas INSERT
$insertQueries = extractInsertQueries($sqlContent);

$successCount = 0;
$errorCount = 0;

foreach ($insertQueries as $query) {
    try {
        $db->exec($query);
        $successCount++;
        echo "✅ INSERT ejecutado correctamente\n";
    } catch (Exception $e) {
        $errorCount++;
        echo "❌ Error en INSERT: " . $e->getMessage() . "\n";
        echo "Consulta: " . substr($query, 0, 100) . "...\n\n";
    }
}

echo "\n=== RESULTADO DE LOS INSERTS ===\n";
echo "INSERTs exitosos: $successCount\n";
echo "INSERTs con error: $errorCount\n";

function extractInsertQueries($sql) {
    $queries = [];

    // Buscar todas las consultas INSERT
    preg_match_all('/INSERT\s+INTO\s+`[^`]+`\s+VALUES\s*\([^;]+\);/i', $sql, $matches);

    foreach ($matches[0] as $insert) {
        // Limpiar la consulta
        $insert = trim($insert);

        // Convertir nombres de tablas si es necesario
        $insert = str_replace('`listadosvisitasApre`', '`listadosvisitas_apre`', $insert);

        $queries[] = $insert;
    }

    return $queries;
}
