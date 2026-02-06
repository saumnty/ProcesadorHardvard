library IEEE;
use IEEE.std_logic_1164.all;

entity Registro_banderas is
	port(
	WE: in std_logic;
	clk: in std_logic;
	C_in, V_in, S_in, Z_in : in std_logic;
    C_out, V_out, S_out, Z_out : out std_logic);
end Registro_banderas;

architecture Registro_banderas of Registro_banderas is

component FFDw
	port (
	d, w, clk: in std_logic;
	q: out std_logic);
end component; 

begin

Registro_C: FFDw port map(d => C_in, w => WE, clk => clk, q => C_out);
Registro_V: FFDw port map(d => V_in, w => WE, clk => clk, q => V_out);
Registro_S: FFDw port map(d => S_in, w => WE, clk => clk, q => S_out);
Registro_Z: FFDw port map(d => Z_in, w => WE, clk => clk, q => Z_out);

end Registro_banderas;