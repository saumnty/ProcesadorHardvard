--La UR_In se puede considerar como la base de una Unidad de Registros, aqui es donde se encuentran los registros.
--Desde el R0 hasta el R7, esto se hace por medio de un 'C' que nos permite introducir un valor, una señal de escritura 'W' que nos permite guardar el dato en los registros,
--Y la señal de escritura 'Dc', misma que nos permite guardar en el registro que queremos, si DC := "000", y W := '0', no se guarda ningun valor, si W := '1', el valor de C se guadara en R0 (Registro 0).
--Para selecionar que Registro almacenara el valor, se utiliza un Deco_3_a_8, el cual dependiendo de Dc, se mandara una señal para guardar en el registro.
--And_b hace la operacion: W and (resultado_deco) para activar la señal de escritura del registro seleccionado.

library IEEE;
use IEEE.std_logic_1164.all;

entity UR_In is
	port(
	C: in std_logic_vector (7 downto 0);
	Dc: in std_logic_vector (2 downto 0);
	W: in std_logic; --Señal de escritura
	clk: in std_logic;
	R0,R1,R2,R3,R4,R5,R6,R7: out std_logic_vector (7 downto 0));
end UR_In;

architecture UR_In of UR_In is

component AND_b
	port(
	a,b: in std_logic;
	r: out std_logic);
end component;

component Deco_3_a_8
	port (
	S: in std_logic_vector (2 downto 0);
	a, b, c, d, e, f, g, h: out std_logic);
end component;

component Registro_8_Bits
	port (
	D: in std_logic_vector (7 downto 0); 
	w, clk: in std_logic; 
	Q: out std_logic_vector (7 downto 0));
end component;

-- Señales de Escritura, AND
signal wa: std_logic;
signal wb: std_logic;
signal wc: std_logic;
signal wd: std_logic;
signal we: std_logic;
signal wf: std_logic;
signal wg: std_logic;
signal wh: std_logic;

-- Señales de Escritura, Registros
signal w0: std_logic;
signal w1: std_logic;
signal w2: std_logic;
signal w3: std_logic;
signal w4: std_logic;
signal w5: std_logic;
signal w6: std_logic;
signal w7: std_logic;

begin
Deco_3_a_8_F: Deco_3_a_8 port map(S => Dc, a => wa, b => wb, c => wc, d => wd, e => we, f => wf, g => wg, h => wh);

-- Formar Señales
AND_0: AND_b port map(a => W, b => wa, r => w0);
AND_1: AND_b port map(a => W, b => wb, r => w1);
AND_2: AND_b port map(a => W, b => wc, r => w2);
AND_3: AND_b port map(a => W, b => wd, r => w3);
AND_4: AND_b port map(a => W, b => we, r => w4);
AND_5: AND_b port map(a => W, b => wf, r => w5);
AND_6: AND_b port map(a => W, b => wg, r => w6);
AND_7: AND_b port map(a => W, b => wh, r => w7);

Registro_0: Registro_8_Bits port map(D => C, w => w0, clk => clk, Q => R0);
Registro_1: Registro_8_Bits port map(D => C, w => w1, clk => clk, Q => R1);
Registro_2: Registro_8_Bits port map(D => C, w => w2, clk => clk, Q => R2);
Registro_3: Registro_8_Bits port map(D => C, w => w3, clk => clk, Q => R3);
Registro_4: Registro_8_Bits port map(D => C, w => w4, clk => clk, Q => R4);
Registro_5: Registro_8_Bits port map(D => C, w => w5, clk => clk, Q => R5);
Registro_6: Registro_8_Bits port map(D => C, w => w6, clk => clk, Q => R6);
Registro_7: Registro_8_Bits port map(D => C, w => w7, clk => clk, Q => R7);
end UR_In;