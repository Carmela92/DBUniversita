use universita;

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values('999999','Sci','888888','2017/07/2','18','',null);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
	values ('115555','Sci',NULL);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101105','Lingue Straniere','Barbara','Gemelli','1992/12/26','BRBGLL92H66L049F',null);
