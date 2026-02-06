library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4a18Bits is
	port (
	A, B, C, D: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (1 downto 0);
	R: out std_logic_vector (7 downto 0));
end Mux4a18Bits;
 
architecture Ar_Mux4a18Bits of Mux4a18Bits is
   
component Mux4a1 
	port (a, b, c, d: std_logic;
	S: in std_logic_vector (1 downto 0);
	r: out std_logic);
end component; 

begin
	Mux4a1Bit0: Mux4a1 port map (A(0), B(0), C(0), D(0), S, R(0));
	Mux4a1Bit1: Mux4a1 port map (A(1), B(1), C(1), D(1), S, R(1));
	Mux4a1Bit2: Mux4a1 port map (A(2), B(2), C(2), D(2), S, R(2));
	Mux4a1Bit3: Mux4a1 port map (A(3), B(3), C(3), D(3), S, R(3));
	Mux4a1Bit4: Mux4a1 port map (A(4), B(4), C(4), D(4), S, R(4));
	Mux4a1Bit5: Mux4a1 port map (A(5), B(5), C(5), D(5), S, R(5));
	Mux4a1Bit6: Mux4a1 port map (A(6), B(6), C(6), D(6), S, R(6));   
	Mux4a1Bit7: Mux4a1 port map (A(7), B(7), C(7), D(7), S, R(7));
end Ar_Mux4a18Bits;