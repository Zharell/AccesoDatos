alter session set NLS_language='spanish';
alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

drop table doctor;
drop table enfermo;
drop table plantilla;
drop table sala;
drop table hospital;


create table hospital(
	hospital_cod number (2) not null primary key,
	nombre varchar2 (12),
	direccion varchar2 (20),
	telefono varchar2 (8),
	num_cama number (4)
);

insert into hospital values (13,'Provincial','O Donell 50','964-4264',502);
insert into hospital values (18,'General','Atocha s/n','595-3111',987);
insert into hospital values (22,'La Paz','Castellana 1000','923-5411',412);
insert into hospital values (45,'San Carlos','Ciudad Universitaria','597-1500',845);

create table enfermo(
	inscripcion number (5),
	apellido varchar2 (12),
	direccion varchar2 (20),
	fecha_nac date,
	s varchar2 (1),
	nss number (9) not null primary key,
	hospital_cod number (2),
	constraint fk_enfermo foreign key (hospital_cod) references hospital (hospital_cod) on delete cascade,
	constraint ck_sexo check (s in ('M','F'))
);

insert into enfermo values (10995,'Laguia M.','Goya 20','16/05/1956','M',280862482,13);
insert into enfermo values (18004,'Serrano V.','Alcala 12','21/05/1960','F',284991452,18);
insert into enfermo values (14024,'Fernandez M.','Recoletos 50','23/06/1967','F',321790059,18);
insert into enfermo values (36658,'Domin S.','Mayor 71','01/01/1942','M',160654471,22);
insert into enfermo values (38702,'Neal R.','Orense 11','18/06/1940','F',380010217,45);
INSERT INTO enfermo VALUES (39217,'Cervantes M.','Peron 38','29/02/1952','M',440294390,22);
INSERT INTO enfermo VALUES (59076,'Miller B.','Lopez de Hoyos 2','16/09/1945','F',311969044,45);
INSERT INTO enfermo VALUES (63827,'Ruiz P.','Esquerdo 103','26/12/1980','M',100973253,18);
INSERT INTO enfermo VALUES (64823,'Fraser A.','Soto 3','10/07/1980','F',285201776,13);
INSERT INTO enfermo VALUES (74835,'Benitez E.','Argentina 5','05/10/1957','M',154811767,22);

create table sala(
	hospital_cod number (2) not null,
	sala_cod number (2) not null,
	nombre varchar (20),
	num_cama number (4),
	constraint pk_sala primary key (hospital_cod,sala_cod),
	constraint fk_sala foreign key (hospital_cod) references hospital (hospital_cod) on delete cascade
);

INSERT INTO sala VALUES (13,3,'Cuidados intensivos',21);
INSERT INTO sala VALUES (13,6,'Psiquiatrico',67);
INSERT INTO sala VALUES (18,3,'Cuidados intensivos',10);
INSERT INTO sala VALUES (18,4,'Cardiologia',53);
INSERT INTO sala VALUES (22,1,'Recuperacion',10);
INSERT INTO sala VALUES (22,6,'Psiquiatrico',118);
INSERT INTO sala VALUES (22,2,'Maternidad',34);
INSERT INTO sala VALUES (45,4,'Cardiologia',55);
INSERT INTO sala VALUES (45,1,'Recuperacion',13);
INSERT INTO sala VALUES (45,2,'Maternidad',24);


create table plantilla(
	hospital_cod number (2),
	sala_cod number (2),
	empleado_no number (4) not null primary key,
	apellido varchar (16),
	funcion varchar (10),
	turno varchar (1),
	salario number(10),
	constraint fk_plantilla foreign key (hospital_cod) references hospital (hospital_cod) on delete cascade,
	constraint fk_hosp_sala foreign key (hospital_cod,sala_cod) references sala (hospital_cod,sala_cod) on delete cascade,
	constraint ck_turno check (turno in('M','T','N'))
);

INSERT INTO plantilla VALUES (13,6,3754,'Diaz B.','Enfermera','T',226200);
INSERT INTO plantilla VALUES (13,6,3106,'Hernandez J.','Enfermero','T',275000);
INSERT INTO plantilla VALUES (18,4,6357,'Karplus W.','Interno','T',337900);
INSERT INTO plantilla VALUES (22,6,1009,'Higueras D.','Enfermera','T',200500);
INSERT INTO plantilla VALUES (22,6,8422,'Bocina G.','Enfermero','M',183800);
INSERT INTO plantilla VALUES (22,2,9901,'Nu�ez C.','Interno','M',221000);
INSERT INTO plantilla VALUES (22,1,6065,'Rivera G.','Enfermera','N',162600);
INSERT INTO plantilla VALUES (22,1,7379,'Carlos R.','Enfermera','T',211900);
INSERT INTO plantilla VALUES (45,4,1280,'AMIGO R.','Interno','N',221000);
INSERT INTO plantilla VALUES (45,1,8526,'FRANK H.','Enfermera','T',252200);

create table doctor(
	hospital_cod number (2),
	doctor_no number (3) not null primary key,
	apellido varchar2 (16),
	especialidad varchar (16),
	constraint fk_doctor foreign key (hospital_cod) references hospital (hospital_cod) on delete cascade
);

INSERT INTO DOCTOR VALUES (13,435,'Lopez A.','Cardiologia');
INSERT INTO DOCTOR VALUES (18,585,'Miller G.','Ginecologia');
INSERT INTO DOCTOR VALUES (18,982,'Cajal R.','Cardiologia');
INSERT INTO DOCTOR VALUES (22,453,'Galo D.','Pediatria');
INSERT INTO DOCTOR VALUES (22,398,'Best D.','Urologia');
INSERT INTO DOCTOR VALUES (22,386,'Cabeza D.','Psiquiatria');
INSERT INTO DOCTOR VALUES (45,607,'Nino P.','Pediatria');
INSERT INTO DOCTOR VALUES (45,522,'Adams C.','Neurologia');
