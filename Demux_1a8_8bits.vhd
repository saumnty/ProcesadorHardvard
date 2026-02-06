library IEEE;
use IEEE.std_logic_1164.all;

entity Demux_1a8_8bits is
	port(
	Valor_in: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	A, B, C, D, E, F, G, H: out std_logic_vector (7 downto 0));
end Demux_1a8_8bits;

architecture Demux_1a8_8bits of Demux_1a8_8bits is

component Demux_1a8 is
	port(
	Valor_in: in std_logic;
	S: in std_logic_vector (2 downto 0);
	a, b, c, d, e, f, g, h: out std_logic);
end component;
begin
	Demux_1a8_0: Demux_1a8 port map (Valor_in(0), S, A(0), B(0), C(0), D(0), E(0), F(0), G(0), H(0));
	Demux_1a8_1: Demux_1a8 port map (Valor_in(1), S, A(1), B(1), C(1), D(1), E(1), F(1), G(1), H(1));
	Demux_1a8_2: Demux_1a8 port map (Valor_in(2), S, A(2), B(2), C(2), D(2), E(2), F(2), G(2), H(2));
	Demux_1a8_3: Demux_1a8 port map (Valor_in(3), S, A(3), B(3), C(3), D(3), E(3), F(3), G(3), H(3));
	Demux_1a8_4: Demux_1a8 port map (Valor_in(4), S, A(4), B(4), C(4), D(4), E(4), F(4), G(4), H(4));
	Demux_1a8_5: Demux_1a8 port map (Valor_in(5), S, A(5), B(5), C(5), D(5), E(5), F(5), G(5), H(5));
	Demux_1a8_6: Demux_1a8 port map (Valor_in(6), S, A(6), B(6), C(6), D(6), E(6), F(6), G(6), H(6));   
	Demux_1a8_7: Demux_1a8 port map (Valor_in(7), S, A(7), B(7), C(7), D(7), E(7), F(7), G(7), H(7));
end Demux_1a8_8bits;