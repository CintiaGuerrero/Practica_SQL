--Creamos esquema
create schema cintia_gt authorization lwjgrwjd;

--Crear la tabla de grupo empresarial
create table cintia_gt.grupo_empresarial(
	id_grupo varchar(10) not null,
	nombre varchar (100) not null,
	constraint grupo_empresarial_PK primary key (id_grupo)
);

--Crear la tabla de marca
create table cintia_gt.marcas(
	id_marcas varchar(10) not null,
	nombre varchar (100) not null,
	constraint marcas_PK primary key (id_marcas)
);

--Crear la tabla de modelos
create table cintia_gt.modelos(
	id_modelo varchar(10) not null,
	nombre varchar (100) not null,
	anio_produccion integer not null,
	constraint modelos_PK primary key (id_modelo)
);

--Crear la tabla de color
create table cintia_gt.color(
	id_color varchar(10) not null,
	nombre varchar (100) not null,
	constraint color_PK primary key (id_color)
);

--Crear la tabla de compania seguros
create table cintia_gt.compania_seguros(
	id_compania varchar(10) not null,
	nombre varchar (100) not null,
	constraint compania_seguros_PK primary key (id_compania)
);

--Crear la tabla de moneda
create table cintia_gt.moneda(
	id_moneda varchar(10) not null,
	nombre varchar (100) not null,
	constraint moneda_PK primary key (id_moneda)
);

--Crear la tabla de coches
create table cintia_gt.coches(
	id_coche varchar(10) not null,
	id_color varchar(10) not null,
	matricula varchar (10) not null,
	fecha_compra date not null,
	constraint coches_PK primary key (id_coche)
);

--Añadimos FK de color a la tabla coche
alter table cintia_gt.coches
add constraint coches_FK foreign key (id_color)
references cintia_gt.color (id_color);


--Crear la tabla de revisiones
create table cintia_gt.revisiones(
	id_revision varchar(10) not null,
	id_coche varchar(10) not null,
	fecha_revision date not null,
	km_revision integer not null,
	importe_revision numeric(12,2) not null,
	id_moneda varchar(10) not null,
	constraint revisiones_PK primary key (id_revision, id_coche),
	constraint revisiones_FK foreign key (id_coche)
	references cintia_gt.coches (id_coche)
);

-- Añadir constraint FK de la tabla moneda
alter table cintia_gt.revisiones
add constraint revisiones2_FK foreign key (id_moneda)
references cintia_gt.moneda (id_moneda);


--Crear la tabla de polizas
create table cintia_gt.polizas(
	id_polizas varchar(10) not null,
	id_coche varchar(10) not null,
	numero_poliza integer not null,
	fecha_poliza date not null,
	constraint polizas_PK primary key (id_polizas, id_coche),
	constraint revisiones_FK foreign key (id_coche)
	references cintia_gt.coches (id_coche)
);

--Crear la tabla que integra polizas con compañias
create table cintia_gt.poliza_compania(
	id_polizas varchar(10) not null,
	id_coche varchar(10) not null,
	id_compania varchar(10) not null,
	constraint poliza_compania_PK primary key (id_polizas, id_coche),
	constraint poliza_compania_FK foreign key (id_compania)
	references cintia_gt.compania_seguros (id_compania)
);

-- Añadir constraint FK de la tabla compania_seguros
alter table cintia_gt.poliza_compania
add constraint poliza_compania2_FK foreign key (id_polizas, id_coche)
references cintia_gt.polizas (id_polizas, id_coche);


--Crear la tabla que integra grupos, marcas y modelos de coches
create table cintia_gt.grupo_marca_modelo(
	id_grupo varchar(10) not null,
	id_marcas varchar(10) not null,
	id_modelo varchar(10) not null,
	id_coche varchar(10) not null,
	constraint grupo_marca_modelo_PK primary key (id_coche),
	constraint grupo_modelo_marca_FK foreign key (id_grupo)
	references cintia_gt.grupo_empresarial (id_grupo)
);

alter table cintia_gt.grupo_marca_modelo
add constraint grupo_marca_modelo2_FK foreign key (id_marcas)
references cintia_gt.marcas (id_marcas);

alter table cintia_gt.grupo_marca_modelo
add constraint grupo_marca_modelo3_FK foreign key (id_modelo)
references cintia_gt.modelos (id_modelo);

alter table cintia_gt.grupo_marca_modelo
add constraint grupo_marca_modelo4_FK foreign key (id_coche)
references cintia_gt.coches (id_coche);

---------------DML---------------

insert into cintia_gt.grupo_empresarial
(id_grupo, nombre)
values ('G0000001', 'Grupo Volkswagen');

insert into cintia_gt.grupo_empresarial
(id_grupo, nombre)
values ('G0000002', 'Grupo Renault-Nissan-Mitsubishi');

insert into cintia_gt.grupo_empresarial
(id_grupo, nombre)
values ('G0000003', 'Hyundai');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000001', 'Seat');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000002', 'Skoda');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000003', 'Audi');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000004', 'Renault');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000005', 'Dacia');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000006', 'Hyundai');

