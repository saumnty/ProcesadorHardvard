--La ALU_UA_F es la combinacion de la ALU_UA_8bits, un Sumador8Bits y un Mux2a1.
--ALU_UA_8bits nos devuelve las operaciones en 8 bits.
--Con el Sumador8Bits realizamos las operaciones dadas por ALU_UA_8bits.
--Con el Mux2a1 nos permite, ademas de introducir el 'ci' dado por la ALU_UA_8bits, tambien nos permite introducir un 'carry_in' el cual lo utilizamos para hacer operaciones mas complejas
--generalmente la suma con 'carry_in' solo ocurre cuando S := "110".

library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_UA_F is
	port(
	A,B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	carry_in: in std_logic;
	Rout: out std_logic_vector (7 downto 0); 
	carry: out std_logic;
	signo: out std_logic;
	vout: out std_logic;
	zero: out std_logic);
end ALU_UA_F;

architecture ALU_UA_F of ALU_UA_F is

component ALU_UA_8bits 
	port(
	A,B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	F,G: out std_logic_vector (7 downto 0);
	ci: out std_logic);
end component;

component Sumador8Bits is
	port (A, B: in std_logic_vector (7 downto 0);
	ci: in std_logic;
	R: out std_logic_vector (7 downto 0); 
	c: out std_logic;
	s: out std_logic;
	v: out std_logic;
	z: out std_logic);
end component;

component Mux2a1
	port (
	a, b, s: in std_logic;
	r: out std_logic);
end component;

signal Fi: std_logic_vector (7 downto 0);
signal Gi: std_logic_vector (7 downto 0);

signal Ri:  std_logic_vector (7 downto 0); 
signal Ci:  std_logic;
signal Co:  std_logic;
signal Si:  std_logic;
signal Vi:  std_logic;
signal Zi:  std_logic;

signal Cinsert:  std_logic;
signal Cinout:  std_logic;

begin

	Cinsert <= (S(2) and S(1)); --Señal para el Mux2a1 del carry

	ALU_Pre_F: ALU_UA_8bits port map(A => A, B => B, S => S, F => Fi, G => Gi, ci => CI);
	Mux2a1_F: Mux2a1 port map(a => CI, b => carry_in, s => Cinsert, r => Cinout);
	Sumador_F: Sumador8Bits port map(A => Fi, B => Gi, ci => Cinout, R => Ri, c => Co, s => Si, v => Vi, z => Zi);
	Rout <= Ri;
    carry <= Co;
    signo <= Si;
    vout <= Vi;
    zero <= Zi;
end ALU_UA_F;