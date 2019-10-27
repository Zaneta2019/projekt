
### baza danych pracowników Urzędu Skarbowego
create database US default character set utf8 collate utf8_polish_ci;

use US;
select database();
create table Logowanie(
id_log int primary key auto_increment,
login_email varchar(55) unique not null,
haslo varchar(55) not null,
plec enum ('M','K') not null
);
create table Dane_pracownikow(
id_dp int primary key auto_increment,
imie varchar(30) not null,
nazwisko varchar(55) not null,
dzial varchar(150) not null,
data_urodzenia date not null
);


create table Zadania(
id_z int primary key auto_increment,
nazwa_zadania varchar(150) not null,
termin_wykonania datetime not null
);
### wprowadzenie przykłądowych danych do tabel

insert into logowanie values (default, 'aaa@bbb.pl', 'aaabbc123','K');
insert into logowanie values (default, 'bbb@ccc.pl', 'bbbccd123', 'K');
insert into logowanie values (default, 'ccc@ddd.pl', 'cccdde123','M');

insert into Dane_pracownikow values 
(default, 'Julia', 'Nowakowska', 'Referat_obslugi_bezposredniej', '2000-04-13'),
(default, 'Anna', 'Szymczak', 'Referat_rachunkowosci', '1956-10-13'),
(default, 'Jan', 'Kowalski', 'Referat_Czynnosci_analitycznych', '2000-11-03');

alter table zadania modify termin_wykonania date not null;

insert into Zadania values 
(default, 'napisanie_protokolow', '2019-08-28'),
(default, 'wyslanie_listu','2019-08-30'),
(default, 'wezwanie_petenta','2019-10-01');
show tables;
describe logowanie;
describe dane_pracownikow;
describe zadania;


alter table zadania add id_dp int;

### tworzenie relacji pomiędzy tabelami
alter table zadania add constraint dp_id_dp foreign key(id_dp) references dane_pracownikow(id_dp);
alter table dane_pracownikow add id_z int;
alter table dane_pracownikow add constraint zd_id_z foreign key(id_z) references zadania(id_z);

alter table dane_pracownikow add id_log int;
alter table dane_pracownikow add constraint log_id_log foreign key(id_log) references logowanie(id_log);

describe logowanie;
describe dane_pracownikow;


### utworzenie zapytań, które będę chciała wykonać w Pythonie

select * from logowanie;
select * from zadania;
select * from dane_pracownikow where imie='Jan';
select md5(haslo) from logowanie;
select * from logowanie where id_log=1 and plec='K';

### utworzenie widoków ułatwiających wyświetlanie ważnych informacji

create or replace view ukryte_hasla as select  md5(haslo) from logowanie;

create or replace view zadania_pracownikow as select nazwa_zadania,termin_wykonania from zadania;

select * from ukryte_hasla;
select * from zadania_pracownikow;
select database();
