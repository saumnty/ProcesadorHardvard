library IEEE;
use IEEE.std_logic_1164.all;

entity NXOR_b is
	port(
	a,b: in std_logic;
	r: out std_logic);
end NXOR_b;

architecture NXOR_b of NXOR_b is

begin

r <= (not((not(a) and b)or(a and not(b))));

end NXOR_b;