library IEEE;
use IEEE.std_logic_1164.all;

entity NOT_B is
	port(
	b: in std_logic;
	r: out std_logic);
end NOT_B;

architecture NOT_B of NOT_B is

begin

r <= (not(b));

end NOT_B;