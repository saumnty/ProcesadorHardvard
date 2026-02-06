--Multiplexor 2 a 1
--Se tienen a y b entradas de datos, y s de 
--seleccion. La salida es r.

library IEEE;
use IEEE.std_logic_1164.all;

entity Mux2a1 is
	port (
	a, b, s: in std_logic;
	r: out std_logic);
end Mux2a1;
 
architecture Ar_Mux2a1 of Mux2a1 is
begin
	r <= (a and not(s)) or (b and s);
end Ar_Mux2a1;