<?php
// Proyecto: CRUD completo de productos

$host   = 'localhost';
$dbname = 'proyecto_crud';
$user   = 'root';
$pass   = '';

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass,
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

$accion = $_GET['accion'] ?? 'listar';

// --- CREAR ---
if ($accion === 'crear' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO productos (nombre, precio, stock) VALUES (?,?,?)");
    $stmt->execute([$_POST['nombre'], $_POST['precio'], $_POST['stock']]);
    header('Location: crud.php');
    exit;
}

// --- ACTUALIZAR ---
if ($accion === 'actualizar' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE productos SET nombre=?, precio=?, stock=? WHERE id=?");
    $stmt->execute([$_POST['nombre'], $_POST['precio'], $_POST['stock'], $_POST['id']]);
    header('Location: crud.php');
    exit;
}

// --- BORRAR ---
if ($accion === 'borrar' && isset($_GET['id'])) {
    $stmt = $pdo->prepare("DELETE FROM productos WHERE id = ?");
    $stmt->execute([$_GET['id']]);
    header('Location: crud.php');
    exit;
}

// --- LISTAR ---
$productos = $pdo->query("SELECT * FROM productos ORDER BY id")->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>CRUD Productos</title></head>
<body>
<h1>Gestión de productos</h1>

<h2>Añadir producto</h2>
<form method="post" action="crud.php?accion=crear">
    Nombre: <input name="nombre" required>
    Precio: <input name="precio" type="number" step="0.01" min="0" required>
    Stock: <input name="stock" type="number" min="0" required>
    <button type="submit">Guardar</button>
</form>

<h2>Listado</h2>
<table border="1" cellpadding="6">
<tr><th>ID</th><th>Nombre</th><th>Precio</th><th>Stock</th><th>Acciones</th></tr>
<?php foreach ($productos as $p): ?>
<tr>
    <td><?= $p['id'] ?></td>
    <td><?= htmlspecialchars($p['nombre']) ?></td>
    <td><?= number_format($p['precio'], 2) ?> €</td>
    <td><?= $p['stock'] ?></td>
    <td>
        <a href="crud.php?accion=editar&id=<?= $p['id'] ?>">Editar</a> |
        <a href="crud.php?accion=borrar&id=<?= $p['id'] ?>"
           onclick="return confirm('¿Eliminar?')">Borrar</a>
    </td>
</tr>
<?php endforeach; ?>
</table>
</body>
</html>
