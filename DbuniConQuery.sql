create database if not exists universita;

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

insert into sede(Codice,Indirizzo,Citta)
  values ('908012','Via Sentine,9','Roma');

insert into sede(Codice,Indirizzo,Citta)
  values ('108011','Via Lecci,40','Lecce');

insert into sede(Codice,Indirizzo,Citta)
	values ('908066','Via Perragni,3','Lecco');



insert into dipartimento(Codice,Nome)
	values ('DIPInf','Informatica');

insert into dipartimento(Codice,Nome)
	values ('DIPPol','Scienze Politiche');

insert into dipartimento(Codice,Nome)
	values ('DIPEcF','Economia e Finanze');

insert into dipartimento(Codice,Nome)
  values ('DIPLng','Lingue');

insert into dipartimento(Codice,Nome)
  values ('DIPSgi','Sistemi Giuridici');


insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
	values ('110011','DIPInf',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
	values ('108011','DIPSgi',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
	values ('343311','DIPLng',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
  	values ('908011','DIPEcF',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
  	values ('908012','DIPPol',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
  	values ('343311','DIPPol',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
    values ('908012','DIPSgi',NULL);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
  	values ('908012','DIPEcF',NULL);



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

insert into modulo(Codice,Nome,Descrizione,CFU)
	values ('IngSw','Ingegneria del Software',null,'8');

insert into modulo(Codice,Nome,Descrizione,CFU)
	values ('MetFis','Metodi di Fisica',null,'4');

insert into modulo(Codice,Nome,Descrizione,CFU)
	values ('BdD','Basi di Dati',null,'9');



insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('709311','Informatica','Giuseppina','Settanni','1970/05/13','GSPSTT70G44L049F',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('245364','Economia e Finanze','Alberto','Piepoli','1975/12/16','LBRPPL75G12H70O',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('444786','Scienze Politiche','Fedele','Guglielmo','1980/12/16','FDLGLG80G56L70U',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('709324','Lingue','Francesco','Facchetti','1976/05/01','FFCFRN76G19L71P',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('709587','Sistemi giuridici','Adele','Giannuzzi','1966/01/22','DDLGNN66L06L049F',null);



insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101101','Informatica','Carmela','Florio','1992/06/26','FLRCML92H66L049F',null);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101102','Scienze Politiche','Giovanni','Paddi','1996/03/26','GVNPDD96H66L049F',null);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101103','Scienze Politiche','Francesco','Dinumi','1995/01/13','FRNDNM96H66O949C',null);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
  values ('101104','Scienze della Comunicazione','Marianna','Soliberto','1994/06/23','MRNSLB96H66L049F',null);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale,Foto)
  values('101105','Economia','Antonia','Musciacchio','1993/05/05','MSCNTN93E45L049M',null);

  insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale,Foto)
  values('101106','Scienze della Comunicazione','Selene','Inno','1992/10/27','NNISLN92R67L049W',null);

  insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale,Foto)
  values('101107','Informatica','Mattia','Valente','1991/05/13','VLNMTT91E13L049G',null);

  insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale,Foto)
  values('101108','Economia','Simone','Tornese','1991/08/14','TNSSMN91L05F076U',null);



insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101101','Eco','245364','2019/09/23','25','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101107','FodInf','709311','2019/02/13','30','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101101','FodInf','709311','2018/11/10','29','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101102','Eco','245364','2019/05/15','30','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
  values ('101102','MetFis','709587','2020/04/20','19','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101104','BdD','709311','2018/09/06','27','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values ('101103','Eco','245364','2019/05/15','30','',null);

/*1. Mostrare nome e descrizione di tutti i moduli da 9 CFU*/
select nome as NomeModulo,descrizione
from modulo
where CFU='9';

/*2. Mostrare matricola, nome e cognome dei docenti che hanno più di 40 anni*/
select matricola,nome as NomeDocente,cognome as Cognome docente
from docente
where Data_nascita<(1980/01/01); /*oppure where year(Data_nascita)<1980*/

/*.3. Mostrare nome,cognome e nome del dipartimento di ogni docente, ordinati dal più giovane al più anziano*/
select d.nome as NomeDocente,d.cognome as CognomeDocente,d.dipartimento as NomeDipartimento
from docente d
order by(Data_nascita) asc; /*possibilità di omettere asc*/

/*4.Mostrare città e indirizzo di ogni sede del dipartimento di codice "DIPPol"*/
/*FORMA IMPLICITA*/
select Citta as CittàSede,indirizzo as IndirizzoSede, Codice_dipartimento
from sede, sede_dipartimento
where Codice=Codice_sede and Codice_dipartimento='DIPPol';
/*FORMA ESPLICITA*/
select Citta as CittàSede,indirizzo as IndirizzoSede, Codice_dipartimento
from sede join sede_dipartimento on codice=Codice_sede
where Codice_dipartimento='DIPPol';

/*5.Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento,
ordinate alfabeticamente prima per nome dipartimento,
poi per nome città e infine per indirizzo.*/
/*FORMA IMPLICITA*/
select d.nome as NomeDipartimento, s.citta as CittàSede, s.indirizzo as IndirizzoSede
from sede s,sede_dipartimento,dipartimento d
where s.codice=Codice_sede and d.codice=Codice_dipartimento
order by d.nome,s.citta,s.indirizzo;
/*FORMA ESPLICITA*/
select d.nome as NomeDipartimento, s.citta as CittàSede, s.indirizzo as IndirizzoSede
from sede s join sede_dipartimento on s.codice=Codice_sede join dipartimento d on d.codice=Codice_dipartimento
order by d.nome,s.citta,s.indirizzo;

/*6.Mostrare il nome di ogni dipartimento che ha una sede a Roma.*/
select d.nome NomeDipartimento, s.citta as CittàSede
from sede s join sede_dipartimento on s.codice=Codice_sede join dipartimento d on d.codice=Codice_dipartimento
where s.citta='Roma';

/*7.Mostrare il nome di ogni dipartimento che non ha sede a Roma.*/
select d.nome NomeDipartimento, s.citta as CittàSede
from sede s join sede_dipartimento on s.codice=Codice_sede join dipartimento d on d.codice=Codice_dipartimento
where s.citta<>'Roma';
 /*
/*FORMA NIDIFICATA (RIVEDERE COME INSERIRE NELLA STAMPA ANCHE LA SEDE DI CIASCUN DIPARTIMENTO OTTENUTO)*/
select d.nome as NomeDipartimento
from dipartimento d
where d.codice in(select sd.codice_dipartimento
						from sede_dipartimento as sd
                        where sd.codice_sede not in(select s.codice
													                          from sede s
                                                    where s.citta='Roma'));
/*
/*8.Mostrare media, numero esami sostenuti e totale CFU acquisiti dello studente con matricola 101102.*/
/*FORMA IMPLICITA*/
select avg(voto) as MediaVoti,count(*),sum(CFU)
from esame, modulo
where Codice_Modulo=Codice and Matricola_studente='101102';
/*FORMA ESPLICITA*/
select avg(voto) as MediaVoti,count(*),sum(CFU)ù
from esame join modulo on Codice_Modulo=Codice
where Matricola_studente='101102';

/*9.Mostrare nome, cognome, nome del corso di laurea, media e numero esami sostenuti
dello studente con matricola 101102.*/
select s.nome as NomeStudente,s.cognome as CognomeStudente, s.Corso_laurea as CorsoLaurea,
avg(voto) as MediaVoti,count(*) asNumEsami
from studente s join esame on matricola=Matricola_studente
where matricola='101102';

/*10.Mostrare codice, nome e voto medio di ogni modulo, ordinati dalla media più alta alla più bassa.*/
select m.codice as CodiceModulo,m.Nome as NomeModulo, avg(e.voto)
from modulo m join esame e on e.Codice_Modulo=m.Codice
group by m.Nome,m.Codice
order by avg(e.voto) desc;

/*11.Mostrare nome e cognome del docente, nome e descrizione del modulo per ogni docente ed ogni
modulo di cui quel docente abbia tenuto almeno un esame; il risultato deve includere anche i docenti
che non abbiano tenuto alcun esame, in quel caso rappresentati con un'unica tupla in cui nome e descrizione
del modulo avranno valore NULL.*/
select d.nome as NomeDocente,d.cognome as CognomeDocente,
m.nome as NomeModulo,m.descrizione as DescrizioneModulo
from docente d left join esame e on d.matricola=e.Matricola_docente
left join modulo m on m.codice=e.Codice_Modulo;
/*oppure (ma non stampa uno dei docenti che non ha esami)*/ /*nidificata???*/
select d.nome as NomeDocente,d.cognome as CognomeDocente,m.nome as NomeModulo,m.descrizione as DescrizioneModulo, count(m.nome)
from docente d left join esame e on d.matricola=e.Matricola_docente left join modulo m on m.codice=e.Codice_Modulo
group by m.nome;

/*12.Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente.*/
select s.matricola,s.nome,s.cognome,s.Data_nascita, avg(s.voto)as MediaVoti,count(*) as EsamiSostenuti
from studente s join esame e on s.matricola=e.Matricola_studente
group by s.matricola;

/*13.Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente
del corso di laurea di codice "CLl8INF" che abbia media maggiore o uguale di 27.*/
select s.matricola,s.nome,s.cognome,s.Data_nascita, avg(e.voto)as MediaVoti,count(s.matricola) as EsamiSostenuti
from studente s join esame e on s.matricola=e.Matricola_studente join corso_laurea on corso_laurea.nome=s.Corso_Laurea
where Corso_Laurea.codice='CLl8INF'
group by s.matricola
having avg(e.voto)>=27;

/*FORMA NIDIFICATA (non corretta)
select s.matricola,s.nome,s.cognome,s.Data_nascita, avg(e.voto)as MediaVoti,count(s.matricola) as EsamiSostenuti
from esame e
where e.matricola_studente in (select s.matricola
								from studente s
								where avg(e.voto)>=27 and s.corso in(select corso_laurea.nome
																		from corso_laurea
                                    where corso_laurea.codice='CLl8INF'));*/
/*
(altra non corretta)
select s.matricola,s.nome,s.cognome,s.Data_nascita, avg(e.voto)as MediaVoti,count(s.matricola) as EsamiSostenuti
from studente s join esame e on s.matricola=e.Matricola_studente join corso_laurea on corso_laurea.nome=s.Corso_Laurea
where exists (select *
              from corso_laurea
              where corso_laurea.codice='CLl8INF' and avg(e.voto)>=27);*/
/* 14.Mostrare nome, cognome e data di nascita di tutti gli studenti che ancora non hanno superato nessun
 esame.*/
 /*FORMA NIDIFICATA*/
 select s.nome,s.cognome,s.Data_nascita
 from studente s
 where s.matricola not in (select e.Matricola_studente
                    from  esame e);

/*15.Mostrare la matricola di tutti gli studenti che hanno superato almeno un esame e che hanno preso
sempre voti maggiori di 29.*/
/*FORMA NIDIFICATA (POSSO USARE ANCHE "NOT IN")*/
select s.matricola
from studente s join esame e on s.matricola=e.Matricola_studente
where s.matricola <> all (select s.matricola
					from studente s join esame e on s.matricola=e.Matricola_studente
					where e.voto<=29);

/*NON NIDIFICATA (non riconosce EXCEPT)
select s.matricola
from studente s join esame e on s.matricola=e.Matricola_studente
except
select s.matricola
from studente s join esame e on s.matricola=e.Matricola_studente
where e.voto<=29; */

/*16.Mostrare, per ogni modulo, il numero degli studenti che hanno preso tra 18 e 21,
quelli che hanno preso tra 22 e 26 e quelli che hanno preso tra 27 e 30 (con un'unica interrogazione).*/
/*(NON EFFETTUATA POICHè NON CHIARA)*/

/*17.Mostrare matricola, nome, cognome e voto di ogni studente che ha preso un voto maggiore della media nel modulo "BDD"*/
/*(SE INSERISCO IL VOTO PER OGNI STUDENTE RISULTA ERRATO IL VOTO ASSOCIATO)*/
select s.matricola, s.nome, s.cognome
from studente s
where s.matricola in (select e.matricola_studente
						from esame e
                        where e.voto > (select avg(e1.voto)
										from esame e1
										where e1.codice_modulo='BdD'))
group by s.matricola;

/*(SE INSERISCO IL VOTO PER OGNI STUDENTE RISULTA ERRATO IL VOTO ASSOCIATO)*/
/*select s.matricola, s.nome, s.cognome, e.voto
from studente s join esame e on s.matricola=e.matricola_studente
where s.matricola in (select e.matricola_studente
						from esame e
                        where e.voto > (select avg(e1.voto)
										from esame e1
										where e1.codice_modulo='BdD'))
group by s.matricola; */

/*18.Mostrare matricola, nome, cognome di ogni studente che ha preso ad almeno 2 esami un voto maggiore
 della media per quel modulo*/
/*(ERRATA POICHè NON CHIARO IL CONTENUTO)
 SELECT s.matricola,s.nome,s.cognome, e.codice_modulo
 from studente s, esame e
 where s.matricola in(select e.matricola_studente
                       from esame e
                       where e.voto > (select avg(e1.voto)
                                       from esame e1
                                       where e1.codice_modulo =any(select m.codice
 																	from modulo m
                                                                     group by m.codice
                                     )))
 having count(s.matricola)>=2;*/


/*
