use universita;

insert into sede(Codice,Indirizzo,Citta)
	values(null,'Via Siliberto','Taranto');

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values('999999','Sci','888888','2017/07/2','18','',null);

insert into esame(Matricola_studente,Codice_Modulo,Matricola_docente,Data_esame,Voto,Lode,Note)
	values('129128','Eco','567809','2017/07/2','8','',null);

insert into sede_dipartimento(Codice_sede,Codice_dipartimento,Note)
	values ('115555','Sci',NULL);

insert into studente(Matricola, Corso_laurea, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('101105','Lingue Straniere','Barbara','Gemelli','1992/12/26','BRBGLL92H66L049F',null);

insert into docente(Matricola, Dipartimento, Nome, Cognome, Data_nascita, Codice_fiscale, Foto)
	values ('567899','Sistemi giuridici','Marianna','Soliberto','1970/05/13','SLBMNN92H63L049C',null);
