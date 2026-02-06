library IEEE;
use IEEE.std_logic_1164.all;

entity NOR_b is
	port(
	a,b: in std_logic;
	r: out std_logic);
end NOR_b;

architecture NOR_b of NOR_b is

begin

r <= (not(a or b));

end NOR_b;