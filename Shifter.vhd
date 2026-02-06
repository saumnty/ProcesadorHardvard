--El shifter nos permite realizar diferentes operaciones tales que:
	--SHL 'Ain << 1' "10000"
	--SHR 'Ain >> 1' "10001"
	--ROR 'Ain Ro>> 1' "10010"
	--ROL 'Ain <<Ro 1' "10011"
--Cl nos permite utilizar el bit Ain(7) com acarreo_out.
--Cr nos permite utilizar el bit Ain(0) com acarreo_out.
library IEEE;
use IEEE.std_logic_1164.all;

entity Shifter is
	port(
	Ain: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (1 downto 0);
	Cl,Cr: out std_logic;
	R: out std_logic_vector (7 downto 0));
end Shifter;

architecture Shifter of Shifter is

component Mux4a1
	port (
	a, b, c, d: std_logic;
	S: in std_logic_vector (1 downto 0);
	r: out std_logic);
end component;

signal leftr: std_logic := '0'; --Valor del desplazamiento a la derecha
signal rightr: std_logic := '0'; --Valor del desplazamiento a la izquierda

begin
Mux_4_R0: Mux4a1 port map(a => rightr, b => Ain(1), c => Ain(7), d => Ain(1), S => S, r => R(0));
Mux_4_R1: Mux4a1 port map(a => Ain(0), b => Ain(2), c => Ain(0), d => Ain(2), S => S, r => R(1));
Mux_4_R2: Mux4a1 port map(a => Ain(1), b => Ain(3), c => Ain(1), d => Ain(3), S => S, r => R(2));
Mux_4_R3: Mux4a1 port map(a => Ain(2), b => Ain(4), c => Ain(2), d => Ain(4), S => S, r => R(3));
Mux_4_R4: Mux4a1 port map(a => Ain(3), b => Ain(5), c => Ain(3), d => Ain(5), S => S, r => R(4));
Mux_4_R5: Mux4a1 port map(a => Ain(4), b => Ain(6), c => Ain(4), d => Ain(6), S => S, r => R(5));
Mux_4_R6: Mux4a1 port map(a => Ain(5), b => Ain(7), c => Ain(5), d => Ain(7), S => S, r => R(6));
Mux_4_R7: Mux4a1 port map(a => Ain(6), b => leftr, c => Ain(6), d => Ain(0), S => S, r => R(7));

Cl <= (Ain(7));
Cr <= (Ain(0));

end Shifter;