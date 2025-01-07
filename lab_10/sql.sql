#Zadanie 1 - Wyświetl imię i nazwisko każdego pracownika i jego rok urodzenia.
select imie, nazwisko, data_urodzenia from pracownik;

#Zadanie 2 - Wyświetl imię i nazwisko pracowników oraz ich wiek w latach 
#(bez uwzględniania miesiąca i dnia urodzenia).
Select imie, nazwisko, (year(now()) - year(data_urodzenia)) as wiek from pracownik;

#Zadanie 3 - Wyświetl nazwę działu i liczbę pracowników przypisanych do każdego z nich.

#Zadanie 4 - Wyświetl nazwę kategorii oraz liczbę produktów w każdej z nich.

#Zadanie 5 - Wyświetl nazwę kategorii i w kolejnej kolumnie listę wszystkich 
#produktów należącej do każdej z nich.

#Zadanie 6 - Wyświetl średnie zarobki pracowników z zaokrągleniem do 2 miejsc
#po przecinku (funkcja round).

#Zadanie 7 - Wyświetl średnie zarobki pracowników, którzy pracują co najmniej od 5 lat.