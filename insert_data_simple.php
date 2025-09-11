<?php

$db = new PDO('sqlite:database/database.sqlite');

// Leer el archivo SQL línea por línea
$lines = file('database/Base_unida_2proyectos.sql');

$currentInsert = '';
$inInsert = false;
$successCount = 0;
$errorCount = 0;

foreach ($lines as $line) {
    $line = trim($line);

    // Si encontramos el inicio de un INSERT
    if (stripos($line, 'INSERT INTO') === 0) {
        $inInsert = true;
        $currentInsert = $line;
    }
    // Si estamos dentro de un INSERT, agregar la línea
    elseif ($inInsert) {
        $currentInsert .= ' ' . $line;

        // Si la línea termina con punto y coma, ejecutar la consulta
        if (substr($line, -1) === ';') {
            try {
                // Limpiar la consulta
                $query = trim($currentInsert);

                // Convertir nombres de tablas si es necesario
                $query = str_replace('`listadosvisitasApre`', '`listadosvisitas_apre`', $query);

                $db->exec($query);
                $successCount++;
                echo "✅ INSERT ejecutado correctamente\n";
            } catch (Exception $e) {
                $errorCount++;
                echo "❌ Error en INSERT: " . $e->getMessage() . "\n";
                echo "Consulta: " . substr($query, 0, 100) . "...\n\n";
            }

            $inInsert = false;
            $currentInsert = '';
        }
    }
}

echo "\n=== RESULTADO DE LOS INSERTS ===\n";
echo "INSERTs exitosos: $successCount\n";
echo "INSERTs con error: $errorCount\n";
