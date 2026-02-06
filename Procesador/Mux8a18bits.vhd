library IEEE;
use IEEE.std_logic_1164.all;

entity Mux8a18Bits is
	port (
	A, B, C, D, E, F, G, H: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	R: out std_logic_vector (7 downto 0));
end Mux8a18Bits;
 
architecture Mux8a18Bits of Mux8a18Bits is
component Mux8a1 is
	port (
	a, b, c, d, e, f, g, h: std_logic;
	S: in std_logic_vector (2 downto 0);
	r: out std_logic);
end component; 
begin
	Mux8a1Bit0: Mux8a1 port map (A(0), B(0), C(0), D(0), E(0), F(0), G(0), H(0), S, R(0));
	Mux8a1Bit1: Mux8a1 port map (A(1), B(1), C(1), D(1), E(1), F(1), G(1), H(1), S, R(1));
	Mux8a1Bit2: Mux8a1 port map (A(2), B(2), C(2), D(2), E(2), F(2), G(2), H(2), S, R(2));
	Mux8a1Bit3: Mux8a1 port map (A(3), B(3), C(3), D(3), E(3), F(3), G(3), H(3), S, R(3));
	Mux8a1Bit4: Mux8a1 port map (A(4), B(4), C(4), D(4), E(4), F(4), G(4), H(4), S, R(4));
	Mux8a1Bit5: Mux8a1 port map (A(5), B(5), C(5), D(5), E(5), F(5), G(5), H(5), S, R(5));
	Mux8a1Bit6: Mux8a1 port map (A(6), B(6), C(6), D(6), E(6), F(6), G(6), H(6), S, R(6));   
	Mux8a1Bit7: Mux8a1 port map (A(7), B(7), C(7), D(7), E(7), F(7), G(7), H(7), S, R(7));
end Mux8a18Bits;