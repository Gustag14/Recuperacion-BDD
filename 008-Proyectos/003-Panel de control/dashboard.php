<?php
// Panel de control con estadísticas

session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

$pdo = new PDO('mysql:host=localhost;dbname=proyecto_crud;charset=utf8', 'root', '',
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

$stats = $pdo->query("
    SELECT
        COUNT(*)          AS total_productos,
        SUM(stock)        AS total_stock,
        AVG(precio)       AS precio_medio,
        MAX(precio)       AS precio_maximo,
        MIN(precio)       AS precio_minimo
    FROM productos
")->fetch(PDO::FETCH_ASSOC);

$top5 = $pdo->query("SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 5")->fetchAll();
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Panel de control</title>
<style>
  body { font-family: sans-serif; margin: 2rem; }
  .cards { display: flex; gap: 1rem; flex-wrap: wrap; }
  .card { background: #f0f4ff; border-radius: 8px; padding: 1rem 2rem; min-width: 150px; }
  .card h3 { margin: 0; font-size: 2rem; color: #2255cc; }
  .card p  { margin: 0.3rem 0 0; color: #555; }
</style>
</head>
<body>
<h1>Panel de control – <?= htmlspecialchars($_SESSION['user_name']) ?></h1>
<div class="cards">
    <div class="card"><h3><?= $stats['total_productos'] ?></h3><p>Productos</p></div>
    <div class="card"><h3><?= $stats['total_stock'] ?></h3><p>Unidades en stock</p></div>
    <div class="card"><h3><?= number_format($stats['precio_medio'],2) ?>€</h3><p>Precio medio</p></div>
    <div class="card"><h3><?= number_format($stats['precio_maximo'],2) ?>€</h3><p>Precio máximo</p></div>
</div>

<h2>Top 5 productos más caros</h2>
<ol>
<?php foreach ($top5 as $row): ?>
    <li><?= htmlspecialchars($row['nombre']) ?> — <?= number_format($row['precio'],2) ?> €</li>
<?php endforeach; ?>
</ol>

<p><a href="crud.php">Ir al CRUD</a> | <a href="logout.php">Cerrar sesión</a></p>
</body>
</html>
