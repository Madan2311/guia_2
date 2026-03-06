create database dbEstudITM
go

use dbEstudITM
go

create table tblEstudiante (
	Codigo int primary key not null,
	nroDoc int not null,
	idPRO int not null,
	idTDoc int not null,
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Activo bit default 1 not null,
	Observac varchar(500) null
);
go

insert into tblEstudiante values
	(30001, 10, 10001000, 7, 'Juan P', 'Aristizábal Cardona', 1, 'Ppto Particip'),
	(30002, 11, 10001001, 8, 'Mario A', 'Martínez Rios', 1, 'Fondo EPM'),
	(30003, 70, 10001002, 1, 'Natalia', 'Castrillón Caguán', 1, null),
	(30004, 71, 10001003, 1, 'Rubén', 'Soto Rivera', 1, 'Pruebas de todo'),
	(30005, 100, 10001004, 3, 'Scott', 'Rangún Suteu', 1, 'Reserva'),
	(30006, 10, 10001005, 9, 'Jazmín A', 'Angarita Marín', 1, 'Ppto Particip'),
	(30007, 101, 10001006, 6, 'José H', 'Soto Diaz', 1, 'Suspende Matric')
go

create procedure USP_Est_BuscarXcodigo
@intCodigo int
as
	begin
		select idPRO codProg, NroDoc, idTDoc TipoDoc, Nombre, Apellido, Activo, isnull(Observac, '') Observac 
		from tblEstudiante
		where Codigo = @intCodigo
end
go

exec USP_est_BuscarXcodigo 30008

create procedure USP_Est_Grabar
@intIdProg int,
@intNroDoc int,
@intTipoDoc int,
@strNombre varchar(50),
@strApelli varchar(50),
@bitActivo bit,
@strOberv varchar(500)
as
	begin
		if exists(select * from tblEstudiante where NroDoc = @intNroDoc)
			begin
				select -1 as rpta
				return
			end
		else
			begin 
				begin TRANSACTION tx
					Declare @intNewCod int
					set @intNewCod = (select max(Codigo) + 1 from tblEstudiante)

					insert into tblEstudiante values(
						@intNewCod, @intIdProg, @intNroDoc, @intTipoDoc,
						@strNombre, @strApelli, @bitActivo, @strOberv
						);
					if (@@ERROR > 0)
						begin
							ROLLBACK TRANSACTION tx
							select 0 as Rpta
							return
						end
					COMMIT TRANSACTION tx
					select @intNewCod as Rpta
					return
				end
end
go

exec USP_est_Grabar 101,70500600,1, 'Andrés', 'Duque' ,1, null

create procedure USP_Est_Modificar
@intCodigo int,
@intIdProg int,
@intNroDoc int,
@intTipoDoc int,
@strNombre varchar(50),
@strApelli varchar(50),
@bitActivo bit,
@strOberv varchar(500)
as
	begin
		if exists(select * from tblEstudiante where NroDoc = @intNroDoc and codigo <> @intCodigo)
			begin
				select -1 as rpta
				return
			end
		else
			begin 
				begin TRANSACTION tx
					update tblEstudiante set
						idPRO = @intIdProg, nroDoc = @intNroDoc,
						idTDoc = @intTipoDoc, Nombre = @strNombre,
						Apellido = @strApelli, Activo = @bitActivo,
						Observac = @strOberv
					where Codigo = @intCodigo

					if (@@ERROR > 0)
						begin
							ROLLBACK TRANSACTION tx
							select 0 as Rpta
							return
						end
					COMMIT TRANSACTION tx
					select @intCodigo as Rpta
					return
				end
end
go

exec USP_Est_Modificar 30008, 101, 70500600, 6, 'Andrés Antonio', 'Duque Diaz' ,1, 'test'