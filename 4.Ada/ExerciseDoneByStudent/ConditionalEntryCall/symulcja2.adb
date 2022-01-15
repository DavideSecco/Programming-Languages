with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;


procedure symulacjaID is
   
   ----BLOK DEKLARACJI ZMIENNYCH GLOBALNYCH----
   --okreslenie liczby producentow i konsumentow
   Liczba_Producentow: constant Integer := 5;
   Liczba_Konsumentow: constant Integer := 2; 
  
   subtype Typ_Producenta is Integer range 1 .. Liczba_Producentow;   
   subtype Typ_Konsumenta is Integer range 1 .. Liczba_Konsumentow;
   
   --do kazdego producenta przypisany jest wyrob, ktory jest przez niego wytwarzany
   Nazwa_Wyrobu: constant array (Typ_Producenta) of String(1 .. 7):= ("Chleb  ", "Hummus ", "Szynka ", "Ser    ", "Pomidor");
   
   ----BLOK DEKLARACJI ZADAN----
   task type Producent is 
      -- Producent rozpoczyna dzialalnosc
      entry Zacznij(Numer_Producenta: in Typ_Producenta);
   end Producent;

   -- Konsument pobiera z Bufora dowolny zestaw skladajacy sie z wyrobow
   task type Konsument is
      -- Konsument rozpoczyna dzialalnosc
      entry Zacznij(Numer_Konsumenta: in Typ_Konsumenta);
   end Konsument;

   -- Bufor przyjmuje wyroby od producentow i wydaje produkty dla konsumentow
   task type Bufor is
      -- Przyjmij wyrob do magazynu, o ile jest miejsce i zwroc informacje o sukcesie
      entry Przyjmij(Wyrob: in Typ_Producenta; Numer: in Integer; Czy_Przyjeto: out Boolean);
      -- Wydaj zestaw z magazynu, o ile sa czesci (wyroby) i zwroc informacje o sukcesie
      entry Wydaj(Nr_Konsumenta: in Typ_Konsumenta; Czy_Wydano: out Boolean);
   end Bufor;
   
   
   P: array ( 1 .. Liczba_Producentow ) of Producent;
   K: array ( 1 .. Liczba_Konsumentow ) of Konsument;
   B: Bufor;
   
   ----BLOK DEFINICJI ZADAN----
   
   ----PRODUCENT----
   task body Producent is
      subtype Zakres_Czasu_Produkcji is Integer range 3 .. 6;
      package Losowa_Produkcja is new Ada.Numerics.Discrete_Random(Zakres_Czasu_Produkcji);
      G: Losowa_Produkcja.Generator;	--  generator liczb losowych     
      Numer_Wyrobu: Integer;   -- licznik wyrobow danego producenta
      Nr_Producenta: Typ_Producenta; 
      Przyjeto: Boolean;
      
   begin
      accept Zacznij(Numer_Producenta: in Typ_Producenta) do
         Losowa_Produkcja.Reset(G);	--  zacznij generator liczb losowych
         Numer_Wyrobu := 1;
         Nr_Producenta := Numer_Producenta;  -- przekazanie argumentu do zmiennej lokalnej
      end Zacznij;
      
      Put_Line("P: Zaczeto producenta" & Integer'Image(Nr_Producenta) &", ktory produkuje wyrob: " & Nazwa_Wyrobu(Nr_Producenta));
      loop
         delay Duration(Losowa_Produkcja.Random(G)); --  symulacja produkcji
         Put_Line("P: Wyprodukowano wyrob " & Nazwa_Wyrobu(Nr_Producenta)
                  & " numer "  & Integer'Image(Numer_Wyrobu));         
        
         ----
         --w tym miejscu probujemy wstawic wyrob do magazynu
         --WYBIERZ ODPOWIEDNIE SPOTKANIE ORAZ SPRAWDZ, CZY PRZYJETO WYROB
         ----         
         loop
            select
                 B.Przyjmij(Nr_Producenta, Numer_Wyrobu, Przyjeto);
                 Numer_Wyrobu := Numer_Wyrobu + 1;

                 if Przyjeto = True then
                    Put_Line("Producent: Przyjeto");
                    exit;
                else 
                    Put_Line("Producent: Nie udalo sie przyjac");
                end if;
            else
                Put_Line("BUFOR: Bufor jest zajety, poczekaj 5s.");
                delay 5.0;
            end select;
         end loop;
                  
        -- Numer_Wyrobu := Numer_Wyrobu + 1;
             
      end loop;
   end Producent;
   
   
   ----KONSUMENT----
   task body Konsument is
      subtype Zakres_Czasu_Konsumpcji is Integer range 4 .. 8;
      package Losowa_Konsumpcja is new Ada.Numerics.Discrete_Random(Zakres_Czasu_Konsumpcji);
      G: Losowa_Konsumpcja.Generator;	--  generator liczb losowych (czas)     
      Nr_Konsumenta: Typ_Konsumenta;
      Wydano: Boolean;    
                  
   begin
      accept Zacznij(Numer_Konsumenta: in Typ_Konsumenta) do
	      Losowa_Konsumpcja.Reset(G);	--  zacznij generator liczb losowych
	      Nr_Konsumenta := Numer_Konsumenta;  -- przekazanie argumentu do zmiennej lokalnej	
      end Zacznij;
      
      Put_Line("K: Zaczeto konsumenta " &Integer'Image(Nr_Konsumenta));
      loop
	 delay Duration(Losowa_Konsumpcja.Random(G)); --  symulacja konsumpcji
	 
	 ----
         --w tym miejscu probujemy pobrac gotowy produkt z magazynu
         --WYBIERZ ODPOWIEDNIE SPOTKANIE ORAZ SPRAWDZ, CZY WYDANO PRODUKT
         ----    
         
         loop 
            select 
                B.Wydaj(Nr_Konsumenta, Wydano);            
                if Wydano = True then
                    Put_Line("Wydano");
                    exit;
				 else 
                    Put_Line("Nie udalo sie wydac");
                end if;	
            else
                Put_Line("BUFOR: brakuje skladnikow");
                delay 10.0;    
            end select;
        end loop;
      end loop;
   end Konsument;
   
   
   ----BUFOR----
   wyjatek: exception;
   task body Bufor is
      Pojemnosc_Magazynu: constant Integer := 30;
      type Polki_Magazynu is array (Typ_Producenta) of Integer;
      Magazyn: Polki_Magazynu:= (0, 0, 0, 0, 0);
      Zestaw: array(Typ_Producenta) of Integer:= (2, 1, 2, 1, 2);
      Numer_Zestawu: Integer := 1;	
      W_Magazynie: Integer := 0;
      
      
      procedure Sklad_Magazynu(Mag: Polki_Magazynu) is         
      begin
         for W in Typ_Producenta loop
            Put_Line("|   Sklad magazynu: " & Integer'Image(Mag(W)) & " "
                     & Nazwa_Wyrobu(W));
         end loop;
         Put_Line("|   Liczba wyrobow w magazynie: " & Integer'Image(W_Magazynie));
      end Sklad_Magazynu;


      ----
      --Funkcja Mozna_Przyjac przeciwdziala zakleszczeniu procesow
      --jednak wydajnosc programu spada, gdy magazyn wypelnia sie wyrobami, na ktore jest mniejsze zapotrzebowanie (zobacz sklad zestawu)
      --
      --ZAPROPONUJ SWOJE ROZWIAZANIE DLA TEJ SYTUACJI PASUJACE DO WYBRANEJ DZIEDZINY ZADANIA
      ----

      function Mozna_Przyjac(Wyrob: Typ_Producenta) return Boolean is
	      Wolne: Integer;		--  wolne miejsce w magazynie	 
	      -- ile brakuje wyrobow w magazynie do produkcji zestawu
	      Brak: array(Typ_Producenta) of Integer;
	      -- ogolna liczba brakow	
         Braki: Integer := 0;
         
      begin
         if Magazyn(wyrob) >=6 then
            raise wyjatek;
            return false;
         end if;
         
         if W_Magazynie >= Pojemnosc_Magazynu then
            raise wyjatek;
            return False;  -- od razu odrzucany, gdy magazym jest przepelniony
         else
            Wolne := Pojemnosc_Magazynu - W_Magazynie;           

            for W in Typ_Producenta loop
               Brak(W) := Zestaw(W) - Magazyn(W);
               if Brak(W) > 0 then 
                     Braki := Braki + Brak(W);
               end if;
            end loop;               
         
            --jesli magazyn jest bliski przepelnienia, a wyrob nie jest na liscie brakujacych wyrobow, to go odrzucamy
            if W_Magazynie+Braki >= Pojemnosc_Magazynu and Brak(Wyrob) <= 0 then                
               return False;            
            end if;            
         end if; 

         return True;
      end Mozna_Przyjac;

      function Mozna_Wydac return Boolean is
      begin
	      for W in Typ_Producenta loop
	         if Magazyn(W) < Zestaw(W) then
	             return False;
	         end if;
         end loop;         
	      return True;
      end Mozna_Wydac;
    

   begin
      Put_Line("B: Zaczeto Bufor");
      loop
        
         ---- 
         -- TU UMIESC SPOTKANIE SELEKTYWNE 
         ----
         select
            accept Przyjmij(Wyrob: in Typ_Producenta; Numer: in Integer; Czy_Przyjeto: out Boolean) do
               Put_Line("B: ZAAKCEPTOWANO PRZYJMIJ DLA PRODUKTU "  & Nazwa_Wyrobu(Wyrob) & " NR " & Integer'Image(Numer));
               
               if Mozna_Przyjac(Wyrob) then
                  Put_Line("B: Przyjeto wyrob " & Nazwa_Wyrobu(Wyrob) & " nr " & Integer'Image(Numer));
                  Magazyn(Wyrob) := Magazyn(Wyrob) + 1;
                  W_Magazynie := W_Magazynie + 1;
                  Czy_Przyjeto := True;
               else
                  Put_Line("B: Odrzucono wyrob " & Nazwa_Wyrobu(Wyrob) & " nr " & Integer'Image(Numer)); 
                  Czy_Przyjeto := False;
               end if;
         
            exception
               when Wyjatek => Put_Line("BUFOR: Nie przyjeto wyrobu, bufor pelny!");
            
            end Przyjmij;
            
            Sklad_Magazynu(Magazyn);
               
         or    
            accept Wydaj(Nr_Konsumenta: in Typ_Konsumenta; Czy_Wydano: out Boolean) do
               Put_Line("B: ZAAKCEPTOWANO WYDAJ ZESTAW DLA KONSUMENTA NR " & Integer'Image(Nr_Konsumenta));
               Sklad_Magazynu(Magazyn);
               
               if Mozna_Wydac then
                  Put_Line("B: Wydano zestaw produktow nr " & Integer'Image(Numer_Zestawu));               
                  
                  for W in Typ_Producenta loop
                     Magazyn(W) := Magazyn(W) - Zestaw(W);
                     W_Magazynie := W_Magazynie - Zestaw(W);
                  end loop;

                  Numer_Zestawu := Numer_Zestawu + 1;
                  Czy_Wydano := True;
               else
                  Put_Line("B: Brak czesci dla zestawu");	
                  Czy_Wydano := False;
            end if;
         end Wydaj;
                  
            Sklad_Magazynu(Magazyn); 
                  
         end select;
      end loop;
   end Bufor;
   
begin
   for I in 1 .. Liczba_Producentow loop
      P(I).Zacznij(I);
   end loop;
   for J in 1 .. Liczba_Konsumentow loop
      K(J).Zacznij(J);
   end loop;
   
end symulacjaID;