--Este es el Registro contador, denominado PC, este puede incrementar en 1 bit, o en un caso especial, en un inmediato (valor de 8 bits).
--El Registro contador se denomina de esta forma, no solo porque en este se almacena el valor del contador en "Registro_8_Bits_PC",
--si no que tambien incrementara a este valor dependiendo del valor de las señales "MB" o "MC", que pueden dejar entrar a un inmediato,
--causando que el contador aumente dependiendo del valor del inmediato.

library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
	port(
	Inmediato: in std_logic_vector (7 downto 0);
	MB,MC,WPC,clk: in std_logic;
	PC: out std_logic_vector (7 downto 0));
end PC;

architecture PC of PC is

component Sumador_PC
	port (A, B: in std_logic_vector (7 downto 0);
	CIPC: in std_logic;
	RPC: out std_logic_vector (7 downto 0));
end component;

component Mux2a18Bits
	port (
	A, B: in std_logic_vector (7 downto 0);
	s: in std_logic;
	R: out std_logic_vector (7 downto 0));
end component;

component Mux2a1 is
	port (
	a, b, s: in std_logic;
	r: out std_logic);
end component;

component Registro_8_Bits
	port (
	D: in std_logic_vector (7 downto 0); 
	w, clk: in std_logic; 
	Q: out std_logic_vector (7 downto 0));
end component;

signal constante0: std_logic_vector (7 downto 0) := "00000000";
signal constant0: std_logic := '0';
signal constant1: std_logic := '1';

signal MuxMB: std_logic_vector (7 downto 0); --Resultado del MuxMB
signal MuxMC: std_logic; --Resultado del MuxMC

signal RC: std_logic_vector (7 downto 0); --RC es el valor que entra al Registro_8_Bits_PC
signal Registro_PC: std_logic_vector (7 downto 0); -- Es el valor de salida del Registro_8_Bits_PC

begin

MuxMB_PC: Mux2a18Bits port map(A => constante0, B => Inmediato, s => MB, R => MuxMB);
MuxMC_PC: Mux2a1 port map(A => constant0, B => constant1, s => MC, R => MuxMC);

Sumador_PC_F: Sumador_PC port map(A => Registro_PC, B => MuxMB, CIPC => MuxMC, RPC => RC);

Registro_8_Bits_PC: Registro_8_Bits port map(D => RC, w => WPC, clk => clk, Q => Registro_PC);

PC <= Registro_PC;

end PC;