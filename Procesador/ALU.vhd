--La ALU se encarga de realizar operaciones aritmeticas y logicas basicas, esta ALU en especifico se compone de varias partes.

--ALU_UA en este componente estan presentes las ecuaciones booleanas que nos permiten realizar las multiples operaciones que estan en nuestra ALU:
	--ADD '+' "0000"
	--SUB '-' "0001"
	--INC 'A++' "0010"
	--DEC 'A--' "0011"
	--MOV 'TA' "0100"
	--LTD 'TB' "0101"
	--ADC 'A + B + Carry' "0110"
	--XXX 'X' "0111"

--ALU_UA_F es un componente en el cual estan presentes el ALU_UA, un Mux2a1, y un Sumador8Bits, aqui ya se realizan las operaciones que son descritas por las ecuaciones dadas en ALU_UA.
	--Con el Mux2a1 se introduce el 'ci' (Dado por las ecuaciones booleanas) por un lado, y el 'carry_in' (Dado por las operaciones que se hacen en el Datapath), que nos permite realizar operaciones especeificas.

--ALU_UL es un componente en el cual se realizan las diferentes opercaiones logicas:
	--AND 'A and B' "0000"
	--OR 'A or B' "1001"
	--NOT A 'not(A)' "1010"
	--XOR 'A xor B' "1011"
	--NOR 'not(A or B)' "1100"
	--NAND 'not(A and B)' "1101"
	--xnor 'not(A xor B)' "1110"
	--XXX 'X' "111"

--Para la ALU, tenemos que para el bit S(3), si S(3) == 0, entonces el resultado seran los hechos con la UA.
--Si S(3) == 1, entonces el resultado seran los hechos con la UL.
--Esto lo hacemos con el Mux2a18Bits, que nos da el resultado de la ALU.

library IEEE;
use IEEE.std_logic_1164.all;

entity ALU is
	port(
	A, B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (3 downto 0);
	carry_in: in std_logic;
	Carreo,Vover,Ze,Sig,Zecmp,Sigcmp: out std_logic;
	R: out std_logic_vector (7 downto 0));
end ALU;

architecture ALU of ALU is

component ALU_UA_F
	port(
	A,B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	carry_in: in std_logic;
	Rout: out std_logic_vector (7 downto 0); 
	carry: out std_logic;
	signo: out std_logic;
	vout: out std_logic;
	zero: out std_logic);
end component;

component ALU_UL
	port(
	A,B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	R: out std_logic_vector (7 downto 0);
	signo,zero: out std_logic);
end component;

component Mux2a18Bits is
	port (
	A, B: in std_logic_vector (7 downto 0);
	s: in std_logic;
	R: out std_logic_vector (7 downto 0));
end component;

signal R1: std_logic_vector (7 downto 0);
signal R2: std_logic_vector (7 downto 0);
signal R3: std_logic_vector (7 downto 0);

signal C: std_logic;
signal V: std_logic;

signal signo1: std_logic; --Bandera Signo de la UA
signal signo2: std_logic; --Bandera Signo de la UL
signal zero1: std_logic; --Bandera Zero de la UA
signal zero2: std_logic; --Bandera Zero de la UL

begin
	ALU_UA_Final: ALU_UA_F port map(A => A, B => B, S(0) => S(0), S(1) => S(1), S(2) => S(2), carry_in => carry_in, Rout => R1, carry => C, signo => signo1, vout => V, zero => zero1);
	ALU_UL_Final: ALU_UL port map(A => A, B => B, S(0) => S(0), S(1) => S(1), S(2) => S(2), R => R2, signo => signo2, zero => zero2);
	Mux_2_a_1_Salida: Mux2a18Bits port map(A => R1, B => R2, s => S(3), R => R3);
	
	Carreo <= C; --Salida de la bandera Carry
	Vover <= V; --Salida de la bandera V
	Ze <= ((zero1 and not(S(3))) or (zero2 and S(3))); --Salida de la bandera Zero
	Sig <= ((signo1 and not(S(3))) or (signo2 and S(3))); --Salida de la bandera Signo
	Zecmp <= (zero1); --Salida de la bandera Zero para CMP
	Sigcmp <= (signo1); --Salida de la bandera Signo para CMP
	R <= R3;
end ALU;