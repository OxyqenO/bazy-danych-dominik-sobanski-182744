#Zadanie 1 - Wyświetl imię i nazwisko każdego pracownika i jego rok urodzenia.
select imie, nazwisko, data_urodzenia from pracownik;

#Zadanie 2 - Wyświetl imię i nazwisko pracowników oraz ich wiek w latach 
#(bez uwzględniania miesiąca i dnia urodzenia).
Select imie, nazwisko, (year(now()) - year(data_urodzenia)) as wiek from pracownik;

#Zadanie 3 - Wyświetl nazwę działu i liczbę pracowników przypisanych do każdego z nich.
Select distinct d.nazwa ,count(p.dzial) from dzial d 
inner join pracownik p on d.id_dzialu=p.dzial
group by d.nazwa;

#Zadanie 4 - Wyświetl nazwę kategorii oraz liczbę produktów w każdej z nich.
select k.nazwa_kategori, sum(s.ilosc) from kategoria k 
inner join towar t on k.id_kategori=t.kategoria
inner join stan_magazynowy s on t.id_towaru=s.towar
group by k.nazwa_kategori;

#Zadanie 5 - Wyświetl nazwę kategorii i w kolejnej kolumnie listę wszystkich 
#produktów należącej do każdej z nich.
Select k.nazwa_kategori, group_concat(t.nazwa_towaru SEPARATOR ' | ') as lista_produktow from kategoria k 
inner join towar t on k.id_kategori=t.kategoria
group by k.nazwa_kategori;

#Zadanie 6 - Wyświetl średnie zarobki pracowników z zaokrągleniem do 2 miejsc
#po przecinku (funkcja round).
Select round(avg(pensja),2) from pracownik;

#Zadanie 7 - Wyświetl średnie zarobki pracowników, którzy pracują co najmniej od 5 lat.
Select avg(pensja) from pracownik where (now() - data_zatrudnienia) >=5;

#Zadanie 8 - Wyświetl 10 najczęściej sprzedawanych produktów *
#1 - Produkty najczęściej pojawiające się w zamówieniach zrealizowanych.
Select distinct nazwa_towaru from status_zamowienia sz
inner join zamowienie z on sz.id_statusu_zamowienia=z.status_zamowienia
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
inner join towar t on pz.towar=t.id_towaru
where sz.nazwa_statusu_zamowienia='zrealizowane'
group by nazwa_towaru
order by count(nazwa_towaru) desc
limit 10;

#2 - Najwięsza sumaryczna ilość danego produktu ze wszystkich zrealizowanych zamówień.
Select distinct t.nazwa_towaru, count(t.nazwa_towaru) as t_nazwa from status_zamowienia sz
inner join zamowienie z on sz.id_statusu_zamowienia=z.status_zamowienia
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
inner join towar t on pz.towar=t.id_towaru
where sz.nazwa_statusu_zamowienia='zrealizowane'
group by t.nazwa_towaru
order by t_nazwa desc
limit 10;


#Zadanie 9 - Wyświetl numer zamówienia, jego wartość (suma wartości wszystkich jego pozycji) 
#zarejestrowanych w pierwszym kwartale 2017 roku.
Select distinct z.numer_zamowienia, sum(pz.ilosc*pz.cena) as wartosc from status_zamowienia sz
inner join zamowienie z on sz.id_statusu_zamowienia=z.status_zamowienia
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
where sz.nazwa_statusu_zamowienia='zrealizowane'
and (
z.data_zamowienia like '2017-01-%' 
or z.data_zamowienia like '2017-02-%'
or z.data_zamowienia like '2017-03'
)
group by z.numer_zamowienia;

#Zadanie 10 - Wyświetl imie, nazwisko i sumę wartości zamówień, które dany pracownik dodał. 
#Posortuj malejąco po sumie.
select p.imie, p.nazwisko, sum(pz.ilosc*pz.cena) as wartosc from pracownik p
inner join zamowienie z on p.id_pracownika=z.pracownik_id_pracownika
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
group by p.id_pracownika
order by wartosc desc;

#Zadanie 11 - Wyświetl nazwę działu i minimalną, maksymalną i średnią wartość pensji 
#w każdym dziale.
select d.nazwa, min(p.pensja), max(p.pensja), avg(p.pensja) from dzial d
inner join pracownik p on d.id_dzialu=p.dzial
group by d.nazwa;

#Zadanie 12 - Wyświetl pełną nazwę klienta, wartość zamówienia dla 10 
#najwyższych wartości zamówienia.
select k.pelna_nazwa, (ilosc*cena) as wartosc from klient k
inner join zamowienie z on k.id_klienta=z.klient
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
order by wartosc desc
limit 10;

#Zadanie 13 - Wyświetl wartość przychodu dla każdego roku. Dane posortuj 
#malejąco według sumy wartości zamówień.


#Zadanie 14 - Wyświetl sumę wartości wszystkich anulowanych zamówień.

#Zadanie 15 - Wyświetl liczbę zamówień i sumę zamówień dla każdego 
#miasta z podstawowego adresu klientów.

#Zadanie 16 - Wyświetl dotychczasowy dochód firmy biorąc pod uwagę 
#tylko zamówienia zrealizowane.

#Zadanie 17 - Policz i wyświetl dochód (przychód z zamówień - cena zakupu towaru)
# w każdym roku działalności firmy.

#Zadanie 18 - Wyświetl wartość aktualnego stanu magazynowego z podziałem na kategorię produktów.

#Zadanie 19 - Przygotuj zapytanie, które wyświetli dane w poniższej postaci 
#(policz ilu pracowników urodziło się w danym miesiącu - uwaga na porządek sortowania).

#Zadanie 20 - Wyświetl imię i nazwisko pracownika i koszt jaki 
#poniósł pracodawca od momentu jego zatrudnienia.



