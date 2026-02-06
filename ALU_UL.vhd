--En ALU_UL se realizan una variedad de operaciones logicas, mismas que en este caso se hacen por medio de componentes, mismas que tienen la misma funcion que una compuerta, pero aplicado a 8bits.
--Se realizan las operaciones correspondientes, y al final por medio de un Mux8a18Bits dan el resultado.

library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_UL is
	port(
	A,B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);	
	R: out std_logic_vector (7 downto 0);
	signo,zero: out std_logic);
end ALU_UL;

architecture ALU_UL of ALU_UL is

component AND_8bits
	port(
	A, B: in std_logic_vector (7 downto 0);
	R1: out std_logic_vector (7 downto 0));
end component;

component OR_8bits
	port(
	A, B: in std_logic_vector (7 downto 0);
	R2: out std_logic_vector (7 downto 0));
end component;

component NOT_A_8bits
	port(
	A: in std_logic_vector (7 downto 0);
	R3: out std_logic_vector (7 downto 0));
end component;

component XOR_8bits
	port(
	A, B: in std_logic_vector (7 downto 0);
	R4: out std_logic_vector (7 downto 0));
end component;

component NOR_8bits
	port(
	A, B: in std_logic_vector (7 downto 0);
	R5: out std_logic_vector (7 downto 0));
end component;

component NAND_8bits
	port(
	A, B: in std_logic_vector (7 downto 0);
	R6: out std_logic_vector (7 downto 0));
end component;

component NXOR_8bits
	port(
	A, B: in std_logic_vector (7 downto 0);
	R7: out std_logic_vector (7 downto 0));
end component;

component NOT_B_8bits
	port(
	B: in std_logic_vector (7 downto 0);
	R8: out std_logic_vector (7 downto 0));
end component;

component Mux8a18Bits
	port (
	A, B, C, D, E, F, G, H: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	R: out std_logic_vector (7 downto 0));
end component;

signal Ain: std_logic_vector (7 downto 0);
signal Bin: std_logic_vector (7 downto 0);
signal Cin: std_logic_vector (7 downto 0);
signal Din: std_logic_vector (7 downto 0);
signal Ein: std_logic_vector (7 downto 0);
signal Fin: std_logic_vector (7 downto 0);
signal Gin: std_logic_vector (7 downto 0);
signal Hin: std_logic_vector (7 downto 0);

signal Rout: std_logic_vector (7 downto 0);

begin

	ANDIN: AND_8bits port map(A => A, B => B, R1 => Ain);
	ORIN: OR_8bits port map(A => A, B => B, R2 => Bin);
	NOTA: NOT_A_8bits port map(A => A, R3 => Cin);
	XORIN: XOR_8bits port map(A => A, B => B, R4 => Din);
	NORIN: NOR_8bits port map(A => A, B => B, R5 => Ein);
	NANDIN: NAND_8bits port map(A => A, B => B, R6 => Fin);
	NXORIN: NXOR_8bits port map(A => A, B => B, R7 => Gin);
	NOTB: NOT_B_8bits port map(B => B, R8 => Hin);
	
	Mux_8_a_1: Mux8a18Bits port map(A => Ain, B => Bin, C => Cin, D => Din, E => Ein, F => Fin, G => Gin, H => Hin, S => S, R => Rout);
	
	R <= Rout;
	signo <= Rout(7);
	zero <= not (Rout(0) or Rout(1) or Rout(2) or Rout(3) or Rout(4) or Rout(5) or Rout(6) or Rout(7));

end ALU_UL;