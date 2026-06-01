<?php
/**
 * SuperCRUD: CRUD genérico que funciona con cualquier tabla MySQL
 * Desarrollado paso a paso
 */

$host   = 'localhost';
$dbname = 'proyecto_crud';
$user   = 'root';
$pass   = '';

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass,
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
     PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]);

// Obtener todas las tablas de la BD
$tablas = $pdo->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
$tabla  = $_GET['tabla'] ?? ($tablas[0] ?? '');

function columnas(PDO $pdo, string $tabla): array {
    return $pdo->query("DESCRIBE `$tabla`")->fetchAll();
}

function pk(PDO $pdo, string $tabla): string {
    foreach (columnas($pdo, $tabla) as $col) {
        if ($col['Key'] === 'PRI') return $col['Field'];
    }
    return 'id';
}
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>SuperCRUD</title></head>
<body>
<h1>SuperCRUD – Tabla: <?= htmlspecialchars($tabla) ?></h1>
<p>
    Tablas disponibles:
    <?php foreach ($tablas as $t): ?>
        <a href="?tabla=<?= urlencode($t) ?>"><?= htmlspecialchars($t) ?></a> |
    <?php endforeach; ?>
</p>

<?php if ($tabla): ?>
<?php
    $pk_campo = pk($pdo, $tabla);
    $cols = columnas($pdo, $tabla);
    $filas = $pdo->query("SELECT * FROM `$tabla` LIMIT 100")->fetchAll();
?>
<table border="1" cellpadding="4">
<tr>
    <?php foreach ($cols as $c): ?><th><?= htmlspecialchars($c['Field']) ?></th><?php endforeach; ?>
    <th>Acciones</th>
</tr>
<?php foreach ($filas as $fila): ?>
<tr>
    <?php foreach ($fila as $valor): ?>
        <td><?= htmlspecialchars((string)$valor) ?></td>
    <?php endforeach; ?>
    <td>
        <a href="?tabla=<?= urlencode($tabla) ?>&borrar=<?= urlencode($fila[$pk_campo]) ?>"
           onclick="return confirm('¿Eliminar?')">Borrar</a>
    </td>
</tr>
<?php endforeach; ?>
</table>
<?php endif; ?>
</body>
</html>
