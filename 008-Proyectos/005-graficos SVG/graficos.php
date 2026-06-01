<?php
// Gráfico de barras SVG a partir de datos de la BD

$pdo = new PDO('mysql:host=localhost;dbname=proyecto_crud;charset=utf8', 'root', '',
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

$datos = $pdo->query("SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 8")
             ->fetchAll(PDO::FETCH_ASSOC);

$max_precio = max(array_column($datos, 'precio'));
$ancho_barra = 60;
$separacion  = 20;
$altura_max  = 200;
$margen_izq  = 50;
$margen_inf  = 60;
$total_ancho = count($datos) * ($ancho_barra + $separacion) + $margen_izq + 20;
$total_alto  = $altura_max + $margen_inf + 20;

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Gráfico SVG</title></head>
<body>
<h1>Precios de productos</h1>
<svg width="<?= $total_ancho ?>" height="<?= $total_alto ?>"
     style="border:1px solid #ccc; background:#fafafa">

  <!-- Eje Y -->
  <line x1="<?= $margen_izq ?>" y1="10"
        x2="<?= $margen_izq ?>" y2="<?= $altura_max + 10 ?>"
        stroke="#333" stroke-width="2"/>
  <!-- Eje X -->
  <line x1="<?= $margen_izq ?>" y1="<?= $altura_max + 10 ?>"
        x2="<?= $total_ancho - 10 ?>" y2="<?= $altura_max + 10 ?>"
        stroke="#333" stroke-width="2"/>

<?php
$colores = ['#4e79a7','#f28e2b','#e15759','#76b7b2','#59a14f','#edc948','#b07aa1','#ff9da7'];
foreach ($datos as $i => $fila):
    $altura_barra = ($fila['precio'] / $max_precio) * $altura_max;
    $x = $margen_izq + $i * ($ancho_barra + $separacion) + $separacion;
    $y = 10 + $altura_max - $altura_barra;
    $color = $colores[$i % count($colores)];
?>
  <rect x="<?= $x ?>" y="<?= $y ?>"
        width="<?= $ancho_barra ?>" height="<?= $altura_barra ?>"
        fill="<?= $color ?>"/>
  <text x="<?= $x + $ancho_barra/2 ?>" y="<?= $y - 5 ?>"
        text-anchor="middle" font-size="12"><?= number_format($fila['precio'],0) ?>€</text>
  <text x="<?= $x + $ancho_barra/2 ?>" y="<?= $altura_max + 30 ?>"
        text-anchor="middle" font-size="11"
        transform="rotate(-30,<?= $x + $ancho_barra/2 ?>,<?= $altura_max + 30 ?>)">
    <?= htmlspecialchars(mb_substr($fila['nombre'], 0, 12)) ?>
  </text>
<?php endforeach; ?>
</svg>
</body>
</html>
