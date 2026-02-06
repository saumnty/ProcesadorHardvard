library IEEE;
use IEEE.std_logic_1164.all;

entity NAND_b is
	port(
	a,b: in std_logic;
	r: out std_logic);
end NAND_b;

architecture NAND_b of NAND_b is

begin

r <= (not(a and b));

end NAND_b;