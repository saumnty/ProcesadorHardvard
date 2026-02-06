library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8a1 is
	port (
	a, b, c, d, e, f, g, h: std_logic;
	S: in std_logic_vector (2 downto 0);
	r: out std_logic);
end Mux8a1;
 
architecture Mux8a1 of Mux8a1 is
begin
	r <= ((a and not(S(2)) and not (S(1)) and not(S(0))) or
		(b and not(S(2)) and not(S(1)) and S(0)) or
		(c and not(S(2)) and S(1) and not(S(0))) or
		(d and not(S(2)) and S(1) and S(0)) or
		(e and S(2) and not(S(1)) and not(S(0))) or
		(f and S(2) and not(S(1)) and S(0)) or
		(g and S(2) and S(1) and not(S(0))) or
		(h and S(2) and S(1) and S(0)));   
end Mux8a1;