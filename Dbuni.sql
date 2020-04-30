create database universita;

use universita;

create table dipartimento(
    Codice varchar(6),
    Nome varchar(50) unique not null,
    primary key(Codice)
);


create table sede(
    Codice varchar(6) primary key,
    Indirizzo varchar(50) unique not null,
    Citta varchar(30) not null
);


create table sede_dipartimento(
    Codice_sede varchar(6),
    Codice_dipartimento varchar(6),
    Note varchar(100),
    primary key(Codice_sede,Codice_dipartimento),
    Foreign key (Codice_sede) references sede(Codice),
    Foreign key (Codice_dipartimento) references dipartimento(Codice)
);

create table corso_laurea(
    Codice varchar(10) primary key,
    Nome varchar(30) unique,
    Descrizione varchar(100)
);


create table modulo(
	Codice varchar(10) primary key,
  Nome varchar(30) not null,
  Descrizione varchar(50),
  CFU int not null
);


create table studente(
	Matricola numeric(6) primary key,
	Corso_Laurea varchar(50),
	Nome varchar(30) not null,
	Cognome varchar(30) not null,
	Data_nascita date not null,
	Codice_Fiscale char(16) unique not null,
	Foto Blob default null,
  Foreign key (Corso_Laurea) references corso_laurea(Nome)
);


create table docente(
	Matricola numeric(6) primary key,
  Dipartimento varchar(50),
  Nome varchar(30) not null,
	Cognome varchar(30) not null,
	Data_nascita date not null,
	Codice_Fiscale char(16) unique not null,
	Foto Blob default null,
  Foreign key (Dipartimento) references dipartimento(Nome)
);



create table esame(
	Matricola_studente numeric(6),
    Codice_Modulo varchar(10),
    Matricola_docente numeric(6),
    Data_esame date,
    Voto smallint check (Voto>=18 and Voto<=30),
    Lode char(4),
    Note varchar(100),
    check (Lode='' or Voto=30),
    primary key (Matricola_studente,Codice_Modulo,Matricola_docente),
    Foreign key (Matricola_studente) references studente(Matricola)
  						                          on delete cascade
                                        on update cascade,
    Foreign key (Matricola_docente) references docente(Matricola),
    Foreign key (Codice_Modulo) references modulo(Codice)
);



insert into sede(Codice,Indirizzo,Citta)
	values ('110011','Via Sequoie,1','Taranto');

insert into sede(Codice,Indirizzo,Citta)
	values ('343311','Via Ginevra,67','Milano');

insert into sede(Codice,Indirizzo,Citta)
	values ('908011','Via Medine,5','Padova');



insert into dipartimento(Codice,Nome)
	values ('DIPInf','Informatica');

insert into dipartimento(Codice,Nome)
	values ('DIPPol','Scienze Politiche');

insert into dipartimento(Codice,Nome)
	values ('DIPEcF','Economia e Finanze');



insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
	values ('110011','DIPInf',NULL);



insert into corso_laurea(Codice,Nome,Descrizione)
	values ('CLl20EC','Economia','Accesso Libero');

insert into corso_laurea(Codice,Nome,Descrizione)
	values ('CLl20SC','Scienze della comunicazione','Accesso Libero');

insert into corso_laurea(Codice,Nome,Descrizione)
	values ('CLl36','Scienze Politiche','Accesso Libero');

insert into corso_laurea(Codice,Nome,Descrizione)
	values ('CLl8INF','Informatica','Accesso Libero');



insert into modulo(Codice,Nome,Descrizione,CFU)
	values ('Eco','Economia Politica',null,'9');

insert into modulo(Codice,Nome,Descrizione,CFU)
	values ('FodInf','Fondamenti di informatica',null,'6');

insert into modulo(Codice,Nome,Descrizione,CFU)
	values ('DirAmm','Diritto Amministrativo',null,'4');



insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('567809','Informatica','Giuseppina','Settanni','1970/05/13','GSPSTT70G44L049F',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('445678','Economia e Finanze','Alberto','Piepoli','1975/12/16','LBRPPL75G12H70O',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('889564','Scienze Politiche','Fedele','Guglielmo','1980/12/16','FDLGLG80G56L70U',null);


insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101101','Informatica','Carmela','Florio','1992/06/26','FLRCML92H66L049F',null);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101102','Scienze Politiche','Giovanni','Paddi','1996/03/26','GVNPDD96H66L049F',null);



insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101101','Eco','567809','2019/09/23','25','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101101','FodInf','889564','2018/11/10','29','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101102','Eco','445678','2019/05/15','30','',null);
