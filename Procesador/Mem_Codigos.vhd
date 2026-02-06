--La Mem_Codigos es muy similar a la Mem_Datos, con algunas diferencias notables, como:
	--No tiene un valor que podamos almacenasr en los registros, solo tenemos "Paso", el cual eligira el codigo que saldra por "Datos_out".
	--Los valores que tiene cada uno de los registros esta dado por Co0 a Co31 que son señales que contienen un valor de 21 bits.
	--Utilizamos Registro_21_Bits y Mux_32_a_1_21Bits, esto debido a que en esta memoria utilizamos valores de 21 bits, por lo tanto, al igual que las señales y estos componentes, la salida "Datos_out" es 21 bits.

--Los codigos corresponden la instruccion IR, mismos que utilizamos para las idfentes operaciones que se realizaran en el Datapath.
--Estos se describe:
--   S    Dc  Da MD2 Inmediato MD1
-- 00000 000 000  0  00000000   0
--Mismos que vimos en el registro IR y en el CW.

--El objetivo de la Mem_Codigos es dar los codigos, dependiendo del valor de Paso.

--En general la forma de escribir codigos es como lo mostre hace un momento:

--  S = Operacion "00000"
--	Dc = Registro_UR "000"
--	Da = Salida_UR_A "000"
--	MD2 = Mux MM (Usar valor de memoria) '0'
--	DB/Inmediato = Salida_UR_B/Inmediato: Esto ocurre debido aque podemos utilizar los 3 bits mas significativos del Inmediato
--	para Db, y de esta forma optimizar el programa, esto de pendera de MD1, si MD1 esta activo, se utilizara el inmediato,
--	en esl caso contrario, se utilizaran los 3 bits mas significativos para Db "000/00000"
--	MD1 = Mux Mi (Activar el Inmediato) '0'

--Quedando de esta forma:

--   S    Dc  Da MD2 DB/Inmediato MD1
-- 00000 000 000  0  000  00000    0

--   S    Dc  Da MD2 DB/Inmediato MD1
-- 00000 000 000  0  000  00000    0 

library IEEE;
use IEEE.std_logic_1164.all;

entity Mem_Codigos is
	port(
	Paso: in std_logic_vector (4 downto 0); --Paso a seleccionar
	clk: in std_logic;
	Datos_out: out std_logic_vector (20 downto 0));
end Mem_Codigos;

architecture Mem_Codigos of Mem_Codigos is

component AND_b
	port(
	a,b: in std_logic;
	r: out std_logic);
end component;

component Deco_5_a_32
	port (
	S: in std_logic_vector (4 downto 0);
	a, b, c, d, e, f, g, h, i, j,
	k, l, m, n, o, p, q, r, si, t,
	u, w, x, y, z, a1, b1, c1, d1, e1,
	f1, g1: out std_logic);
end component;

component Mux_32_a_1_21Bits
	port (
	A, B, C, D, E, F, G, H, I, J,
	K, L, M, N, O, P, Q, R, Si, T,
	U, W, X, Y, Z, A1, B1, C1, D1, E1,
	F1, G1: in std_logic_vector (20 downto 0);
	S: in std_logic_vector (4 downto 0);
	Rout: out std_logic_vector (20 downto 0));
end component;

component Registro_21_Bits
	port (
	D: in std_logic_vector (20 downto 0); 
	W, clk: in std_logic; 
	Q: out std_logic_vector (20 downto 0));
end component;

signal MWC: std_logic := '1';

-- Señales de Escritura, AND
signal wa: std_logic;
signal wb: std_logic;
signal wc: std_logic;
signal wd: std_logic;
signal we: std_logic;
signal wf: std_logic;
signal wg: std_logic;
signal wh: std_logic;
signal wi: std_logic;
signal wj: std_logic;
signal wk: std_logic;
signal wl: std_logic;
signal wm: std_logic;
signal wn: std_logic;
signal wo: std_logic;
signal wp: std_logic;
signal wq: std_logic;
signal wr: std_logic;
signal ws: std_logic;
signal wt: std_logic;
signal wu: std_logic;
signal ww: std_logic;
signal wx: std_logic;
signal wy: std_logic;
signal wz: std_logic;
signal wa1: std_logic;
signal wb1: std_logic;
signal wc1: std_logic;
signal wd1: std_logic;
signal we1: std_logic;
signal wf1: std_logic;
signal wg1: std_logic;

