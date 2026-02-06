library IEEE;
use IEEE.std_logic_1164.all;

entity Mux2a18Bits is
	port (
	A, B: in std_logic_vector (7 downto 0);
	s: in std_logic;
	R: out std_logic_vector (7 downto 0));
end Mux2a18Bits;
 
architecture Ar_Mux2a18Bits of Mux2a18Bits is
	
component Mux2a1 
	port (
	a, b, s: in std_logic;
	r: out std_logic);
end component;

begin
	Mux2a1Bit0: Mux2a1 port map (A(0), B(0), s, R(0));
	Mux2a1Bit1: Mux2a1 port map (A(1), B(1), s, R(1));
	Mux2a1Bit2: Mux2a1 port map (A(2), B(2), s, R(2));
	Mux2a1Bit3: Mux2a1 port map (A(3), B(3), s, R(3));
	Mux2a1Bit4: Mux2a1 port map (A(4), B(4), s, R(4));
	Mux2a1Bit5: Mux2a1 port map (A(5), B(5), s, R(5));
	Mux2a1Bit6: Mux2a1 port map (A(6), B(6), s, R(6));   
	Mux2a1Bit7: Mux2a1 port map (A(7), B(7), s, R(7));
end Ar_Mux2a18Bits;