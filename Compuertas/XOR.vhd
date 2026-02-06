library IEEE;
use IEEE.std_logic_1164.all;

entity XOR_b is
	port(
	a,b: in std_logic;
	r: out std_logic);
end XOR_b;

architecture XOR_b of XOR_b is

begin

r <= ((not(a) and b)or(a and not(b)));

end XOR_b;