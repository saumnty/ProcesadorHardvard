--En ALU_UA se realizan las operaciones booleanas para las operaciones aritmeticas.

library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_UA is
	port(
	A,B: in std_logic;
	S: in std_logic_vector (2 downto 0);
	fi,gi: out std_logic;
	ci: out std_logic);
end ALU_UA;

architecture ALU_UA of ALU_UA is

begin
	fi <= ((not(S(0)) or (not(S(2))))and A);
	gi <= ((((not(S(2)) and not(S(1)) and not(S(0)))or(S(2) and not(S(1)) and S(0))or(S(2) and S(1) and not(S(0))))and B)or((not(S(2)) and not(S(1)) and S(0))and not(B))or(not(S(2)) and S(1) and S(0)));
	ci <= ((not(S(2)) and not(S(1)) and S(0)) or (not(S(2)) and S(1) and not(S(0))));
end ALU_UA;