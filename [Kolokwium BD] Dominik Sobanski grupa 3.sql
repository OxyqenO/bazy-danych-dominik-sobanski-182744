
#zadanie 3.a
create table benefit(
	id_benefitu int auto_increment primary key,
    nazwa varchar(30) not null,
    cena float,
    opis char(255),
    rodzaj enum('lekarz','sport','przedszkole')
);

#zadanie 3.b
create table uzytkownik(
	id_uzytkownika float auto_increment primary key,
    rodzaj enum('pracownik','prezes','rodzina') default 'pracownik',
    imie varchar(32) not null,
    nazwisko varchar(20) not null,
    dataur date,
    id_benefitu int,
    
    foreign key (id_benefitu) references benefit(id_benefitu)
);

#zadanie 5
insert into benefit values((select idZasobu from wikingowie.zasob),(select nazwa from wikingowie.zasob), (select waga from wikingowie.zasob), 'brak', 2);

#zadanie 6
alter table uzytkownik modify rodzaj enum('pracownik','kierownik','szef','prezes') default 'prezes';

#zadanie 7
update benefit set nazwa = 'Granie' 
where nazwa like ('%an%'); 

#zadanie 8 
update benefit 
where cena > 76;

#zadanie 9.a
select * from zawodnik z where klub is not null and year(dataUrodzenia) >= 1985 and year(dataUrodzenia) <= 1999
order by dataUrodzenia asc
limit 3;

#zadanie 9.b
select distinct(k.idKraju), k.nazwa as Kraj, count(z.idZawodnika) as LiczbaZawodnikow from zawodnik z 
inner join kraj k on z.idKraju=k.idKraju
where year(z.dataUrodzenia) >= 1990 and year(z.dataUrodzenia) <= 1999
group by k.idKraju;

#zadanie 9.c
#średnie czasy z biegania, dla poszczególnych zawodów, jeśli w zawodach brało udział co najmniej 4 zawodników
select distinct(k.idKonkurencji), k.nazwaKonkurencji, time(sum(w.wynik)/count(w.idKonkurencji)) as sredni_czas from wyniki w
inner join zawodnik z on w.idZawodnika=z.idZawodnika
inner join konkurencja k on w.idKonkurencji=k.idKonkurencji
group by k.idKonkurencji;

#zadanie 9.d
select distinct(year(dataUrodzenia)), group_concat(imie, nazwisko separator ' | ') from zawodnik
group by year(dataUrodzenia);

#zadanie 9.e
select distinct(z.idZawodnika), z.imie, z.nazwisko, (count(w.idKonkurencji)/3) as liczba_zawodow from zawodnik z 
inner join wyniki w on z.idZawodnika=w.idZawodnika
group by z.idZawodnika;

#zadanie 9.f
select k.nazwa, k.idKraju from kraj k 
join miejsce_zawodow m on k.idKraju=m.idKraju
where k.idKraju!=m.idKraju;

#zadanie 9.g
select count(m.idKraju) as ilosc, k.nazwa from kraj k
inner join miejsce_zawodow m on k.idKraju=m.idKraju
where ilosc = 1
group by m.idKraju
order by k.nazwa asc;




