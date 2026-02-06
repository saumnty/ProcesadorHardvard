library IEEE;
use IEEE.std_logic_1164.all;

entity Comparador is
	port(
	A,B: in std_logic_vector (7 downto 0);
	CMP: out std_logic);
end Comparador;

architecture Comparador of Comparador is

begin

CMP <= (not((A(0) xor B(0)) or (A(1) xor B(1)) or (A(2) xor B(2)) or (A(3) xor B(3)) or (A(4) xor B(4)) or (A(5) xor B(5)) or (A(6) xor B(6)) or (A(7) xor B(7))));

end Comparador;