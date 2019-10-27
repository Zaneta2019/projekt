# Obsługa bazy danych pracowników Urzędu Skarbowego.

import pymysql

# połączenie  z bazą danych
conn = pymysql.connect('localhost', 'root', 'Julia1234', 'us')

c = conn.cursor()


# ## Logowanie
class DataBaseManager:
    def __init__(self):
         self.id_dp = None

    def login_user(self, login, password):
        id_dp = self.check_password(login, password)
        if id_dp is not None:
            self.id_dp = id_dp
        else:
            return ConnectionRefusedError('bad password')




# wybranie istniejącej bazy
# cur.execute('use baza_us')

# zapytanie o tabele bazy

c.execute('show tables')

# wypisanie całej zawartości bazy
print (c.fetchall())


# wypisanie 3 rekordu(tabeli)
# print (c.fetchall()[2][0])

# wyświetlanie nazw pracowników o id=1

c.execute('select * from dane_pracownikow where id_dp=1')

# wprowadzenie danych do bazy
c.execute("insert into zadania  values (default, 'from script','2020-01-01',1)")
conn.commit()


#aktualizacja danych w bazie
c.execute('update dane_pracownikow set dzial=referat')

# zmiana nazwy tabeli
c.execute('alter table logowanie rename as Logowanie_1')

# funkcja usuwająca  użytkownika po id

def deleteUserById(self, id):
    try:
         sql = "DELETE FROM Dane_praownikow WHERE id = %s"
         self.coursor.execute(sql, id)
    except:
         print("błąd danych!")


# import modułów pkietu os pozwalającego na operacje na plikach i katalogach

from os import *


# stworzenie i otwarcie do zapisu pliku dane_urzedu.txt w aktualnym katalogu dyskowym

F = open ("dane_urzedu.txt", "w+")

# import biblioteki pandas, import danych z zewnętrznych źródeł- csv

import pandas as pd

df = pd.read_csv('~/Downloads/baza_pracownikow.csv')

print(df)


# import biblioteki matplotlib- moduł pyplot i biblioteka numpy- genrowanie wykresu

import pylab

import pylab
x = [1,2,]
y = [0,1]
pylab.plot(x,y)
pylab.show()