-- Señales de Escritura, Registros
signal w0: std_logic;
signal w1: std_logic;
signal w2: std_logic;
signal w3: std_logic;
signal w4: std_logic;
signal w5: std_logic;
signal w6: std_logic;
signal w7: std_logic;
signal w8: std_logic;
signal w9: std_logic;
signal w10: std_logic;
signal w11: std_logic;
signal w12: std_logic;
signal w13: std_logic;
signal w14: std_logic;
signal w15: std_logic;
signal w16: std_logic;
signal w17: std_logic;
signal w18: std_logic;
signal w19: std_logic;
signal w20: std_logic;
signal w21: std_logic;
signal w22: std_logic;
signal w23: std_logic;
signal w24: std_logic;
signal w25: std_logic;
signal w26: std_logic;
signal w27: std_logic;
signal w28: std_logic;
signal w29: std_logic;
signal w30: std_logic;
signal w31: std_logic;

-- Codigos
signal Co0: std_logic_vector (20 downto 0) := "001010010000000001011"; -- LDI R1, 5
signal Co1: std_logic_vector (20 downto 0) := "001010100000000010011"; -- LDI R2, 9
signal Co2: std_logic_vector (20 downto 0) := "010110110010010000000"; -- XOR R3, R1, R2
signal Co3: std_logic_vector (20 downto 0) := "100011000110000000000"; -- SHR R4, R3
signal Co4: std_logic_vector (20 downto 0);
signal Co5: std_logic_vector (20 downto 0);
signal Co6: std_logic_vector (20 downto 0);
signal Co7: std_logic_vector (20 downto 0);
signal Co8: std_logic_vector (20 downto 0);
signal Co9: std_logic_vector (20 downto 0);
signal Co10: std_logic_vector (20 downto 0);
signal Co11: std_logic_vector (20 downto 0);
signal Co12: std_logic_vector (20 downto 0);
signal Co13: std_logic_vector (20 downto 0);
signal Co14: std_logic_vector (20 downto 0);
signal Co15: std_logic_vector (20 downto 0);
signal Co16: std_logic_vector (20 downto 0);
signal Co17: std_logic_vector (20 downto 0);
signal Co18: std_logic_vector (20 downto 0); 

signal Co19: std_logic_vector (20 downto 0);
signal Co20: std_logic_vector (20 downto 0);
signal Co21: std_logic_vector (20 downto 0);
signal Co22: std_logic_vector (20 downto 0);
signal Co23: std_logic_vector (20 downto 0);
signal Co24: std_logic_vector (20 downto 0);
signal Co25: std_logic_vector (20 downto 0);
signal Co26: std_logic_vector (20 downto 0);
signal Co27: std_logic_vector (20 downto 0);
signal Co28: std_logic_vector (20 downto 0);
signal Co29: std_logic_vector (20 downto 0);
signal Co30: std_logic_vector (20 downto 0);
signal Co31: std_logic_vector (20 downto 0);

