library IEEE;
use IEEE.std_logic_1164.all;

entity Deco_2_a_4 is
	port (
	S: in std_logic_vector (1 downto 0);
	a, b, c, d: out std_logic);
end Deco_2_a_4;
 
architecture Deco_2_a_4 of Deco_2_a_4 is
begin
	a <= not(S(1)) and not(S(0));
	b <= not(S(1)) and     S(0);
	c <=     S(1)  and not(S(0));
	d <=     S(1)  and     S(0);
end Deco_2_a_4;