insert into cintia_gt.marcas
(id_marcas, nombre)
values ('MA0000007', 'Kia');

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000001', 'Leon', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000002', 'Ibiza', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000003', 'Sandero', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000004', 'Rio', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000005', 'Essence', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000006', 'Captur', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000007', 'A3', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000008', 'Karoq', 2020);

insert into cintia_gt.modelos
(id_modelo, nombre, anio_produccion)
values ('M0000009', 'Duster', 2020);

insert into cintia_gt.color 
(id_color, nombre)
values ('P00001', 'Rojo');

insert into cintia_gt.color 
(id_color, nombre)
values ('P00002', 'Azul');

insert into cintia_gt.color 
(id_color, nombre)
values ('P00003', 'Verde');

insert into cintia_gt.color 
(id_color, nombre)
values ('P00004', 'Blanco');

insert into cintia_gt.color 
(id_color, nombre)
values ('P00005', 'Gris');

insert into cintia_gt.color 
(id_color, nombre)
values ('P00006', 'Amarillo');

insert into cintia_gt.compania_seguros  
(id_compania, nombre)
values ('S000001', 'Maphfre');

insert into cintia_gt.compania_seguros  
(id_compania, nombre)
values ('S000002', 'Racc');

insert into cintia_gt.compania_seguros  
(id_compania, nombre)
values ('S000003', 'Axa');

insert into cintia_gt.moneda  
(id_moneda, nombre)
values ('MO0001', 'Euro');

insert into cintia_gt.moneda  
(id_moneda, nombre)
values ('MO0002', 'Dolar');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000001', 'P00001', '8897HRH', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000002', 'P00002', '4241SLY', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000003', 'P00003', '6876QAJ', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000004', 'P00004', '0500FGY', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000005', 'P00005', '0120JEG', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000006', 'P00006', '1118KHR', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000007', 'P00001', '7843UAV', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000008', 'P00002', '8043EMV', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000009', 'P00003', '5411DZZ', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000010', 'P00004', '8071XOL', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000011', 'P00005', '9674SOW', '2020/12/31');

insert into cintia_gt.coches
(id_coche, id_color, matricula, fecha_compra)
values('C0000012', 'P00006', '9844MSI', '2020/12/31');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000001', 'C0000001', '2022/03/22', 100000, 500, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000002', 'C0000002', '2022/03/22', 50000, 250, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000003', 'C0000003', '2022/03/22', 20000, 756, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000004', 'C0000004', '2022/03/22', 70000, 302, 'MO0002');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000005', 'C0000005', '2022/03/22', 30000, 309, 'MO0002');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000006', 'C0000006', '2022/03/23', 25000, 1060, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000007', 'C0000007', '2022/03/23', 40000, 890, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000008', 'C0000008', '2022/03/23', 46000, 765, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000009', 'C0000009', '2022/03/23', 89000, 495, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000010', 'C0000010', '2022/03/23', 73000, 865, 'MO0001');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000011', 'C0000011', '2022/03/24', 85000, 985, 'MO0002');

insert into cintia_gt.revisiones 
(id_revision, id_coche, fecha_revision,km_revision, importe_revision, id_moneda)
values('R0000012', 'C0000012', '2022/03/24', 96450, 739, 'MO0002');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000001', 'C0000001',997265563, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000002', 'C0000002',800038847, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000003', 'C0000003',709639671, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000004', 'C0000004',709076106, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000005', 'C0000005',103582689, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000006', 'C0000006',379434248, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000007', 'C0000007',520759225, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000008', 'C0000008',642103692, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000009', 'C0000009',425831516, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000010', 'C0000010',812380266, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000011', 'C0000011',746937031, '2020/12/31');

insert into cintia_gt.polizas
(id_polizas, id_coche, numero_poliza, fecha_poliza)
values('P0000012', 'C0000012',165338437, '2020/12/31');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000001', 'P0000001', 'C0000001');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000001', 'P0000002', 'C0000002');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000003', 'P0000003', 'C0000003');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000002', 'P0000004', 'C0000004');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000002', 'P0000005', 'C0000005');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000003', 'P0000006', 'C0000006');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000003', 'P0000007', 'C0000007');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000001', 'P0000008', 'C0000008');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000001', 'P0000009', 'C0000009');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000003', 'P0000010', 'C0000010');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000002', 'P0000011', 'C0000011');

insert into cintia_gt.poliza_compania 
(id_compania, id_polizas , id_coche)
values('S000003', 'P0000012', 'C0000012');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000001', 'MA0000001', 'M0000001', 'C0000001');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000001', 'MA0000001', 'M0000002', 'C0000002');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000002', 'MA0000004', 'M0000006', 'C0000003');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000003', 'MA0000006', 'M0000005', 'C0000004');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000003', 'MA0000007', 'M0000004', 'C0000005');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000002', 'MA0000005', 'M0000003', 'C0000006');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000002', 'MA0000005', 'M0000009', 'C0000007');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000001', 'MA0000003', 'M0000007', 'C0000008');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000001', 'MA0000002', 'M0000008', 'C0000009');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000002', 'MA0000004', 'M0000006', 'C0000010');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000003', 'MA0000006', 'M0000005', 'C0000011');

insert into cintia_gt.grupo_marca_modelo 
(id_grupo, id_marcas , id_modelo , id_coche)
values('G0000002', 'MA0000005', 'M0000009', 'C0000012');