-- Señales de Resultado
signal R0: std_logic_vector (20 downto 0);
signal R1: std_logic_vector (20 downto 0);
signal R2: std_logic_vector (20 downto 0);
signal R3: std_logic_vector (20 downto 0);
signal R4: std_logic_vector (20 downto 0);
signal R5: std_logic_vector (20 downto 0);
signal R6: std_logic_vector (20 downto 0);
signal R7: std_logic_vector (20 downto 0);
signal R8: std_logic_vector (20 downto 0);
signal R9: std_logic_vector (20 downto 0);
signal R10: std_logic_vector (20 downto 0);
signal R11: std_logic_vector (20 downto 0);
signal R12: std_logic_vector (20 downto 0);
signal R13: std_logic_vector (20 downto 0);
signal R14: std_logic_vector (20 downto 0);
signal R15: std_logic_vector (20 downto 0);
signal R16: std_logic_vector (20 downto 0);
signal R17: std_logic_vector (20 downto 0);
signal R18: std_logic_vector (20 downto 0);
signal R19: std_logic_vector (20 downto 0);
signal R20: std_logic_vector (20 downto 0);
signal R21: std_logic_vector (20 downto 0);
signal R22: std_logic_vector (20 downto 0);
signal R23: std_logic_vector (20 downto 0);
signal R24: std_logic_vector (20 downto 0);
signal R25: std_logic_vector (20 downto 0);
signal R26: std_logic_vector (20 downto 0);
signal R27: std_logic_vector (20 downto 0);
signal R28: std_logic_vector (20 downto 0);
signal R29: std_logic_vector (20 downto 0);
signal R30: std_logic_vector (20 downto 0);
signal R31: std_logic_vector (20 downto 0);

-- Deco
begin
Deco_5_a_32_F: Deco_5_a_32 port map (S => Paso, a => wa, b => wb, c => wc, d => wd, e => we, f => wf, g => wg, h => wh, i => wi, j => wj,
	k => wk, l => wl, m => wm, n => wn, o => wo, p => wp, q => wq, r => wr, Si => ws, T => wt, U => wu, W => ww, X => wx, Y => wy, z => wz,
	a1 => wa1, b1 => wb1, c1 => wc1, d1 => wd1, e1 => we1, f1 => wf1, g1 => wg1);

-- Formar Señales
AND_0: AND_b port map(a => MWC, b => wa, r => w0);
AND_1: AND_b port map(a => MWC, b => wb, r => w1);
AND_2: AND_b port map(a => MWC, b => wc, r => w2);
AND_3: AND_b port map(a => MWC, b => wd, r => w3);
AND_4: AND_b port map(a => MWC, b => we, r => w4);
AND_5: AND_b port map(a => MWC, b => wf, r => w5);
AND_6: AND_b port map(a => MWC, b => wg, r => w6);
AND_7: AND_b port map(a => MWC, b => wh, r => w7);
AND_8: AND_b port map(a => MWC, b => wi, r => w8);
AND_9: AND_b port map(a => MWC, b => wj, r => w9);
AND_10: AND_b port map(a => MWC, b => wk, r => w10);
AND_11: AND_b port map(a => MWC, b => wl, r => w11);
AND_12: AND_b port map(a => MWC, b => wm, r => w12);
AND_13: AND_b port map(a => MWC, b => wn, r => w13);
AND_14: AND_b port map(a => MWC, b => wo, r => w14);
AND_15: AND_b port map(a => MWC, b => wp, r => w15);
AND_16: AND_b port map(a => MWC, b => wq, r => w16);
AND_17: AND_b port map(a => MWC, b => wr, r => w17);
AND_18: AND_b port map(a => MWC, b => ws, r => w18);
AND_19: AND_b port map(a => MWC, b => wt, r => w19);
AND_20: AND_b port map(a => MWC, b => wu, r => w20);
AND_21: AND_b port map(a => MWC, b => ww, r => w21);
AND_22: AND_b port map(a => MWC, b => wx, r => w22);
AND_23: AND_b port map(a => MWC, b => wy, r => w23);
AND_24: AND_b port map(a => MWC, b => wz, r => w24);
AND_25: AND_b port map(a => MWC, b => wa1, r => w25);
AND_26: AND_b port map(a => MWC, b => wb1, r => w26);
AND_27: AND_b port map(a => MWC, b => wc1, r => w27);
AND_28: AND_b port map(a => MWC, b => wd1, r => w28);
AND_29: AND_b port map(a => MWC, b => we1, r => w29);
AND_30: AND_b port map(a => MWC, b => wf1, r => w30);
AND_31: AND_b port map(a => MWC, b => wg1, r => w31);

