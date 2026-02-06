--El Secuenciador lo utilizamos para controlar el comportamiento de nuestro Datapath_PC, y consecuentemente a nuestro Datapath.
--Como datos de entrada tenemos a 'J' y a 'Sv', que dependiendo de sus valores, cambiaran los pasos.

library IEEE;
use IEEE.std_logic_1164.all;

entity Secuenciador is
	port(
	J,Sv: in std_logic; --Datos de entrada
	clk: in std_logic;
	WIR,WCW: out std_logic; --Señales de escritura para los registros: IR y CW respectivamente
	MB,MC: out std_logic; --Señales para los mux ubicados en Datapath_PC
	WPC: out std_logic); --Señal de escritura para Registro_PC
end Secuenciador;

architecture Secuenciador of Secuenciador is

component FFD
	port (
	d, clk: in std_logic;
	q: out std_logic);
end component;

component Deco_3_a_8
	port (
	S: in std_logic_vector (2 downto 0);
	a, b, c, d, e, f, g, h: out std_logic);
end component;

signal selector: std_logic_vector (2 downto 0);
signal D2, D1, D0: std_logic;
signal F2, F1, F0: std_logic;
signal Ini, I, A, B, C, D, E, O1: std_logic;

begin

--Funciones creadasa partir de la carta ASM y Tabla de estados
D2 <= (((not(F2) and F1 and F0)and not(J))or((not(F2) and F1 and F0)and J and not(Sv))or((not(F2) and F1 and F0)and J and Sv));
D1 <= ((not(F2) and not(F1) and F0)or(not(F2) and F1 and not(F0))or((not(F2) and F1 and F0)and J and not(Sv)));
D0 <= ((not(F2) and not(F1) and not(F0))or(not(F2) and F1 and not(F0))or((not(F2) and F1 and F0)and J and Sv));

FF0: FFD port map (D0, clk, F0);
FF1: FFD port map (D1, clk, F1);
FF2: FFD port map (D2, clk, F2);

selector(0) <= F0;
selector(1) <= F1;
selector(2) <= F2;

Deco_3_a_8_sel: Deco_3_a_8 port map(S => selector, a => Ini, b => I, c => A, d => B, e => C, f => D, g => E, h => O1);

WIR <= I;
WCW <= A;
MB <= D;
MC <= C or E;
WPC <= C or D or E;

end Secuenciador;