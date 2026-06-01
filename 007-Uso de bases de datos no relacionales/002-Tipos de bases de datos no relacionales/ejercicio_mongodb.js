// Ejercicio con MongoDB (ejecutar con mongosh)

// Crear/seleccionar base de datos
use tienda_nosql;

// Insertar un documento
db.productos.insertOne({
    nombre: "Auriculares BT",
    precio: 49.99,
    stock: 15,
    categorias: ["electrónica", "audio"],
    especificaciones: {
        conexion: "Bluetooth 5.0",
        autonomia_horas: 30
    }
});

// Insertar múltiples documentos
db.productos.insertMany([
    { nombre: "Cargador USB-C", precio: 12.50, stock: 50, categorias: ["electrónica"] },
    { nombre: "Funda portátil", precio: 24.00, stock: 8,  categorias: ["accesorios"] }
]);

// Consultar todos
db.productos.find();

// Filtrar
db.productos.find({ precio: { $lt: 25 } });

// Proyección (solo nombre y precio)
db.productos.find({}, { nombre: 1, precio: 1, _id: 0 });

// Actualizar
db.productos.updateOne(
    { nombre: "Cargador USB-C" },
    { $set: { precio: 14.99 }, $inc: { stock: -1 } }
);

// Eliminar
db.productos.deleteOne({ nombre: "Funda portátil" });

// Agregación
db.productos.aggregate([
    { $group: { _id: null, precio_medio: { $avg: "$precio" }, total: { $sum: 1 } } }
]);
