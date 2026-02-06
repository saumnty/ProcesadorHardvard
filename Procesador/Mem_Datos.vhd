--La Mem_Datos utiliza la misma logica que una Unidad de Registros.
--Entra un valor en este caso un "Datos_in", el cual se almacenar en la direccion seleccionada, descrita por "Dir", esta se guaradara dependiendo si "MW" esta activa o no.
--La diferencia entre al Unidad de Registros y la Mem_Datos, ademas del numero de registros (UR con 8 y la Mem_Datos con 32), es que la Mem_Datos solo tiene uuna salida "Datos_out".

--La salida "Datos_out" se define dependiendo de "Dir", esta puede salir, independientemente si guardamos o no un valor.
--Ejemplo:
--Datos_in := "00001000", Dir := "00001", MW := '1'. Tenemos que almacenamos el valor '8' en R1, y a su vez.
--Si tenemos a Datos_in := "00001011", Dir := "00001", MW := '0'. No se alamcenar el valor '11' en R1, pero en Datos_out == '8' (El valor original).

--Entonces podemos almacenar, y llamar a valores almacenados.

library IEEE;
use IEEE.std_logic_1164.all;

entity Mem_Datos is
	port(
	Datos_in: in std_logic_vector (7 downto 0); --Valor para almacenar
	Dir: in std_logic_vector (4 downto 0); --Direccion para almacenar
	MW: in std_logic; --Señal para almacenar
	clk: in std_logic;
	Datos_out: out std_logic_vector (7 downto 0));
end Mem_Datos;

architecture Mem_Datos of Mem_Datos is

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

component Mux_32_a_18Bits 
	port (
	A, B, C, D, E, F, G, H, I, J,
	K, L, M, N, O, P, Q, R, Si, T,
	U, W, X, Y, Z, A1, B1, C1, D1, E1,
	F1, G1: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (4 downto 0);
	Rout: out std_logic_vector (7 downto 0));
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

-- Señales de Resultado
signal R0: std_logic_vector (7 downto 0);
signal R1: std_logic_vector (7 downto 0);
signal R2: std_logic_vector (7 downto 0);
signal R3: std_logic_vector (7 downto 0);
signal R4: std_logic_vector (7 downto 0);
signal R5: std_logic_vector (7 downto 0);
signal R6: std_logic_vector (7 downto 0);
signal R7: std_logic_vector (7 downto 0);
signal R8: std_logic_vector (7 downto 0);
signal R9: std_logic_vector (7 downto 0);
signal R10: std_logic_vector (7 downto 0);
signal R11: std_logic_vector (7 downto 0);
signal R12: std_logic_vector (7 downto 0);
signal R13: std_logic_vector (7 downto 0);
signal R14: std_logic_vector (7 downto 0);
signal R15: std_logic_vector (7 downto 0);
signal R16: std_logic_vector (7 downto 0);
signal R17: std_logic_vector (7 downto 0);
signal R18: std_logic_vector (7 downto 0);
signal R19: std_logic_vector (7 downto 0);
signal R20: std_logic_vector (7 downto 0);
signal R21: std_logic_vector (7 downto 0);
signal R22: std_logic_vector (7 downto 0);
signal R23: std_logic_vector (7 downto 0);
signal R24: std_logic_vector (7 downto 0);
signal R25: std_logic_vector (7 downto 0);
signal R26: std_logic_vector (7 downto 0);
signal R27: std_logic_vector (7 downto 0);
signal R28: std_logic_vector (7 downto 0);
signal R29: std_logic_vector (7 downto 0);
signal R30: std_logic_vector (7 downto 0);
signal R31: std_logic_vector (7 downto 0);

begin
-- Deco
Deco_5_a_32_F: Deco_5_a_32 port map (S => Dir, a => wa, b => wb, c => wc, d => wd, e => we, f => wf, g => wg, h => wh, i => wi, j => wj,
	k => wk, l => wl, m => wm, n => wn, o => wo, p => wp, q => wq, r => wr, Si => ws, T => wt, U => wu, W => ww, X => wx, Y => wy, z => wz,
	a1 => wa1, b1 => wb1, c1 => wc1, d1 => wd1, e1 => we1, f1 => wf1, g1 => wg1);

