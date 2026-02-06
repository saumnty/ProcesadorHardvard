library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4a1 is
	port (
	a, b, c, d: std_logic;
	S: in std_logic_vector (1 downto 0);
	r: out std_logic);
end Mux4a1;
 
architecture Ar_Mux4a1 of Mux4a1 is
begin
	r <= (a and not(S(1)) and not (S(0))) or 
		(b and not(S(1)) and      S(0) ) or 
        (c and     S(1)  and not (S(0))) or 
        (d and     S(1)  and      S(0) );   
end Ar_Mux4a1;