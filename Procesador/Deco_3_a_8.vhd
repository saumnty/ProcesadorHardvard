library IEEE;
use IEEE.std_logic_1164.all;

entity Deco_3_a_8 is
	port (
	S: in std_logic_vector (2 downto 0);
	a, b, c, d, e, f, g, h: out std_logic);
end Deco_3_a_8;
 
architecture Deco_3_a_8 of Deco_3_a_8 is
begin
	a <= not(S(2)) and not(S(1)) and not(S(0));
	b <= not(S(2)) and not(S(1)) and     S(0) ;
	c <= not(S(2)) and     S(1)  and not(S(0));
	d <= not(S(2)) and     S(1)  and     S(0) ;
	e <=     S(2)  and not(S(1)) and not(S(0));
	f <=     S(2)  and not(S(1)) and     S(0) ;
	g <=     S(2)  and     S(1)  and not(S(0));
	h <=     S(2)  and     S(1)  and     S(0) ;
end Deco_3_a_8;