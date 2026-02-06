library IEEE;
use IEEE.std_logic_1164.all;

entity NOT_B_8bits is
	port(
	B: in std_logic_vector (7 downto 0);
	R8: out std_logic_vector (7 downto 0));
end NOT_B_8bits;

architecture NOT_B_8bits of NOT_B_8bits is

component NOT_B
	port(
	b: in std_logic;
	r: out std_logic);
end component;

signal Ri: std_logic_vector (7 downto 0);

begin

Comparador0: NOT_B port map(B(0),Ri(0));
Comparador1: NOT_B port map(B(1),Ri(1));
Comparador2: NOT_B port map(B(2),Ri(2));
Comparador3: NOT_B port map(B(3),Ri(3));
Comparador4: NOT_B port map(B(4),Ri(4));
Comparador5: NOT_B port map(B(5),Ri(5));
Comparador6: NOT_B port map(B(6),Ri(6));
Comparador7: NOT_B port map(B(7),Ri(7));
R8 <= Ri;
end NOT_B_8bits;