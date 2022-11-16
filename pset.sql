-- Role: ygor
-- DROP ROLE IF EXISTS ygor;

CREATE ROLE ygor WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  NOCREATEROLE
  NOREPLICATION;
  
  CREATE DATABASE uvv
    WITH 
    OWNER = ygor
    ENCODING = 'UTF8'
	template = template0
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	\ C uvv;
	
	CREATE SCHEMA IF NOT EXISTS hr
    AUTHORIZATION ygor;
	
ALTER ROLE ygor SET search_path TO hr, "$user", public;
  
  CREATE TABLE IF NOT EXISTS hr.cargos
(
    id_cargo character varying(10) COLLATE pg_catalog."default" NOT NULL,
    salario_max numeric(8,2),
    cargo character varying(10) COLLATE pg_catalog."default" NOT NULL,
    salario_min numeric(8,2),
    CONSTRAINT id_cargo PRIMARY KEY (id_cargo)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.cargos
    OWNER to ygor;
	
	CREATE TABLE IF NOT EXISTS hr.departamentos
(
    id_departamento integer,
    nome character varying(50) COLLATE pg_catalog."default",
    id_localizacao integer NOT NULL,
    id_gerente integer NOT NULL,
    CONSTRAINT id_departamento PRIMARY KEY (id_departamento),
    CONSTRAINT empregados_departamentos_fk FOREIGN KEY (id_gerente)
        REFERENCES hr.empregados (id_empaaa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT localizacoes_departamentos_fk FOREIGN KEY (id_localizacao1)
        REFERENCES hr.localizacoes (id_localizacao) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.departamentos
    OWNER to ygor;
	
CREATE TABLE IF NOT EXISTS hr.empregados
(
    id_empregado integer NOT NULL,
    nome character varying(75) COLLATE pg_catalog."default" NOT NULL,
    email character varying(35) COLLATE pg_catalog."default" NOT NULL,
    telefone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    data date NOT NULL,
    id_cargo character varying(10) COLLATE pg_catalog."default" NOT NULL,
    salario numeric(8,2),
    comissao numeric(4,2) NOT NULL,
    id_departamento integer NOT NULL,
    id_supervisor integer NOT NULL,
    CONSTRAINT id_empregado PRIMARY KEY (id_empaaa)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.empregados
    OWNER to ygor;
-- Index: email

-- DROP INDEX IF EXISTS hr.email;

CREATE UNIQUE INDEX IF NOT EXISTS email
    ON hr.empregados USING btree
    (email COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
	
	CREATE TABLE IF NOT EXISTS hr.historico_cargo
(
    data_inicial date NOT NULL,
    id_empregados_1 integer NOT NULL,
    id_departamento integer NOT NULL,
    id_cargo character varying(10) COLLATE pg_catalog."default" NOT NULL,
    data_final date NOT NULL,
    CONSTRAINT id_empregado12 PRIMARY KEY (data_inicial, id_empregadoss),
    CONSTRAINT cargos_historico_cargo_fk FOREIGN KEY (id_cargo12)
        REFERENCES hr.cargos (id_cargo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT departamentos_historico_cargo_fk FOREIGN KEY (id_departamento11)
        REFERENCES hr.departamentos (id_departamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT empregados_historico_cargo_fk FOREIGN KEY (id_empregadoss)
        REFERENCES hr.empregados (id_empaaa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.historico_cargo
    OWNER to ygor;
	
	CREATE TABLE IF NOT EXISTS hr.localizacoes
(
    id_localizacao integer NOT NULL,
    endereco character varying(50) COLLATE pg_catalog."default",
    cep character varying(12) COLLATE pg_catalog."default",
    cidade character varying(50) COLLATE pg_catalog."default",
    uf character varying(25) COLLATE pg_catalog."default",
    id_pais character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT id_localizacoes PRIMARY KEY (id_localizacao),
    CONSTRAINT paises_localizacoes_fk FOREIGN KEY (id_pais)
        REFERENCES hr.paises (id_pais) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.localizacoes
    OWNER to ygor;
	
	CREATE TABLE IF NOT EXISTS hr.paises
(
    id_pais character(2) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(50) COLLATE pg_catalog."default" NOT NULL,
    id_regiao integer NOT NULL,
    CONSTRAINT id_pais1 PRIMARY KEY (id_pais),
    CONSTRAINT regioes_paises_fk FOREIGN KEY (id_regiao)
        REFERENCES hr.regioes (id_regiao) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.paises
    OWNER to ygor;

CREATE TABLE IF NOT EXISTS hr.regioes
(
    id_regiao integer NOT NULL,
    nome character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT id_regiao PRIMARY KEY (id_regiao)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hr.regioes
    OWNER to ygor;
	
insert into hr.regioes (id_regiao, nome) VALUES
(1,'Europe');
insert into hr.regioes (id_regiao, nome) VALUES
(2,'Americas');
insert into hr.regioes (id_regiao, nome) VALUES
(3,'Asia');
insert into hr.regioes (id_regiao, nome) VALUES
(4,'Middle East and Africa');

insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Argentina', 2, 'AR');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Australia', 3, 'AU');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Belgium', 1, 'BE');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Brazil', 2, 'BR');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Canada', 2, 'CA');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Switzerland', 1, 'CH');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('China', 3, 'CN');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Germany', 1, 'DE');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Denmark', 1, 'DK');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Egypt', 4, 'EG');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('France', 1, 'FR');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Israel', 4, 'IL');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('India', 3, 'IN');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Italy', 1, 'IT');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Japan', 3, 'JP');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Kuwait', 4, 'KW');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Malaysia', 3, 'ML');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Mexico', 2, 'MX');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Nigeria', 4, 'NG');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Netherlands', 1, 'NL');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Singapore', 3, 'SG');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('United Kingdom', 1, 'UK');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('United States of America', 2, 'US');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Zambia', 4, 'ZM');
insert into hr.paises (nome, id_regiao, id_pais) VALUES
('Zimbabwe', 4, 'ZW');

insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(00989,'IT','', 'Roma','1297 Via Cola di Rie', '1000');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(10934,'IT','', 'Venice','93091 Calle della Testa', '1100');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(1689,'JP','Tokyo Prefecture', 'Tokyo','2017 Shinjuku-ku', '1200');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(6823,'JP','', 'Hiroshima','9450 Kamiya-cho', '1300');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(26192,'US','Texas', 'Southlake','2014 Jabberwocky Rd', '1400');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(99236,'US','California', 'South San Francisco','2011 Interiors Blvd', '1500');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(50090,'US','New Jersey', 'South Brunswick','2007 Zagora St', '1600');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(98199,'US','Washington', 'Seattle','2004 Charade Rd', '1700');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
('M5V 2L7','CA','Ontario', 'Toronto','147 Spadina Ave', '1800');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
('YSW 9T2','CA','Yukon', 'Whitehorse','6092 Boxwood St', '1900');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(190518,'CN','', 'Beijing','40-5-12 Laogianggen', '2000');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(490231,'IN','Maharashtra', 'Bombay','1298 Vileparle (E)', '2100');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(2901,'AU','New South Wales', 'Sydney','12-98 Victoria Street', '2200');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(540198,'SG','', 'Singapore','198 Clementi North', '2300');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
('','UK','', 'London','8204 Arthur St', '2400');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
('OX9 9ZB','UK','Oxford', 'Oxford','Magdalen C. Orfoxd S.Park', '2500');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(09629850293,'UK','Manchester', 'Stretford','9702 Chester Road', '2600');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(80925,'DE','Bavaria', 'Munich','Schwanthalerstr. 7031', '2700');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(01307-002,'BR','Sao Paulo', 'Sao Paulo','Rua Frei Caneca 1360 ', '2800');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(1730,'CH','Geneve', 'Geneva','20 Rue des Corps-Saints', '2900');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(3095,'CH','BE', 'Bern','Murtenstrasse 921', '3000');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
('3029SK','NL','Utrecht', 'Utrecht','Pieter Breughelstraat 837', '3100');
insert into hr.localizacoes (cep, id_paiss, endereco, cidade, uf, id_localizacao) VALUES
(11932,'MX','Distrito Federal,', 'Mexico City','Mariano Escobedo 9991', '3200');

insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('20080', 'AD_PRES','40000', 'President');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('15000', 'AD_VP','30000', 'Administration Vice President');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('3000', 'AD_ASST','6000', 'Administration Assistant');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('8200', 'FI_MGR','16000', 'Finance Manager');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('4200', 'FI_ACCOUNT','9000', 'Accountant');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('8200', 'AC_MGR','16000', 'Accounting Manager');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('4200', 'AC_ACCOUNT','9000', 'Public Accountant');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('10000', 'SA_MAN','20080', 'Sales Manager');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('6000', 'SA_REP','12008', 'Sales Representative');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('8000', 'PU_MAN','15000' ,'Purchasing Manager');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('2500', 'PU_CLERK','5500', 'Purchasing Clerk');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('5500', 'ST_MAN','8500' ,'Stock Manager');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('2008', 'ST_CLERK','5000' ,'Stock Clerk');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('2500', 'SH_CLERK','5500' ,'Shipping Clerk');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('4000', 'IT_PROG','10000' ,'Programmer');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('9000', 'MK_MAN','15000', 'Marketing Manager');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('4000', 'MK_REP','9000', 'Marketing Representative');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('4000', 'HR_REP','9000', 'Human Resources Representative');
insert into hr.cargos (salario_min, id_cargo, salario_max, cargo) VALUES
('4500', 'PR_REP','10500', 'Public Relations Representative');

INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(100, 'Steven King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000, null, null, 90);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(101, 'Neena Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000, null, 100, 90);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(102, 'Lex De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000, null, 100, 90);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(103, 'Alexander Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000, null, 102, 60);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(104, 'Bruce Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000, null, 103, 60);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(105, 'David Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800, null, 103, 60);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(106, 'Valli Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800, null, 103, 60);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(107, 'Diana Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200, null, 103, 60);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(108, 'Nancy Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008, null, 101, 100);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(109, 'Daniel Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000, null, 108, 100);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(110, 'John Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200, null, 108, 100);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(111, 'Ismael Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', 7700, null, 108, 100);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(112, 'Jose Manuel Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800, null, 108, 100);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(113, 'Luis Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900, null, 108, 100);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(114, 'Den Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000, null, 100, 30);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(115, 'Alexander Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100, null, 114, 30);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(116, 'Shelli Baida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', 2900, null, 114, 30);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(117, 'Sigal Tobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', 2800, null, 114, 30);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(118, 'Guy Himuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', 2600, null, 114, 30);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(119, 'Karen Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', 2500, null, 114, 30);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(120, 'Matthew Weiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', 8000, null, 100, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(121, 'Adam Fripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', 8200, null, 100, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(122, 'Payam Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', 7900, null, 100, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(123, 'Shanta Vollman', 'SVOLLMAN', '650.123.4234', '2005-10-10', 'ST_MAN', 6500, null, 100, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(124, 'Kevin Mourgos', 'KMOURGOS', '650.123.5234', '2007-11-16', 'ST_MAN', 5800, null, 100, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(125, 'Julia Nayer', 'JNAYER', '650.124.1214', '2005-07-16', 'ST_CLERK', 3200, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(126, 'Irene Mikkilineni', 'IMIKKILI', '650.124.1224', '2006-09-28', 'ST_CLERK', 2700, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(127, 'James Landry', 'JLANDRY', '650.124.1334', '2007-01-14', 'ST_CLERK', 2400, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(128, 'Steven Markle', 'SMARKLE', '650.124.1434', '2008-03-08', 'ST_CLERK', 2200, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(129, 'Laura Bissot', 'LBISSOT', '650.124.5234', '2005-08-20', 'ST_CLERK', 3300, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(130, 'Mozhe Atkinson', 'MATKINSO', '650.124.6234', '2005-10-30', 'ST_CLERK', 2800, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(131, 'James Marlow', 'JAMRLOW', '650.124.7234', '2005-02-16', 'ST_CLERK', 2500, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(132, 'TJ Olson', 'TJOLSON', '650.124.8234', '2007-04-10', 'ST_CLERK', 2100, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(133, 'Jason Mallin', 'JMALLIN', '650.127.1934', '2004-06-14', 'ST_CLERK', 3300, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(134, 'Michael Rogers', 'MROGERS', '650.127.1834', '2006-08-26', 'ST_CLERK', 2900, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(135, 'Ki Gee', 'KGEE', '650.127.1734', '2007-12-12', 'ST_CLERK', 2400, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(136, 'Hazel Philtanker', 'HPHILTAN', '650.127.1634', '2008-02-06', 'ST_CLERK', 2200, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(137, 'Renske Ladwig', 'RLADWIG', '650.121.1234', '2003-07-14', 'ST_CLERK', 3600, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(138, 'Stephen Stiles', 'SSTILES', '650.121.2034', '2005-10-26', 'ST_CLERK', 3200, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(139, 'John Seo', 'JSEO', '650.121.2019', '2006-02-12', 'ST_CLERK', 2700, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(140, 'Joshua Patel', 'JPATEL', '650.121.1834', '2006-04-06', 'ST_CLERK', 2500, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(141, 'Trenna Rajs', 'TRAJS', '650.121.8009', '2003-10-17', 'ST_CLERK', 3500, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(142, 'Curtis Davies', 'CDAVIES', '650.121.2994', '2005-01-29', 'ST_CLERK', 3100, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(143, 'Randall Matos', 'RMATOS', '650.121.2874', '2006-03-15', 'ST_CLERK', 2600, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(144, 'Peter Vargas', 'PVARGAS', '650.121.2004', '2006-07-09', 'ST_CLERK', 2500, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(145, 'John Russell', 'JRUSSEL', '011.44.1344.429268', '2004-10-01', 'SA_MAN', 14000, .4, 100, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(146, 'Karen Partners', 'KPARTNER', '011.44.1344.467268', '2005-01-05', 'SA_MAN', 13500, .3, 100, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(147, 'Alberto Errazuriz', 'AERRAZUR', '011.44.1344.429278', '2005-03-10', 'SA_MAN', 12000, .3, 100, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(148, 'Gerald Cambrault', 'GCAMBRAU', '011.44.1344.619268', '2007-10-15', 'SA_MAN', 11000, .3, 100, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(149, 'Eleni Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '2008-01-29', 'SA_MAN', 10500, .2, 100, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(150, 'Peter Tucker', 'PTUCKER', '011.44.1344.129268', '2005-01-30', 'SA_REP', 10000, .3, 145, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(151, 'David Bernstein', 'DBERNSTE', '011.44.1344.345268', '2005-03-24', 'SA_REP', 9500, .25, 145, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(152, 'Peter Hall', 'PHALL', '011.44.1344.478968', '2005-08-20', 'SA_REP', 9000, .25, 145, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(153, 'Christopher Olsen', 'COLSEN', '011.44.1344.498718', '2006-03-30', 'SA_REP', 8000, .2, 145, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(154, 'Nanette Cambrault', 'NCAMBRAU', '011.44.1344.987668', '2006-12-09', 'SA_REP', 7500, .2, 145, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(155, 'Oliver Tuvault', 'OTUVAULT', '011.44.1344.486508', '2007-11-23', 'SA_REP', 7000, .15, 145, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(156, 'Janette King', 'JKING', '011.44.1345.429268', '2004-01-30', 'SA_REP', 10000, .35, 146, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(157, 'Patrick Sully', 'PSULLY', '011.44.1345.929268', '2004-03-04', 'SA_REP', 9500, .35, 146, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(158, 'Allan McEwen', 'AMCEWEN', '011.44.1345.829268', '2004-08-01', 'SA_REP', 9000, .35, 146, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(159, 'Lindsey Smith', 'LSMITH', '011.44.1345.729268', '2005-03-10', 'SA_REP', 8000, .3, 146, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(160, 'Louise Doran', 'LDORAN', '011.44.1345.629268', '2005-12-15', 'SA_REP', 7500, .3, 146, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(161, 'Sarath Sewall', 'SSEWALL', '011.44.1345.529268', '2006-11-03', 'SA_REP', 7000, .25, 146, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(162, 'Clara Vishney', 'CVISHNEY', '011.44.1346.129268', '2005-11-11', 'SA_REP', 10500, .25, 147, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(163, 'Danielle Greene', 'DGREENE', '011.44.1346.229268', '2007-03-19', 'SA_REP', 9500, .15, 147, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(164, 'Mattea Marvins', 'MMARVINS', '011.44.1346.329268', '2008-01-24', 'SA_REP', 7200, .1, 147, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(165, 'David Lee', 'DLEE', '011.44.1346.529268', '2008-02-23', 'SA_REP', 6800, .1, 147, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(166, 'Sundar Ande', 'SANDE', '011.44.1346.629268', '2008-03-24', 'SA_REP', 6400, .1, 147, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(167, 'Amit Banda', 'ABANDA', '011.44.1346.729268', '2008-04-21', 'SA_REP', 6200, .1, 147, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(168, 'Lisa Ozer', 'LOZER', '011.44.1343.929268', '2005-03-11', 'SA_REP', 11500, .25, 148, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(169, 'Harrison Bloom', 'HBLOOM', '011.44.1343.829268', '2006-03-23', 'SA_REP', 10000, .2, 148, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(170, 'Tayler Fox', 'TFOX', '011.44.1343.729268', '2006-01-24', 'SA_REP', 9600, .2, 148, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(171, 'William Smith', 'WSMITH', '011.44.1343.629268', '2007-02-23', 'SA_REP', 7400, .15, 148, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(172, 'Elizabeth Bates', 'EBATES', '011.44.1343.529268', '2007-03-24', 'SA_REP', 7300, .15, 148, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(173, 'Sundita Kumar', 'SKUMAR', '011.44.1343.329268', '2008-04-21', 'SA_REP', 6100, .1, 148, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(174, 'Ellen Abel', 'EABEL', '011.44.1644.429267', '2004-05-11', 'SA_REP', 11000, .3, 149, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(175, 'Alyssa Hutton', 'AHUTTON', '011.44.1644.429266', '2005-03-19', 'SA_REP', 8800, .25, 149, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(176, 'Jonathon Taylor', 'JTAYLOR', '011.44.1644.429265', '2006-03-24', 'SA_REP', 8600, .2, 149, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(177, 'Jack Livingston', 'JLIVINGS', '011.44.1644.429264', '2006-04-23', 'SA_REP', 8400, .2, 149, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(178, 'Kimberely Grant', 'KGRANT', '011.44.1644.429263', '2007-05-24', 'SA_REP', 7000, .15, 149, null);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(179, 'Charles Johnson', 'CJOHNSON', '011.44.1644.429262', '2008-01-04', 'SA_REP', 6200, .1, 149, 80);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(180, 'Winston Taylor', 'WTAYLOR', '650.507.9876', '2006-01-24', 'SH_CLERK', 3200, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(181, 'Jean Fleaur', 'JFLEAUR', '650.507.9877', '2006-02-23', 'SH_CLERK', 3100, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(182, 'Martha Sullivan', 'MSULLIVA', '650.507.9878', '2007-06-21', 'SH_CLERK', 2500, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(183, 'Girard Geoni', 'GGEONI', '650.507.9879', '2008-02-03', 'SH_CLERK', 2800, null, 120, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(184, 'Nandita Sarchand', 'NSARCHAN', '650.509.1876', '2004-01-27', 'SH_CLERK', 4200, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(185, 'Alexis Bull', 'ABULL', '650.509.2876', '2005-02-20', 'SH_CLERK', 4100, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(186, 'Julia Dellinger', 'JDELLING', '650.509.3876', '2006-06-24', 'SH_CLERK', 3400, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(187, 'Anthony Cabrio', 'ACABRIO', '650.509.4876', '2007-02-07', 'SH_CLERK', 3000, null, 121, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(188, 'Kelly Chung', 'KCHUNG', '650.505.1876', '2005-06-14', 'SH_CLERK', 3800, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(189, 'Jennifer Dilly', 'JDILLY', '650.505.2876', '2005-08-13', 'SH_CLERK', 3600, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(190, 'Timothy Gates', 'TGATES', '650.505.3876', '2006-07-11', 'SH_CLERK', 2900, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(191, 'Randall Perkins', 'RPERKINS', '650.505.4876', '2007-12-19', 'SH_CLERK', 2500, null, 122, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(192, 'Sarah Bell', 'SBELL', '650.501.1876', '2004-02-04', 'SH_CLERK', 4000, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(193, 'Britney Everett', 'BEVERETT', '650.501.2876', '2005-03-03', 'SH_CLERK', 3900, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(194, 'Samuel McCain', 'SMCCAIN', '650.501.3876', '2006-07-01', 'SH_CLERK', 3200, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(195, 'Vance Jones', 'VJONES', '650.501.4876', '2007-03-17', 'SH_CLERK', 2800, null, 123, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(196, 'Alana Walsh', 'AWALSH', '650.507.9811', '2006-04-24', 'SH_CLERK', 3100, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(197, 'Kevin Feeney', 'KFEENEY', '650.507.9822', '2006-05-23', 'SH_CLERK', 3000, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(198, 'Donald OConnell', 'DOCONNEL', '650.507.9833', '2007-06-21', 'SH_CLERK', 2600, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(199, 'Douglas Grant', 'DGRANT', '650.507.9844', '2008-01-13', 'SH_CLERK', 2600, null, 124, 50);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(200, 'Jennifer Whalen', 'JWHALEN', '515.123.4444', '2003-09-17', 'AD_ASST', 4400, null, 101, 10);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(201, 'Michael Hartstein', 'MHARTSTE', '515.123.5555', '2004-02-17', 'MK_MAN', 13000, null, 100, 20);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(202, 'Pat Fay', 'PFAY', '603.123.6666', '2005-08-17', 'MK_REP', 6000, null, 201, 20);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(203, 'Susan Mavris', 'SMAVRIS', '515.123.7777', '2002-06-07', 'HR_REP', 6500, null, 101, 40);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(204, 'Hermann Baer', 'HBAER', '515.123.8888', '2002-06-07', 'PR_REP', 10000, null, 101, 70);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(205, 'Shelley Higgins', 'SHIGGINS', '515.123.8080', '2002-06-07', 'AC_MGR', 12008, null, 101, 110);
INSERT INTO hr.empregados (id_empregado, nome, email,
telefone, data_contratacao, id_cargo, salario,
comissao, id_supervisor, id_departamento) VALUES
(206, 'William Gietz', 'WGIETZ', '515.123.8181', '2002-06-07', 'AC_ACCOUNT', 8300, null, 205, 110);

INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(90, 'Administration', 1700, 200);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(90, 'Marketing', 1800, 201);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(90, 'Purchasing', 1700, 114);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(60, 'Human Resources', 2400, 203);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(60, 'Shipping', 1500, 121);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(60, 'IT', 1400, 103);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(60, 'Public Relations', 2700, 204);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(60, 'Sales', 2500, 145);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(100, 'Executive', 1700, 100);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(100, 'Finance', 1700, 108);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(100, 'Accounting', 1700, 205);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(100, 'Treasury', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(100, 'Corporate Tax', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(100, 'Control And Credit', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(30, 'Shareholder Services', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(30, 'Benefits', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(30, 'Manufacturing', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(30, 'Construction', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(30, 'Contracting', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(30, 'Operations', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(50, 'IT Support', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(50, 'NOC', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(50, 'IT Helpdesk', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(50, 'Government Sales', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(50, 'Retail Sales', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(60, 'Recruiting', 1700, null);
INSERT INTO hr.departamentos (id_departamento, nome, id_localizacao, id_gerente) values
(50, 'Payroll', 1700, null);

insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('IT_PROG','60', 102, '2006-07-24','2001-01-13');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('AC_ACCOUNT','110', 101, '2001-10-27','1997-09-21');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('AC_MGR','110', 101, '2005-03-15','2001-10-28');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('MK_REP','20', 201, '2007-12-19','2004-02-17');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('ST_CLERK','50', 114, '2007-12-31','2006-03-24');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('ST_CLERK','50', 122, '2007-12-31','2007-01-01');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('AD_ASST','90', 200, '2001-06-17','1995-09-17');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('SA_REP','80', 176, '2006-12-31','2006-03-24');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('SA_MAN','80', 176, '2007-12-31','2007-01-01');
insert into hr.historico_cargos (id_cargo, id_departamento, id_empregado_1, data_final, data_inicial) VALUES
('AC_ACCOUNT','90', 200, '2006-12-31','2002-07-01');

Alter table hr.paises
Add constraint paises_regioes_fk foreign key  (id_regiao)
References hr.regioes (id_regiao);

Alter table hr.localizacoes
Add constraint localizacoes_paises_fk foreign key  (id_pais)
References hr.paises (id_pais);

Alter table hr.departamentos
Add constraint departamentos_localizacoes_fk foreign key  (id_localizacao)
References hr.localizacoes (id_localizacao);

Alter table hr.departamentos
Add constraint departamentos_empregados_fk foreign key  (id_gerente)
References hr.empregados (id_empregado);

Alter table hr.historico_cargos
Add constraint historico_cargos_cargos_fk foreign key  (id_cargo)
References hr.cargos (id_cargo);

Alter table hr.historico_cargos
Add constraint historico_cargos_empregados_fk foreign key  (id_empregado_1)
References hr.empregados (id_empregado);

Alter table hr.empregados
Add constraint empregados_cargos_fk foreign key  (id_cargo)
References hr.cargos (id_cargo);
