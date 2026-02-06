library IEEE;
use IEEE.std_logic_1164.all;

entity OR_b is
	port(
	a,b: in std_logic;
	r: out std_logic);
end OR_b;

architecture OR_b of OR_b is

begin

r <= (a or b);

end OR_b;