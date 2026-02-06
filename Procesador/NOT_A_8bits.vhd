library IEEE;
use IEEE.std_logic_1164.all;

entity NOT_A_8bits is
	port(
	A: in std_logic_vector (7 downto 0);
	R3: out std_logic_vector (7 downto 0));
end NOT_A_8bits;

architecture NOT_A_8bits of NOT_A_8bits is

component NOT_A
	port(
	a: in std_logic;
	r: out std_logic);
end component;

signal Ri: std_logic_vector (7 downto 0);

begin

Comparador0: NOT_A port map(A(0),Ri(0));
Comparador1: NOT_A port map(A(1),Ri(1));
Comparador2: NOT_A port map(A(2),Ri(2));
Comparador3: NOT_A port map(A(3),Ri(3));
Comparador4: NOT_A port map(A(4),Ri(4));
Comparador5: NOT_A port map(A(5),Ri(5));
Comparador6: NOT_A port map(A(6),Ri(6));
Comparador7: NOT_A port map(A(7),Ri(7));
R3 <= Ri;
end NOT_A_8bits;