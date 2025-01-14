#zadanie 1 
create table student(
	id_studenta int unsigned primary key auto_increment,
    imie varchar(100) not null,
    nazwisko varchar(100) not null,
    rok_studiow int unsigned,
    data_urodzenia date
);

#zadanie 2
create table kierunek(
	id_kierunku int unsigned primary key auto_increment,
    nazwa_kierunku varchar(200) not null
);


#zadanie 3
create table student_na_kierunku(
	student int unsigned,
    kierunek int unsigned,
    
    primary key (student, kierunek),
    foreign key (student) references student(id_studenta),
    foreign key (kierunek) references kierunek(id_kierunku)
);

#zadanie 4
create table przedmiot(
	id_przedmiotu int not null primary key auto_increment,
    nazwa_przedmiotu varchar(200) not null,
    opis varchar(100)
);

#zadanie 5 
create table kierunek_has_przedmioty(
	kierunek int unsigned,
    przedmiot int not null,
    obowiazkowy binary default 1,
    
    primary key (kierunek, przedmiot),
    foreign key (kierunek) references kierunek(id_kierunku),
    foreign key (przedmiot) references przedmiot(id_przedmiotu)
);

#zadanie 6

#tabela student - 4 rekordy
insert into student values
(default, 'Adam', 'Kowalski', 2024, '2004-01-12'),
(default, 'Marek', 'Marucha', 2024, '2003-06-23'),
(default, 'Julia', 'Marchewska', 2024, '2003-07-13'),
(default, 'Amelia', 'Kolanko', 2024, '2004-11-01');

#tabela kierunek - 2 rekordy
insert into kierunek values
(default, 'Informatyka'),
(default, 'Matematyka');

#tabela student_na_kierunku - przypisz wszystkich studentów do jakiegoś kierunku
insert into student_na_kierunku values
(1, 1),
(2, 2),
(3, 1),
(4, 2);

#tabela przedmiot - 4 rekordy, przynajmniej jeden przedmiot nieobowiązkowy
insert into przedmiot values
(default, 'Bazy Danych', 'Obowiazkowy'),
(default, 'Repetytorium Matematyki', 'Obowiazkowy'),
(default, 'W-F', 'Nie Obowiazkowy'),
(default, 'Programowanie', 'Obowiazkowy');

#tabela kierunek_has_przedmioty - przypisz wszystkie przedmioty do dowolnych kierunków
insert into kierunek_has_przedmioty values
(1, 1, 1),
(1, 2, 1),
(1, 3, 0),
(1, 4, 1),

(2, 1, 0),
(2, 2, 1),
(2, 3, 1),
(2, 4, 0);

#zadanie 7 
alter table przedmiot modify column opis varchar(100) default 'Brak opisu';

#zadanie 8
alter table student 
add indeks int unsigned not null,
drop primary key,
add primary key (id_studenta, indeks);

#zadanie 9
alter table kierunek_has_przedmioty
add semestr char(20) not null,
add rok_studiow int unsigned not null;

update kierunek_has_przedmioty set 
semestr = "2024Z", rok_studiow = 1 where kierunek = 1;

update kierunek_has_przedmioty set 
semestr = "2024L", rok_studiow = 2 where kierunek = 2;

#zadanie 10
select s.indeks, s.imie, s.nazwisko, k.nazwa_kierunku, kp.semestr, p.nazwa_przedmiotu
from student s inner join student_na_kierunku snk on s.id_studenta=snk.student
inner join kierunek k on snk.kierunek=k.id_kierunku
inner join kierunek_has_przedmioty kp on k.id_kierunku=kp.kierunek
inner join przedmiot p on kp.przedmiot=p.id_przedmiotu;