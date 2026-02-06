library IEEE;
use IEEE.std_logic_1164.all;

entity NXOR_8bits is
	port(
	A, B: in std_logic_vector (7 downto 0);
	R7: out std_logic_vector (7 downto 0));
end NXOR_8bits;

architecture NXOR_8bits of NXOR_8bits is

component NXOR_b
	port(
	a,b: in std_logic;
	r: out std_logic);
end component;

signal Ri: std_logic_vector (7 downto 0);

begin

Comparador0: NXOR_b port map(A(0),B(0),Ri(0));
Comparador1: NXOR_b port map(A(1),B(1),Ri(1));
Comparador2: NXOR_b port map(A(2),B(2),Ri(2));
Comparador3: NXOR_b port map(A(3),B(3),Ri(3));
Comparador4: NXOR_b port map(A(4),B(4),Ri(4));
Comparador5: NXOR_b port map(A(5),B(5),Ri(5));
Comparador6: NXOR_b port map(A(6),B(6),Ri(6));
Comparador7: NXOR_b port map(A(7),B(7),Ri(7));
R7 <= Ri;
end NXOR_8bits;