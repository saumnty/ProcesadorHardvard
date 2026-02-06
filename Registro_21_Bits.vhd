library IEEE;
use IEEE.std_logic_1164.all;

entity Registro_21_Bits is
	port (
	D: in std_logic_vector (20 downto 0); 
	W, clk: in std_logic; 
	Q: out std_logic_vector (20 downto 0));
end Registro_21_Bits;

architecture Registro_21_Bits of Registro_21_Bits is
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
	Bit8 : FFDw port map (D(8), W, clk, Q(8));
	Bit9 : FFDw port map (D(9), W, clk, Q(9));
	Bit10 : FFDw port map (D(10), W, clk, Q(10));
	Bit11 : FFDw port map (D(11), W, clk, Q(11));
	Bit12 : FFDw port map (D(12), W, clk, Q(12));
	Bit13 : FFDw port map (D(13), W, clk, Q(13));
	Bit14 : FFDw port map (D(14), W, clk, Q(14));
	Bit15 : FFDw port map (D(15), W, clk, Q(15));
	Bit16 : FFDw port map (D(16), W, clk, Q(16));
	Bit17 : FFDw port map (D(17), W, clk, Q(17));
	Bit18 : FFDw port map (D(18), W, clk, Q(18));
	Bit19 : FFDw port map (D(19), W, clk, Q(19));
	Bit20 : FFDw port map (D(20), W, clk, Q(20));
end Registro_21_Bits;