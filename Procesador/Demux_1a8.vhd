library IEEE;
use IEEE.std_logic_1164.all;

entity Demux_1a8 is
	port(
	Valor_in: in std_logic;
	S: in std_logic_vector (2 downto 0);
	a, b, c, d, e, f, g, h: out std_logic);
end Demux_1a8;

architecture Demux_1a8 of Demux_1a8 is
begin

	a <= ( Valor_in and not(S(2)) and not (S(1)) and not(S(0)));
	b <= ( Valor_in and not(S(2)) and not(S(1)) and S(0));
	c <= ( Valor_in and not(S(2)) and S(1) and not(S(0)));
	d <= ( Valor_in and not(S(2)) and S(1) and S(0));
	e <= ( Valor_in and S(2) and not(S(1)) and not(S(0)));
	f <= ( Valor_in and S(2) and not(S(1)) and S(0));
	g <= ( Valor_in and S(2) and S(1) and not(S(0)));
	h <= ( Valor_in and S(2) and S(1) and S(0));

end Demux_1a8;