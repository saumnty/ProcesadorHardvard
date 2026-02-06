library IEEE;
use IEEE.std_logic_1164.all;

entity FA is
	port (a, b, ci: in std_logic;
	r, co: out std_logic);
end FA;

architecture Ar_FA of FA is
begin
	co <= (a and ci) or (a and b) or (b and ci);
	r <= (a and not(b) and not(ci)) or (not(a) and not(b) and ci) or (a and b and ci) or (not(a) and b and not(ci));
end Ar_FA;
 
 
 