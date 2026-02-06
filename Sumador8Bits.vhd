library IEEE;
use IEEE.std_logic_1164.all;


entity Sumador8Bits is
	port (A, B: in std_logic_vector (7 downto 0);
	ci: in std_logic;
	R: out std_logic_vector (7 downto 0); 
	c: out std_logic;
	s: out std_logic;
	v: out std_logic;
	z: out std_logic);
end Sumador8Bits;
 
architecture Ar_Sumador8Bits of Sumador8Bits is
 
component FA
   port (a, b, ci: in std_logic;
   r, co: out std_logic);
end component;

signal Cx : std_logic_vector (7 downto 0);
signal Rx : std_logic_vector (7 downto 0);

begin

	Sumador0: FA port map (A(0), B(0), ci => ci, r => Rx(0), co => Cx(0)); 
	Sumador1: FA port map (A(1), B(1), Cx(0), r => Rx(1), co => Cx(1)); 
	Sumador2: FA port map (A(2), B(2), Cx(1), r => Rx(2), co => Cx(2)); 
	Sumador3: FA port map (A(3), B(3), Cx(2), r => Rx(3), co => Cx(3)); 
	Sumador4: FA port map (A(4), B(4), Cx(3), r => Rx(4), co => Cx(4)); 
	Sumador5: FA port map (A(5), B(5), Cx(4), r => Rx(5), co => Cx(5)); 
	Sumador6: FA port map (A(6), B(6), Cx(5), r => Rx(6), co => Cx(6)); 
	Sumador7: FA port map (A(7), B(7), Cx(6), r => Rx(7), co => Cx(7)); 
	c <= Cx(7);
	v <= Cx(7) xor Cx(6);
	R <= Rx;
	s <= Rx(7);
	z <= not (Rx(0) or Rx(1) or Rx(2) or Rx(3) or Rx(4) or Rx(5) or Rx(6) or Rx(7));
end Ar_Sumador8Bits;
 
 
 
 
 