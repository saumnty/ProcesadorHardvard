--La ALU_UA_8bits nos permite realizar el mismo proceso de ALU_UA en 8bits. 

library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_UA_8bits is
	port(
	A,B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	F,G: out std_logic_vector (7 downto 0);
	ci: out std_logic);
end ALU_UA_8bits;

architecture ALU_UA_8bits of ALU_UA_8bits is

component ALU_UA
	port(
	A,B: in std_logic;
	S: in std_logic_vector (2 downto 0);
	fi,gi: out std_logic;
	ci: out std_logic);
end component;

begin
ALU_UA_0: ALU_UA port map(A => A(0), B => B(0), S => S, fi => F(0), gi => G(0), ci => ci);
ALU_UA_1: ALU_UA port map(A => A(1), B => B(1), S => S, fi => F(1), gi => G(1), ci => ci);
ALU_UA_2: ALU_UA port map(A => A(2), B => B(2), S => S, fi => F(2), gi => G(2), ci => ci);
ALU_UA_3: ALU_UA port map(A => A(3), B => B(3), S => S, fi => F(3), gi => G(3), ci => ci);
ALU_UA_4: ALU_UA port map(A => A(4), B => B(4), S => S, fi => F(4), gi => G(4), ci => ci);
ALU_UA_5: ALU_UA port map(A => A(5), B => B(5), S => S, fi => F(5), gi => G(5), ci => ci);
ALU_UA_6: ALU_UA port map(A => A(6), B => B(6), S => S, fi => F(6), gi => G(6), ci => ci);
ALU_UA_7: ALU_UA port map(A => A(7), B => B(7), S => S, fi => F(7), gi => G(7), ci => ci);
end ALU_UA_8bits;