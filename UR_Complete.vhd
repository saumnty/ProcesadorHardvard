--UR_Complete Ademas de contener a UR_In, lo cual significa que podemos por medio de Dc y W, almacenar un valor C en lagun registro.
--La UR_Complete se podria considerar una Unidad de Regitros, en esta ademas de almacenar un valor C en el registro que queramos, podemos tambien dar como salida de la entidad a un valor A, o un valor B, o a ambos.
--Por medio de Da y un Mux8a18Bits denominado Mux_8_a_1_A, podemos selecionar un valor almacenado en los registros para que salga por la salida A.
--Mientras que por medio de Db y un Mux8a18Bits denominado Mux_8_a_1_B, podemos selecionar un valor almacenado en los registros para que salga por la salida B.

--De esta forma podemos elegir que valores se guardan y en donde, por medio de W y Dc, y podemos decidr que valores salen de las unidad por medio de Da y Db.
--Por ejemplo:
--C := "00001000", Dc := "001" W := '1', Da := "001", Db := "000". En esta pruba, se almacena el valor '8' en el registro 'R1',
--mismo valor que sale por la salida 'A', mietras que por la salida 'B' no hay ningun valor (puede ser basura).
--Entonces tenemos: A == 8; B == X.

library IEEE;
use IEEE.std_logic_1164.all;

entity UR_Complete is
	port(
	CIN: in std_logic_vector (7 downto 0);
	Da,Db,Dc: in std_logic_vector (2 downto 0);
	W: in std_logic;
	clk: in std_logic;
	Ain,Bin: out std_logic_vector (7 downto 0));
end UR_Complete;

architecture UR_Complete of UR_Complete is

component UR_In
	port(
	C: in std_logic_vector (7 downto 0);
	Dc: in std_logic_vector (2 downto 0);
	W: in std_logic;
	clk: in std_logic;
	R0,R1,R2,R3,R4,R5,R6,R7: out std_logic_vector (7 downto 0)
	);
end component;

component Mux8a18Bits
	port (
	A, B, C, D, E, F, G, H: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	R: out std_logic_vector (7 downto 0));
end component;

-- Señales de Resultado
signal At: std_logic_vector (7 downto 0);
signal Bt: std_logic_vector (7 downto 0);
signal Ct: std_logic_vector (7 downto 0);
signal Dt: std_logic_vector (7 downto 0);
signal Et: std_logic_vector (7 downto 0);
signal Ft: std_logic_vector (7 downto 0);
signal Gt: std_logic_vector (7 downto 0);
signal Ht: std_logic_vector (7 downto 0);

begin
UR_In_F: UR_In port map(C => CIN, Dc => Dc, W => W, clk => clk, R0 => At, R1 => Bt, R2 => Ct, R3 => Dt, R4 => Et, R5 => Ft, R6 => Gt, R7 => Ht);
Mux_8_a_1_A: Mux8a18Bits port map(A => At, B => Bt, C => Ct, D => Dt, E => Et, F => Ft, G => Gt, H => Ht, S => Da, R => Ain);
Mux_8_a_1_B: Mux8a18Bits port map(A => At, B => Bt, C => Ct, D => Dt, E => Et, F => Ft, G => Gt, H => Ht, S => Db, R => Bin);
end UR_Complete;