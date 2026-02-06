--Este deriva de la Mem_Datos original, con la diferencia de que esta extendida, pasando de 32 registros a 256 registro,
--esto se logro al colocar 8 Mem_Datos, y por medio de un Demux_1a8_8bits seleccionar para que direccion se almacenara "Datos_in".

--La razon de utiliza el Demux_1a8_8bits es para que un mismo valor pueda salir por 8 salidas diferentes, esto lo hacemos para que el valor "Datos_in" pueda ir a cualquiera de las memorias.
--Y con el uso de "Dir" poder almacenarlo en una en especifico, sin afectar a las demas, esto por medio de MWR.

library IEEE;
use IEEE.std_logic_1164.all;

entity Mem_Datos_256R is
	port(
	Datos_in: in std_logic_vector (7 downto 0);
	Dir: in std_logic_vector (7 downto 0);
	MW: in std_logic;
	clk: in std_logic;
	Datos_out: out std_logic_vector (7 downto 0));
end Mem_Datos_256R;

architecture Mem_Datos_256R of Mem_Datos_256R is

component Demux_1a8_8bits
	port(
	Valor_in: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	A, B, C, D, E, F, G, H: out std_logic_vector (7 downto 0));
end component;

component Mux8a18Bits
	port (
	A, B, C, D, E, F, G, H: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (2 downto 0);
	R: out std_logic_vector (7 downto 0));
end component;

component Mem_Datos is
	port(
	Datos_in: in std_logic_vector (7 downto 0);
	Dir: in std_logic_vector (4 downto 0);
	MW: in std_logic;
	clk: in std_logic;
	Datos_out: out std_logic_vector (7 downto 0));
end component;

--Señales para de salida para el Demux_1a8_8bits
signal Ain, Bin, Cin, Din, Ein, Fin, Gin, Hin: std_logic_vector (7 downto 0);

--MWR nos sirve para poder seleccionar en que memoria queremos que se almacenen los datos
signal MWR: std_logic_vector (7 downto 0);

--Señales para las salidas de las memorias
signal Mem_out0: std_logic_vector (7 downto 0);
signal Mem_out1: std_logic_vector (7 downto 0);
signal Mem_out2: std_logic_vector (7 downto 0);
signal Mem_out3: std_logic_vector (7 downto 0);
signal Mem_out4: std_logic_vector (7 downto 0);
signal Mem_out5: std_logic_vector (7 downto 0);
signal Mem_out6: std_logic_vector (7 downto 0);
signal Mem_out7: std_logic_vector (7 downto 0);

begin

--Señales de seleccion para Mem_Datos
MWR(0) <= MW and not(Dir(5)) and not(Dir(6)) and not(Dir(7));
MWR(1) <= MW and Dir(5) and not(Dir(6)) and not(Dir(7));
MWR(2) <= MW and not(Dir(5)) and Dir(6) and not(Dir(7));
MWR(3) <= MW and Dir(5) and Dir(6) and not(Dir(7));
MWR(4) <= MW and not(Dir(5)) and not(Dir(6)) and Dir(7);
MWR(5) <= MW and Dir(5) and not(Dir(6)) and Dir(7);
MWR(6) <= MW and not(Dir(5)) and Dir(6) and Dir(7);
MWR(7) <= MW and Dir(5) and Dir(6) and Dir(7);

--Deco
Demux_1a8_8bits_F: Demux_1a8_8bits port map(Valor_in => Datos_in, S(2) => Dir(7), S(1) => Dir(6), S(0) => Dir(5), A => Ain,
 B => Bin, C => Cin, D => Din, E => Ein, F => Fin, G => Gin, H => Hin);

--Memorias, 8 * 32 = 256 registros
Mem_Datos_0: Mem_Datos port map(Datos_in => Ain, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(0), clk => clk, Datos_out => Mem_out0);
Mem_Datos_1: Mem_Datos port map(Datos_in => Bin, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(1), clk => clk, Datos_out => Mem_out1);
Mem_Datos_2: Mem_Datos port map(Datos_in => Cin, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(2), clk => clk, Datos_out => Mem_out2);
Mem_Datos_3: Mem_Datos port map(Datos_in => Din, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(3), clk => clk, Datos_out => Mem_out3);
Mem_Datos_4: Mem_Datos port map(Datos_in => Ein, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(4), clk => clk, Datos_out => Mem_out4);
Mem_Datos_5: Mem_Datos port map(Datos_in => Fin, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(5), clk => clk, Datos_out => Mem_out5);
Mem_Datos_6: Mem_Datos port map(Datos_in => Gin, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(6), clk => clk, Datos_out => Mem_out6);
Mem_Datos_7: Mem_Datos port map(Datos_in => Hin, Dir(4) => Dir(4), Dir(3) => Dir(3), Dir(2) => Dir(2), Dir(1) => Dir(1), Dir(0) => Dir(0), MW => MWR(7), clk => clk, Datos_out => Mem_out7);

--MUX de Salidas
Mux8a18Bits_F: Mux8a18Bits port map(A => Mem_out0, B => Mem_out1, C => Mem_out2, D => Mem_out3, E => Mem_out4, F => Mem_out5, G => Mem_out6, H => Mem_out7, S(2) => Dir(7), S(1) => Dir(6), S(0) => Dir(5), R => Datos_out);

end Mem_Datos_256R;