--En esta entidad entran las banderas de estado, mismas que dependiendo de 'S', obtendremos un resultado distinto, dependiendo de estas.
--Lo utilizamos para el salto.

library IEEE;
use IEEE.std_logic_1164.all;

entity Salto_Valido is
	port(
	Carry,Signo,V,Zero: in std_logic;
	S: in std_logic_vector (2 downto 0);
	SV: out std_logic);
end Salto_Valido;

architecture Salto_Valido of Salto_Valido is

component Mux8a1
	port (
	a, b, c, d, e, f, g, h: in std_logic;
	S: in std_logic_vector (2 downto 0);
	r: out std_logic);
end component;

component NOT_A
	port(
	a: in std_logic;
	r: out std_logic);
end component;

signal NCarry: std_logic;
signal NSigno: std_logic;
signal NV: std_logic;
signal NZero: std_logic;

begin

NOT_A_0: NOT_A port map(a => Carry, r => NCarry);
NOT_A_1: NOT_A port map(a => Signo, r => NSigno);
NOT_A_2: NOT_A port map(a => V, r => NV);
NOT_A_3: NOT_A port map(a => Zero, r => NZero);

Mux8a1_SV: Mux8a1 port map(a => Carry, b => NCarry, c => Signo, d => NSigno, e => v, f => NV, g => Zero, h => NZero, S => S, r => SV);

end Salto_Valido;