-- Formar Señales
AND_0: AND_b port map(a => MW, b => wa, r => w0);
AND_1: AND_b port map(a => MW, b => wb, r => w1);
AND_2: AND_b port map(a => MW, b => wc, r => w2);
AND_3: AND_b port map(a => MW, b => wd, r => w3);
AND_4: AND_b port map(a => MW, b => we, r => w4);
AND_5: AND_b port map(a => MW, b => wf, r => w5);
AND_6: AND_b port map(a => MW, b => wg, r => w6);
AND_7: AND_b port map(a => MW, b => wh, r => w7);
AND_8: AND_b port map(a => MW, b => wi, r => w8);
AND_9: AND_b port map(a => MW, b => wj, r => w9);
AND_10: AND_b port map(a => MW, b => wk, r => w10);
AND_11: AND_b port map(a => MW, b => wl, r => w11);
AND_12: AND_b port map(a => MW, b => wm, r => w12);
AND_13: AND_b port map(a => MW, b => wn, r => w13);
AND_14: AND_b port map(a => MW, b => wo, r => w14);
AND_15: AND_b port map(a => MW, b => wp, r => w15);
AND_16: AND_b port map(a => MW, b => wq, r => w16);
AND_17: AND_b port map(a => MW, b => wr, r => w17);
AND_18: AND_b port map(a => MW, b => ws, r => w18);
AND_19: AND_b port map(a => MW, b => wt, r => w19);
AND_20: AND_b port map(a => MW, b => wu, r => w20);
AND_21: AND_b port map(a => MW, b => ww, r => w21);
AND_22: AND_b port map(a => MW, b => wx, r => w22);
AND_23: AND_b port map(a => MW, b => wy, r => w23);
AND_24: AND_b port map(a => MW, b => wz, r => w24);
AND_25: AND_b port map(a => MW, b => wa1, r => w25);
AND_26: AND_b port map(a => MW, b => wb1, r => w26);
AND_27: AND_b port map(a => MW, b => wc1, r => w27);
AND_28: AND_b port map(a => MW, b => wd1, r => w28);
AND_29: AND_b port map(a => MW, b => we1, r => w29);
AND_30: AND_b port map(a => MW, b => wf1, r => w30);
AND_31: AND_b port map(a => MW, b => wg1, r => w31);

-- Implementar los Registros
Registro_0: Registro_8_Bits port map(D => Datos_in, w => w0, clk => clk, Q => R0);
Registro_1: Registro_8_Bits port map(D => Datos_in, w => w1, clk => clk, Q => R1);
Registro_2: Registro_8_Bits port map(D => Datos_in, w => w2, clk => clk, Q => R2);
Registro_3: Registro_8_Bits port map(D => Datos_in, w => w3, clk => clk, Q => R3);
Registro_4: Registro_8_Bits port map(D => Datos_in, w => w4, clk => clk, Q => R4);
Registro_5: Registro_8_Bits port map(D => Datos_in, w => w5, clk => clk, Q => R5);
Registro_6: Registro_8_Bits port map(D => Datos_in, w => w6, clk => clk, Q => R6);
Registro_7: Registro_8_Bits port map(D => Datos_in, w => w7, clk => clk, Q => R7);
Registro_8: Registro_8_Bits port map(D => Datos_in, w => w8, clk => clk, Q => R8);
Registro_9: Registro_8_Bits port map(D => Datos_in, w => w9, clk => clk, Q => R9);
Registro_10: Registro_8_Bits port map(D => Datos_in, w => w10, clk => clk, Q => R10);
Registro_11: Registro_8_Bits port map(D => Datos_in, w => w11, clk => clk, Q => R11);
Registro_12: Registro_8_Bits port map(D => Datos_in, w => w12, clk => clk, Q => R12);
Registro_13: Registro_8_Bits port map(D => Datos_in, w => w13, clk => clk, Q => R13);
Registro_14: Registro_8_Bits port map(D => Datos_in, w => w14, clk => clk, Q => R14);
Registro_15: Registro_8_Bits port map(D => Datos_in, w => w15, clk => clk, Q => R15);
Registro_16: Registro_8_Bits port map(D => Datos_in, w => w16, clk => clk, Q => R16);
Registro_17: Registro_8_Bits port map(D => Datos_in, w => w17, clk => clk, Q => R17);
Registro_18: Registro_8_Bits port map(D => Datos_in, w => w18, clk => clk, Q => R18);
Registro_19: Registro_8_Bits port map(D => Datos_in, w => w19, clk => clk, Q => R19);
Registro_20: Registro_8_Bits port map(D => Datos_in, w => w20, clk => clk, Q => R20);
Registro_21: Registro_8_Bits port map(D => Datos_in, w => w21, clk => clk, Q => R21);
Registro_22: Registro_8_Bits port map(D => Datos_in, w => w22, clk => clk, Q => R22);
Registro_23: Registro_8_Bits port map(D => Datos_in, w => w23, clk => clk, Q => R23);
Registro_24: Registro_8_Bits port map(D => Datos_in, w => w24, clk => clk, Q => R24);
Registro_25: Registro_8_Bits port map(D => Datos_in, w => w25, clk => clk, Q => R25);
Registro_26: Registro_8_Bits port map(D => Datos_in, w => w26, clk => clk, Q => R26);
Registro_27: Registro_8_Bits port map(D => Datos_in, w => w27, clk => clk, Q => R27);
Registro_28: Registro_8_Bits port map(D => Datos_in, w => w28, clk => clk, Q => R28);
Registro_29: Registro_8_Bits port map(D => Datos_in, w => w29, clk => clk, Q => R29);
Registro_30: Registro_8_Bits port map(D => Datos_in, w => w30, clk => clk, Q => R30);
Registro_31: Registro_8_Bits port map(D => Datos_in, w => w31, clk => clk, Q => R31);

--MUX de Salidas
Mux_32_a_18Bits_F: Mux_32_a_18Bits port map (A => R0, B => R1, C => R2, D => R3, E => R4, F => R5, G => R6, H => R7, I => R8, J => R9,
	K => R10, L => R11, M => R12, N => R13, O => R14, P => R15, Q => R16, R => R17, Si => R18, T => R19, U => R20, W => R21, X => R22, Y => R23, Z => R24,
	A1 => R25, B1 => R26, C1 => R27, D1 => R28, E1 => R29, F1 => R30, G1 => R31, S => Dir, Rout => Datos_out);

end Mem_Datos;