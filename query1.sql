-- CREACIÓN DE ESQUEMA
CREATE SCHEMA IF NOT EXISTS minimarket_schema;

-- CREACIÓN DE TABLAS CON SUS LLAVES PRIMARIAS
create table `minimarket_schema`.`Proveedor` (
`proveedor_id` bigint not null auto_increment,
`nombre_proveedor` varchar(100) not null,
primary key (`proveedor_id`));

create table `minimarket_schema`.`Compra` (
`compra_id` bigint not null auto_increment,
`fecha_compra` date,
`total_compra` int not null,
primary key (`compra_id`)); 

create table `minimarket_schema`.`Producto_Compra` (
`producto_compra_id` bigint not null auto_increment,
primary key (`producto_compra_id`));

create table `minimarket_schema`.`Producto` (
`producto_id` bigint not null auto_increment,
`nombre_producto` varchar(100),
`precio_producto` int not null,
primary key (`producto_id`)); 

create table `minimarket_schema`.`Tipo_Producto` (
`tipo_producto_id` bigint not null auto_increment,
`nombre_tipo_producto` varchar(100),
primary key (`tipo_producto_id`));

create table `minimarket_schema`.`Producto_Venta` (
`producto_venta_id` bigint not null auto_increment,
`cantidad_producto_venta` int not null,
primary key (`producto_venta_id`));

create table `minimarket_schema`.`Venta` (
`venta_id` bigint not null auto_increment,
`fecha_venta` date,
`total_venta` int not null,
primary key (`venta_id`)); 

create table `minimarket_schema`.`Vendedor` (
`vendedor_id` bigint not null auto_increment,
`nombre_vendedor` varchar(100),
primary key (`vendedor_id`)); 

create table `minimarket_schema`.`Cliente` (
`cliente_id` bigint not null auto_increment,
`nombre_cliente` varchar(100),
primary key (`cliente_id`)); 


-- AGREGAR LAS LLAVES FORANEAS A LAS TABLAS
-- LLAVE DE TABLA COMPRA
-- LLAVE PROVEEDOR_ID
alter table minimarket_schema.compra add proveedor_id bigint not null;
alter table minimarket_schema.compra
add constraint compraProveedor
foreign key (proveedor_id)
references minimarket_schema.proveedor(proveedor_id);

-- LLAVES DE TABLA PRODUCTO_COMPRA
-- LLAVE COMPRA_ID
alter table minimarket_schema.producto_compra add compra_id bigint not null;
alter table minimarket_schema.producto_compra
add constraint productoCompraCompra
foreign key (compra_id)
references minimarket_schema.compra(compra_id);
-- LLAVE PRODUCTO_ID
alter table minimarket_schema.producto_compra add producto_id bigint not null;
alter table minimarket_schema.producto_compra
add constraint productoCompraProducto
foreign key (producto_id)
references minimarket_schema.producto(producto_id);

-- LLAVE DE TABLA PRODUCTO
-- LLAVE TIPO_PRODUCTO
alter table minimarket_schema.producto add tipo_producto_id bigint not null;
alter table minimarket_schema.producto
add constraint productoTipoProducto
foreign key (tipo_producto_id)
references minimarket_schema.tipo_producto(tipo_producto_id);

-- LLAVES DE TABLA PRODUCTO_VENTA
-- LLAVE VENTA_ID
alter table minimarket_schema.producto_venta add venta_id bigint not null;
alter table minimarket_schema.producto_venta
add constraint productoVentaVenta
foreign key (venta_id)
references minimarket_schema.venta(venta_id);
-- LLAVE PRODUCTO_ID
alter table minimarket_schema.producto_venta add producto_id bigint not null;
alter table minimarket_schema.producto_venta
add constraint productoVentaProducto
foreign key (producto_id)
references minimarket_schema.producto(producto_id);

-- LLAVES DE TABLA VENTA
-- LLAVE CLIENTE_ID
alter table minimarket_schema.venta add cliente_id bigint not null;
alter table minimarket_schema.venta
add constraint ventaCliente
foreign key (cliente_id)
references minimarket_schema.cliente(cliente_id);
-- LLAVE VENDEDOR_ID
alter table minimarket_schema.venta add vendedor_id bigint not null;
alter table minimarket_schema.venta
add constraint ventaVendedor
foreign key (vendedor_id)
references minimarket_schema.vendedor(vendedor_id);


-- INSERCIÓN DE DATOS
-- INSERCIÓN EN TABLA TIPO_PRODUCTO
INSERT INTO minimarket_schema.tipo_producto (nombre_tipo_producto) VALUES ('Frutas');
INSERT INTO minimarket_schema.tipo_producto (nombre_tipo_producto) VALUES ('Verduras');
INSERT INTO minimarket_schema.tipo_producto (nombre_tipo_producto) VALUES ('Bebestibles');
INSERT INTO minimarket_schema.tipo_producto (nombre_tipo_producto) VALUES ('Snacks');
select * from minimarket_schema.tipo_producto;

-- INSERCIÓN EN TABLA PRODUCTO
INSERT INTO minimarket_schema.producto (nombre_tipo_producto) VALUES ('Frutas');
INSERT INTO minimarket_schema.producto (nombre_tipo_producto) VALUES ('Verduras');
INSERT INTO minimarket_schema.producto (nombre_tipo_producto) VALUES ('Bebestibles');
INSERT INTO minimarket_schema.producto (nombre_tipo_producto) VALUES ('Snacks');
select * from minimarket_schema.producto;




