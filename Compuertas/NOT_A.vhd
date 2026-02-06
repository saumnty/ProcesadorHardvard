library IEEE;
use IEEE.std_logic_1164.all;

entity NOT_A is
	port(
	a: in std_logic;
	r: out std_logic);
end NOT_A;

architecture NOT_A of NOT_A is

begin

r <= (not(a));

end NOT_A;