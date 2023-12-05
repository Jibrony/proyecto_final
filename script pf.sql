use proyecto_final;
-- drop database proyecto;

insert into web_catalogoincidencia (clave_incidencia, incidencia)values("CIBA1","baches");
insert into web_catalogoincidencia (clave_incidencia, incidencia)values("CIPA","Problemas de alumbrado");
insert into web_catalogoincidencia (clave_incidencia, incidencia)values("CIFA1","fuga de alcantarilla");
insert into web_catalogoincidencia (clave_incidencia, incidencia)values("CIPB1","basura en via publica");
select * from web_catalogoincidencia;

-- drop trigger if exists T_SEGUNDOAP_NULL;
delimiter $$
	CREATE TRIGGER T_SEGUNDOAP_NULL
    before INSERT ON web_usuario
    FOR EACH ROW
    BEGIN
    declare nulo varchar(10) default null;
	if new.segundo_apellido is null or new.segundo_apellido ="" then
		begin 
			set new.segundo_apellido=nulo;
		end;
    end if;
    
    END $$
delimiter ;

-- drop trigger if exists T_fechas_now_reporte_de_incidencia;
delimiter $$
	CREATE TRIGGER T_fechas_now_reporte_de_incidencia
    before INSERT ON web_reportedeincidencia
    FOR EACH ROW
    BEGIN
	if new.fecha_de_reporte is null  then
		begin 
			set new.fecha_de_reporte=now();
		end;
    end if;
    if new.calle_secundaria is null or new.calle_secundaria="" then
		begin 
			set new.calle_secundaria=null;
        end;
    end if;
    if new.descripcion is null or new.descripcion="" then
		begin 
			set new.descripcion="sin descripcion";
        end;
    end if;
    
    
    END $$
delimiter ;

-- drop trigger if exists T_fechas_hora_now_ticket_incidencia;

delimiter $$
	CREATE TRIGGER T_fechas_hora_now_ticket_incidencia
    before INSERT ON web_ticketdeincidencia
    FOR EACH ROW
    BEGIN
	if new.fecha_hora is null then
		begin 
			set new.fecha_hora=now();
		end;
    end if;
    
    END $$
delimiter ;