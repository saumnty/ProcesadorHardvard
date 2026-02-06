library IEEE;
use IEEE.std_logic_1164.all;

entity Registro_8_Bits is
	port (
	D: in std_logic_vector (7 downto 0); 
	w, clk: in std_logic; 
	Q: out std_logic_vector (7 downto 0));
end Registro_8_Bits;

architecture Registro_8_Bits of Registro_8_Bits is
component FFDw
	port (
	d, w, clk: in std_logic; 
	q: out std_logic);
end component; 
begin
	Bit0 : FFDw port map (D(0), W, clk, Q(0));
	Bit1 : FFDw port map (D(1), W, clk, Q(1));
	Bit2 : FFDw port map (D(2), W, clk, Q(2));
	Bit3 : FFDw port map (D(3), W, clk, Q(3));
	Bit4 : FFDw port map (D(4), W, clk, Q(4));
	Bit5 : FFDw port map (D(5), W, clk, Q(5));
	Bit6 : FFDw port map (D(6), W, clk, Q(6));
	Bit7 : FFDw port map (D(7), W, clk, Q(7));   
end Registro_8_Bits;