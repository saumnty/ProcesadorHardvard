--Este es el Datapath, aqui se realizan las operaciones que hemos visto hasta el moemnto, desde las aritmeticas y logicas, hasta las del shifter, o de comparacion.
--De igual manera, debido a que esta presente la Mem_Datos_256R, podemos alamcenar datos a la memoria.

--En este Datapath, ademas de estar la UR_Complete y la UF, tambien hay mux, mismos que nos permiten utilizar ciertos datos de los componentes
--presentes en este Datapath, a la vez de utilizar del Datapath_PC, por ejemplo el indmediato. 

library IEEE;
use IEEE.std_logic_1164.all;

entity Datapath is
	port(
	Inmediato: in std_logic_vector (7 downto 0); --Valor dado por el usuario, generalmente en la IR
	Da,Db,Dc: in std_logic_vector (2 downto 0); --Señales para interactuar con la UR
	W,WE,MI,MM,MW: in std_logic; --Señales de escritura: W, WE y MW. Señales de muxes: MI y MM
	clk: in std_logic;
	Selector: in std_logic_vector (4 downto 0); --Para controlar las instrucciones que queremos hacer
	Carry_out,Vo_out,Zero_out,Signo_out: out std_logic; --Banderas de Estado
	SV: out std_logic;
	Result: out std_logic_vector (7 downto 0));
end Datapath;

architecture Datapath of Datapath is

component UR_Complete
	port(
	CIN: in std_logic_vector (7 downto 0);
	Da,Db,Dc: in std_logic_vector (2 downto 0);
	W: in std_logic; --Señal de escritura para La UR
	clk: in std_logic;
	Ain,Bin: out std_logic_vector (7 downto 0));
end component;

component UF
	port(
	A, B: in std_logic_vector (7 downto 0);
	S: in std_logic_vector (4 downto 0);
	carry_in: in std_logic;
	Cout,V,Z,Signo: out std_logic;
	Rout: out std_logic_vector (7 downto 0));
end component;

component Mem_Datos_256R
	port(
	Datos_in: in std_logic_vector (7 downto 0);
	Dir: in std_logic_vector (7 downto 0);
	MW: in std_logic; --Señal de escritura para la Mem_Datos_256R
	clk: in std_logic;
	Datos_out: out std_logic_vector (7 downto 0));
end component;

component Mux2a18Bits
	port (
	A, B: in std_logic_vector (7 downto 0);
	s: in std_logic;
	R: out std_logic_vector (7 downto 0));
end component;

component Salto_Valido
	port(
	Carry,Signo,V,Zero: in std_logic;
	S: in std_logic_vector (2 downto 0);
	SV: out std_logic);
end component;

component Registro_banderas
	port(
	WE: in std_logic; --Señal de escritura de el Registro_banderas
	clk: in std_logic;
	C_in, V_in, S_in, Z_in : in std_logic;
    C_out, V_out, S_out, Z_out : out std_logic);
end component;

signal Resultado_UF: std_logic_vector (7 downto 0); --Valor del resultado de la UF
signal A_UnidadRegistros: std_logic_vector (7 downto 0); --Valor A de la UR
signal B_UnidadRegistros: std_logic_vector (7 downto 0); --Valor B de la UR

signal Mem_Datos_Out: std_logic_vector (7 downto 0); --Valor de salida de la Mem_Datos_256R

signal Mux_MI: std_logic_vector (7 downto 0); --Valor resultante de Mux_2_a_1_MI
signal Mux_MM: std_logic_vector (7 downto 0); --Valor resultante de Mux_2_a_1_MM

signal Ca,Vo,Ze,Sig: std_logic;
signal CaR,VoR,ZeR,SigR: std_logic;

begin
Mux_2_a_1_MI: Mux2a18Bits port map(A => B_UnidadRegistros, B => Inmediato, s => MI, R => Mux_MI); --Nos permite elegir entre un registro de la UR, o un Inmediato.
Mux_2_a_1_MM: Mux2a18Bits port map(A => Resultado_UF, B => Mem_Datos_Out, s => MM, R => Mux_MM); --Nos permite elegir almacenar un valor de UF, o uno de la Mem_Datos_256R

Mem_Datos_F: Mem_Datos_256R port map(Datos_in => A_UnidadRegistros, Dir => Mux_MI, MW => MW, clk => clk, Datos_out => Mem_Datos_Out); --La Memoria de datos

UR_Complete_P: UR_Complete port map(CIN => Mux_MM, Da => Da, Db => Db, Dc => Dc, W => W, clk => clk, Ain => A_UnidadRegistros, Bin => B_UnidadRegistros);

UF_P: UF port map(A => A_UnidadRegistros, B => Mux_MI, S => Selector, carry_in => Ca, Cout => Ca, V => Vo, Z => Ze, Signo => Sig, Rout => Resultado_UF);

Registro_banderas_F: Registro_banderas port map(WE => WE, clk => clk, C_in => Ca, V_in => Vo, S_in => Sig, Z_in => Ze, C_out => CaR, V_out => VoR, S_out => SigR, Z_out => ZeR);

Salto_Valido_F: Salto_Valido port map(Carry => CaR, Signo => SigR, V => VoR, Zero => ZeR, S(2) => Selector(3), S(1) => Selector(1), S(0) => Selector(0), SV => SV);

Carry_out <= (CaR);
Vo_out <= (VoR);
Zero_out <= (ZeR);
Signo_out <= (SigR);

Result <= Resultado_UF;
end Datapath;