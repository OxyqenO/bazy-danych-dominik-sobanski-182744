#zadanie 1.1
select nazwisko from pracownik order by nazwisko asc;

#zadanie 1.2
select imie, nazwisko, pensja from pracownik where data_urodzenia > '1979-12-12';

#zadanie 1.3
select * from pracownik where pensja between 3500 and 5000;

#zadanie 1.4
select * from stan_magazynowy where ilosc > 10;

#zadanie 1.5
select * from towar where nazwa_towaru like 'A%' or nazwa_towaru like 'B%' or nazwa_towaru like 'C%';
 
#zadanie 1.6
select id_klienta, nip, pelna_nazwa, nazwa_krotka from klient;

#zadanie 1.7
select * from zamowienie order by data_zamowienia desc limit 10; 

#zadanie 1.8
select * from pracownik order by pensja asc limit 5;

#zadanie 1.9
select * from towar where nazwa_towaru not like '%a%' order by cena_zakupu desc limit 10;

#zadanie 1.10
select * from towar t 
inner join stan_magazynowy s on t.id_towaru=s.towar
inner join jednostka_miary j on s.jm=j.id_jednostki
where j.nazwa = 'szt'
order by t.nazwa_towaru asc, t.cena_zakupu desc;

#zadanie 1.11
create table towary_powyzej_100 select * from towar where cena_zakupu >= 100;

#zadanie 1.12
create table pracownik_50_plus like pracownik;
insert into pracownik_50_plus select * from pracownik where (now() - data_urodzenia) >= 50;



#zadanie 2.1
select p.imie, p.nazwisko, d.nazwa from pracownik p
inner join dzial d on p.dzial=d.id_dzialu;
 
#zadanie 2.2
select t.nazwa_towaru, k.nazwa_kategori, s.ilosc from kategoria k
inner join towar t on k.id_kategori=t.kategoria
inner join stan_magazynowy s on t.id_towaru=s.towar
order by s.ilosc desc;

#zadanie 2.3
select z.*, s.nazwa_statusu_zamowienia from zamowienie z 
inner join status_zamowienia s on z.status_zamowienia=s.id_statusu_zamowienia
where s.nazwa_statusu_zamowienia='anulowane';

#zadanie 2.4
select k.*, a.miejscowosc from klient k 
inner join adres_klienta a on k.id_klienta=a.klient
where a.miejscowosc='Olsztyn';

#zadanie 2.5 - do poprawy
select j.nazwa from jednostka_miary j
left join stan_magazynowy s on j.id_jednostki=s.jm
where s.jm is null
group by j.nazwa;

#zadanie 2.6
select z.numer_zamowienia, t.nazwa_towaru, p.ilosc, p.cena from zamowienie z
inner join pozycja_zamowienia p on z.id_zamowienia=p.zamowienie
inner join towar t on p.towar=t.id_towaru
where z.data_zamowienia like '2018-%-%';

#zadanie 2.7
create table towary_full_info(
	nazwa_towaru varchar(255),
    cena_zakupu decimal(7,2),
    kategoria char(255),
    ilosc decimal(7,2),
    jednoska_miary varchar(255)
);
#zadanie 2.8
select p.* from zamowienie z 
inner join pozycja_zamowienia p on z.id_zamowienia=p.zamowienie
order by (now()-z.data_zamowienia) asc
limit 5;

#zadanie 2.9
select * from zamowienie z 
inner join status_zamowienia s on z.status_zamowienia=s.id_statusu_zamowienia
where s.nazwa_statusu_zamowienia!='zrealizowane';

#zadanie 2.10
select * from adres_klienta
where kod not like '__-___';
