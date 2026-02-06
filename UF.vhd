--La UF se comnpone de la ALU, el Shifter y de Mux2a1, al igual que Mux2a18Bits.
--La ALU posee als operaciones aritmeticas y logicas vistas en clase, la forma de utilizarlas es con el bit S(4) == 0 (0BBBB para B siendo 0 o 1).
--El Shifter nos permite realizar operaciones especiales, tales como:
	-- El desplazamiento a la izaquierda '10000' 
	-- El desplazamiento a la derecha '10001' 
	-- El desplazamiento a la Rotacion derecha '10010' 
	-- El desplazamiento a la Rotacion izaquierda '10011'
--El Shifer se utiliza cuando S(4) == 1.	

--Con los mux: Mux_2_a_1_C y Mux_2_a_1_Co se decide que "Cout" saldra, el del ALU o del Shifer

--Con los mux: Mux2a1_S_CMP, Mux2a1_Z_CMP y Mux2a1_C_CMP podemos elegir que salidas queremos para las banderas de estado.
--Si para los mux, tenemos a s == 0, saldran las banderas de estado de las operaciones de la ALU o del Shifter dependiendo de la operacion.
--Si para los mux, tenemos a s == 1, saldran las banderas de estado de la operacion de la resta entre A y B (A - B), esto lo hacemos especificamente para la operacion CMP (Comparacion).
--CMP solo se activa cuando S = "11001".

library IEEE;
use IEEE.std_logic_1164.all;

entity UF is
	port(
	A, B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (4 downto 0);
	carry_in: in std_logic;
	Cout,V,Z,Signo: out std_logic;
	Rout: out std_logic_vector (7 downto 0));
end UF;

architecture UF of UF is

component ALU is
	port(
	A, B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (3 downto 0);
	carry_in: in std_logic;
	Carreo,Vover,Ze,Sig,Zecmp,Sigcmp: out std_logic;
	R: out std_logic_vector (7 downto 0));
end component;

component Shifter is
	port(
	Ain: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (1 downto 0);
	Cl,Cr: out std_logic;
	R: out std_logic_vector (7 downto 0));
end component;

component Mux2a1
	port (
	a, b, s: in std_logic;
	r: out std_logic);
end component;

component Mux2a18Bits
	port (
	A, B: in std_logic_vector (7 downto 0);
	s: in std_logic;
	R: out std_logic_vector (7 downto 0));
end component;

signal R1: std_logic_vector (7 downto 0);
signal R2: std_logic_vector (7 downto 0);

signal C_ALU: std_logic;
signal C_Shifter: std_logic;

signal C_left: std_logic;
signal C_right: std_logic;

signal CMP: std_logic;

signal Z_ALU: std_logic; --Zero de la UF
signal S_ALU: std_logic; --Signo de la UF

signal Z_UA: std_logic; --Zero de la UA operacion (001)
signal S_UA: std_logic; --Signo de la UA operacion (001)

signal C_UF: std_logic;

begin
CMP <= (S(4) and S(3) and (not S(2)) and (not S(1)) and S(0));

ALU_UF: ALU port map(A => A, B => B, S(0) => S(0), S(1) => S(1), S(2) => S(2), S(3) => S(3), carry_in => carry_in,
Carreo => C_ALU, Vover => V, Ze => Z_ALU, Sig => S_ALU, Zecmp => Z_UA, Sigcmp => S_UA, R => R1);
Shifter_UF: Shifter port map(Ain => A, S(0) => S(0), S(1) => S(1), Cl => C_left, Cr => C_right, R => R2);

Mux_2_a_1_C: Mux2a1 port map(a => C_left, b => C_right, s => S(0), r => C_Shifter);
Mux_2_a_1_Co: Mux2a1 port map(a => C_ALU, b => C_Shifter, s => S(4), r => C_UF);

Mux2a1_S_CMP: Mux2a1 port map(a => S_ALU, b => S_UA, s => CMP, r => Signo);
Mux2a1_Z_CMP: Mux2a1 port map(a => Z_ALU, b => Z_UA, s => CMP, r => Z);
Mux2a1_C_CMP: Mux2a1 port map(a => C_UF, b => C_ALU, s => CMP, r => Cout);

Mux_2_a_1_UF: Mux2a18Bits port map(A => R1, B => R2, s => S(4), R => Rout);

end UF;