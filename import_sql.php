<?php

$db = new PDO('sqlite:database/database.sqlite');

// Leer el archivo SQL
$sqlContent = file_get_contents('database/Base_unida_2proyectos.sql');

// Convertir sintaxis MySQL a SQLite
$sqlContent = convertMySQLToSQLite($sqlContent);

// Dividir en consultas individuales
$queries = array_filter(array_map('trim', explode(';', $sqlContent)));

$successCount = 0;
$errorCount = 0;

foreach ($queries as $query) {
    if (empty($query)) continue;

    try {
        $db->exec($query);
        $successCount++;
        echo "✅ Consulta ejecutada correctamente\n";
    } catch (Exception $e) {
        $errorCount++;
        echo "❌ Error en consulta: " . $e->getMessage() . "\n";
        echo "Consulta: " . substr($query, 0, 100) . "...\n\n";
    }
}

echo "\n=== RESULTADO DE LA IMPORTACIÓN ===\n";
echo "Consultas exitosas: $successCount\n";
echo "Consultas con error: $errorCount\n";

function convertMySQLToSQLite($sql) {
    // Remover configuraciones iniciales
    $sql = preg_replace('/SET\s+SQL_MODE\s*=\s*[^;]+;/i', '', $sql);
    $sql = preg_replace('/START\s+TRANSACTION;/i', '', $sql);
    $sql = preg_replace('/SET\s+time_zone\s*=\s*[^;]+;/i', '', $sql);
    $sql = preg_replace('/COMMIT;/i', '', $sql);

    // Remover ENGINE y CHARSET
    $sql = preg_replace('/ENGINE\s*=\s*\w+/i', '', $sql);
    $sql = preg_replace('/DEFAULT\s+CHARSET\s*=\s*\w+/i', '', $sql);
    $sql = preg_replace('/COLLATE\s+[\w_]+/i', '', $sql);

    // Convertir AUTO_INCREMENT a AUTOINCREMENT
    $sql = preg_replace('/AUTO_INCREMENT/i', 'AUTOINCREMENT', $sql);

    // Remover índices KEY (SQLite los crea automáticamente para PRIMARY KEY)
    $sql = preg_replace('/,\s*KEY\s+`[^`]+`\s*\([^)]+\)/i', '', $sql);
    $sql = preg_replace('/,\s*UNIQUE\s+KEY\s+`[^`]+`\s*\([^)]+\)/i', '', $sql);

    // Remover CONSTRAINT y FOREIGN KEY (SQLite no soporta ALTER TABLE para FK)
    $sql = preg_replace('/ALTER\s+TABLE\s+`[^`]+`\s+ADD\s+CONSTRAINT\s+[^;]+;/i', '', $sql);

    // Convertir ENUM a TEXT con CHECK
    $sql = preg_replace_callback(
        '/enum\(([^)]+)\)/i',
        function($matches) {
            $values = str_replace("'", "", $matches[1]);
            $valuesArray = explode(',', $values);
            $checkValues = implode("','", array_map('trim', $valuesArray));
            return "TEXT CHECK (value IN ('$checkValues'))";
        },
        $sql
    );

    // Remover DELIMITER y convertir triggers
    $sql = preg_replace('/DELIMITER\s+\$\$/i', '', $sql);
    $sql = preg_replace('/\$\$/i', '', $sql);

    // Convertir triggers MySQL a SQLite
    $sql = preg_replace_callback(
        '/CREATE\s+TRIGGER\s+`([^`]+)`\s+AFTER\s+(\w+)\s+ON\s+`([^`]+)`\s+FOR\s+EACH\s+ROW\s+BEGIN\s+([^}]+)\s+END/i',
        function($matches) {
            $triggerName = $matches[1];
            $event = $matches[2];
            $table = $matches[3];
            $body = $matches[4];

            // Convertir sintaxis MySQL a SQLite
            $body = str_replace('OLD.', 'OLD.', $body);
            $body = str_replace('NEW.', 'NEW.', $body);
            $body = preg_replace('/CAST\(([^)]+)\s+AS\s+CHAR\)/i', 'CAST($1 AS TEXT)', $body);
            $body = preg_replace('/ROW_COUNT\(\)/i', 'changes()', $body);
            $body = preg_replace('/COALESCE\(([^,]+),\s*\'([^\']+)\'\)/i', 'COALESCE($1, \'$2\')', $body);

            return "CREATE TRIGGER `$triggerName` AFTER $event ON `$table` BEGIN $body END";
        },
        $sql
    );

    // Limpiar espacios extra y líneas vacías
    $sql = preg_replace('/\s+/', ' ', $sql);
    $sql = preg_replace('/;\s*;/', ';', $sql);

    return $sql;
}