-- Implementar los Registros
Registro_0: Registro_21_Bits port map(D => Co0, w => w0, clk => clk, Q => R0);
Registro_1: Registro_21_Bits port map(D => Co1, w => w1, clk => clk, Q => R1);
Registro_2: Registro_21_Bits port map(D => Co2, w => w2, clk => clk, Q => R2);
Registro_3: Registro_21_Bits port map(D => Co3, w => w3, clk => clk, Q => R3);
Registro_4: Registro_21_Bits port map(D => Co4, w => w4, clk => clk, Q => R4);
Registro_5: Registro_21_Bits port map(D => Co5, w => w5, clk => clk, Q => R5);
Registro_6: Registro_21_Bits port map(D => Co6, w => w6, clk => clk, Q => R6);
Registro_7: Registro_21_Bits port map(D => Co7, w => w7, clk => clk, Q => R7);
Registro_8: Registro_21_Bits port map(D => Co8, w => w8, clk => clk, Q => R8);
Registro_9: Registro_21_Bits port map(D => Co9, w => w9, clk => clk, Q => R9);
Registro_10: Registro_21_Bits port map(D => Co10, w => w10, clk => clk, Q => R10);
Registro_11: Registro_21_Bits port map(D => Co11, w => w11, clk => clk, Q => R11);
Registro_12: Registro_21_Bits port map(D => Co12, w => w12, clk => clk, Q => R12);
Registro_13: Registro_21_Bits port map(D => Co13, w => w13, clk => clk, Q => R13);
Registro_14: Registro_21_Bits port map(D => Co14, w => w14, clk => clk, Q => R14);
Registro_15: Registro_21_Bits port map(D => Co15, w => w15, clk => clk, Q => R15);
Registro_16: Registro_21_Bits port map(D => Co16, w => w16, clk => clk, Q => R16);
Registro_17: Registro_21_Bits port map(D => Co17, w => w17, clk => clk, Q => R17);
Registro_18: Registro_21_Bits port map(D => Co18, w => w18, clk => clk, Q => R18);
Registro_19: Registro_21_Bits port map(D => Co19, w => w19, clk => clk, Q => R19);
Registro_20: Registro_21_Bits port map(D => Co20, w => w20, clk => clk, Q => R20);
Registro_21: Registro_21_Bits port map(D => Co21, w => w21, clk => clk, Q => R21);
Registro_22: Registro_21_Bits port map(D => Co22, w => w22, clk => clk, Q => R22);
Registro_23: Registro_21_Bits port map(D => Co23, w => w23, clk => clk, Q => R23);
Registro_24: Registro_21_Bits port map(D => Co24, w => w24, clk => clk, Q => R24);
Registro_25: Registro_21_Bits port map(D => Co25, w => w25, clk => clk, Q => R25);
Registro_26: Registro_21_Bits port map(D => Co26, w => w26, clk => clk, Q => R26);
Registro_27: Registro_21_Bits port map(D => Co27, w => w27, clk => clk, Q => R27);
Registro_28: Registro_21_Bits port map(D => Co28, w => w28, clk => clk, Q => R28);
Registro_29: Registro_21_Bits port map(D => Co29, w => w29, clk => clk, Q => R29);
Registro_30: Registro_21_Bits port map(D => Co30, w => w30, clk => clk, Q => R30);
Registro_31: Registro_21_Bits port map(D => Co31, w => w31, clk => clk, Q => R31);

--MUX de Salidas
Mux_32_a_1_21Bits_F: Mux_32_a_1_21Bits port map (A => R0, B => R1, C => R2, D => R3, E => R4, F => R5, G => R6, H => R7, I => R8, J => R9,
	K => R10, L => R11, M => R12, N => R13, O => R14, P => R15, Q => R16, R => R17, Si => R18, T => R19, U => R20, W => R21, X => R22, Y => R23, Z => R24,
	A1 => R25, B1 => R26, C1 => R27, D1 => R28, E1 => R29, F1 => R30, G1 => R31, S => Paso, Rout => Datos_out);

end Mem_Codigos;