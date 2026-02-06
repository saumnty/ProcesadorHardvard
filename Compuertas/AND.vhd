library IEEE;
use IEEE.std_logic_1164.all;

entity AND_b is
	port(
	a,b: in std_logic;
	r: out std_logic);
end AND_b;

architecture AND_b of AND_b is

begin

r <= (a and b);

end AND_b;