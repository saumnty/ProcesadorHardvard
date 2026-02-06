--En este Datapath_PC se juntan los componentes necesarios para crear la parte del procesador que da las instrucciones al Datapath.
--Este se comforma de: PC, RegistroIR, RegistroCW y de la Mem_Codigos.
--El Datapath funciona entorno a pasos:
	-- 1.- La Mem_Codigos da el codigo seleccionado por el valor de los primeros 4 bits de PC, mismo que pasaran al RegistroIR.
	-- 2.- De el RegistroIR saldran 24 bits de salida, algunos de estos pasaran por las señales A, B y C,
	--mismas que nos permitiran crear otras 3 señales, junstas serian 27 señales, mismas que serian utilizadas como entradas para CW.
	-- 3.- En CW se almacenan las diferentes señales que contienen las salidas del RegistroIR, asi como las obtenidas de A, B y de C.
	-- 4.- De Cw saldran las señales que ese utilizaran en el Datapath, como el inmediato, el cual tambien puede ocuparse en PC.
	-- 4_1.- De las salidas de CW, tambien se forman señales especeiales, como es el caso dde 'J'. el cual nos permite dar un salto, alterando a PC.
	-- 5.- Pasamos a PC, en donde PC aumenta en 1 bit, o en el caso de que se cumplan diferentes caracteristicas, se sume un inmediato.
	-- 6.- PC se actualiza, y sus primeros 4 bits entran a Mem_Codigos, empezando nuevamente.

--Basicamente, de la Mem_Codigos sale una instruccion de 21 bits, entra a RegistroIR y sale un codigo de 24 bits,
--de esos 24 bits, 5 bits que corresponden a 'S' son utilizados para las señales a,b y c para tener un codigo de 27 bits,
--este codigo es conocido como la Palabra de Control, mismo que es almacenado en CW y cuyos valores son enviados al Datapath para realizar pasos especificos,
--y dependiendo de 'J', incrementar en 1 bita PC o sumarle a PC el inmediato (PC + inmediato) para el siguiente paso.

library IEEE;
use IEEE.std_logic_1164.all;

entity Datapath_PC is
	port(
	clk:in std_logic;
	WIR, WCW: in std_logic;
	MB,MC,WPC: in std_logic;
	DC: out std_logic_vector(2 downto 0); --Señal seleccionar registro en UR
	Mem_Codigos_Data: out std_logic_vector (20 downto 0);
	DA: out std_logic_vector(2 downto 0); --Señal salida de UR_A
	DB: out std_logic_vector(2 downto 0); --Señal salida de UR_B
	Selc: out std_logic_vector(4 downto 0);
	W: out std_logic; --Señal de escritura para la UR
	WE: out std_logic; --Señal de escritura para el Registro_Banderas
	MI: out std_logic; --Señal para el Mux_MI
	MM: out std_logic; --Señal para el Mux_MM
	MW: out std_logic; --Señal de escritura para la Mem_Datos
    Inmediato: out std_logic_vector(7 downto 0); --Inmediato
	PCout: out std_logic_vector (7 downto 0);
	J: out std_logic); --Señal para activar el salto
end Datapath_PC;

architecture Datapath_PC of Datapath_PC is

component PC
	port(
	Inmediato: in std_logic_vector (7 downto 0);
	MB,MC,WPC,clk: in std_logic;
	PC: out std_logic_vector (7 downto 0));
end component;

component RegistroIR
    port(
    S_in: in std_logic_vector(4 downto 0);
    DC_in, DA_in: in std_logic_vector(2 downto 0);
	Inmediato_in: in std_logic_vector(7 downto 0);
	MD2_in, MD1_in: in std_logic;
	WIR: in std_logic;
	clk: in std_logic;

	S_out: out std_logic_vector(4 downto 0);
	DC_out: out std_logic_vector(2 downto 0);
	DB_out: out std_logic_vector(2 downto 0);
	DA_out: out std_logic_vector(2 downto 0);
	MD2_out: out std_logic;
	Inmediato_out: out std_logic_vector(7 downto 0);
	MD1_out: out std_logic);
end component;

component RegistroCW
    port(
    DCin: in std_logic_vector(2 downto 0);
	DAin: in std_logic_vector(2 downto 0); 
	DBin: in std_logic_vector(2 downto 0);
	Sin: in std_logic_vector(4 downto 0);
	Win: in std_logic;
	WEin: in std_logic;
	MIin: in std_logic;
	MMin: in std_logic;
	MWin: in std_logic;
	Inmediatoin: in std_logic_vector(7 downto 0);

	WCW: in std_logic;
	clk: in std_logic;

	DCout: out std_logic_vector(2 downto 0);
	DAout: out std_logic_vector(2 downto 0); 
	DBout: out std_logic_vector(2 downto 0);
	Sout: out std_logic_vector(4 downto 0);
	Wout: out std_logic;
	WEout: out std_logic;
	MIout: out std_logic;
	MMout: out std_logic;
	MWout: out std_logic;
    Inmediatoout: out std_logic_vector(7 downto 0));
end component;

component Mem_Codigos
	port(
	Paso: in std_logic_vector (4 downto 0);
	clk: in std_logic;
	Datos_out: out std_logic_vector (20 downto 0));
end component;

signal PC_Rout: std_logic_vector (7 downto 0);
signal Mem_Codigos_out: std_logic_vector (20 downto 0);
signal IR_out: std_logic_vector (23 downto 0);
signal CW_out: std_logic_vector (26 downto 0);

signal A, B, C: std_logic;

begin

--Mem_Codigos
Mem_Codigos_F: Mem_Codigos port map(Paso(0) => PC_Rout(0), Paso(1) => PC_Rout(1), Paso(2) => PC_Rout(2), Paso(3) => PC_Rout(3), Paso(4) => PC_Rout(4), clk => clk, Datos_out => Mem_Codigos_out);

--RegistroIR
RegistroIR_F: RegistroIR port map(S_in(4) => Mem_Codigos_out(20), S_in(3) => Mem_Codigos_out(19), S_in(2) => Mem_Codigos_out(18), S_in(1) => Mem_Codigos_out(17), S_in(0) => Mem_Codigos_out(16), 
DC_in(2) => Mem_Codigos_out(15), DC_in(1) => Mem_Codigos_out(14), DC_in(0) => Mem_Codigos_out(13), DA_in(2) => Mem_Codigos_out(12), DA_in(1) => Mem_Codigos_out(11), DA_in(0) => Mem_Codigos_out(10),
MD2_in => Mem_Codigos_out(9), Inmediato_in(7) => Mem_Codigos_out(8), Inmediato_in(6) => Mem_Codigos_out(7), Inmediato_in(5) => Mem_Codigos_out(6), Inmediato_in(4) => Mem_Codigos_out(5),
Inmediato_in(3) => Mem_Codigos_out(4), Inmediato_in(2) => Mem_Codigos_out(3), Inmediato_in(1) => Mem_Codigos_out(2), Inmediato_in(0) => Mem_Codigos_out(1), MD1_in => Mem_Codigos_out(0),

WIR => WIR, clk => clk,

S_out(4) => IR_out(23), S_out(3) => IR_out(22), S_out(2) => IR_out(21), S_out(1) => IR_out(20), S_out(0) => IR_out(19), 
DC_out(2) => IR_out(18), DC_out(1) => IR_out(17), DC_out(0) => IR_out(16), DB_out(2) => IR_out(15), DB_out(1) => IR_out(14), DB_out(0) => IR_out(13),
DA_out(2) => IR_out(12), DA_out(1) => IR_out(11), DA_out(0) => IR_out(10), MD2_out => IR_out(9),
Inmediato_out(7) => IR_out(8), Inmediato_out(6) => IR_out(7), Inmediato_out(5) => IR_out(6), Inmediato_out(4) => IR_out(5),
Inmediato_out(3) => IR_out(4), Inmediato_out(2) => IR_out(3), Inmediato_out(1) => IR_out(2), Inmediato_out(0) => IR_out(1), MD1_out => IR_out(0));

--Señales para que sean de entrada para CW
A <= ((not(IR_out(23))) or ((IR_out(23) and not(IR_out(22))) and (not(IR_out(21)))) or (IR_out(23) and IR_out(22) and (not(IR_out(21))) and IR_out(20) and IR_out(19)));-- W
B <= (((not(IR_out(23)) and IR_out(21) and IR_out(20))) or ((not(IR_out(23)) and not(IR_out(21)))) or ((IR_out(23)) and (IR_out(22)) and (not (IR_out(21))) and (not (IR_out(20)) and (IR_out(19))))); -- WE
C <= (IR_out(23) and IR_out(22) and not(IR_out(21)) and IR_out(20) and not(IR_out(19))); -- MW

--RegistroCW
RegistroCW_F: RegistroCW port map(DCin(2) => IR_out(18), DCin(1) => IR_out(17), DCin(0) => IR_out(16), DAin(2) => IR_out(12), DAin(1) => IR_out(11), DAin(0) => IR_out(10),
DBin(2) => IR_out(15), DBin(1) => IR_out(14), DBin(0) => IR_out(13), Sin(4) => IR_out(23), Sin(3) => IR_out(22), Sin(2) => IR_out(21), Sin(1) => IR_out(20), Sin(0) => IR_out(19),
Win => A, WEin => B, MIin => IR_out(0), MMin => IR_out(9), MWin => C,
Inmediatoin(7) => IR_out(8), Inmediatoin(6) => IR_out(7), Inmediatoin(5) => IR_out(6), Inmediatoin(4) => IR_out(5),
Inmediatoin(3) => IR_out(4), Inmediatoin(2) => IR_out(3), Inmediatoin(1) => IR_out(2), Inmediatoin(0) => IR_out(1),

WCW => WCW, clk => clk,

DCout(2) => CW_out(26), DCout(1) => CW_out(25), DCout(0) => CW_out(24), DAout(2) => CW_out(23), DAout(1) => CW_out(22), DAout(0) => CW_out(21),
DBout(2) => CW_out(20), DBout(1) => CW_out(19), DBout(0) => CW_out(18), Sout(4) => CW_out(17), Sout(3) => CW_out(16), Sout(2) => CW_out(15), Sout(1) => CW_out(14), Sout(0) => CW_out(13),
Wout => CW_out(12), WEout => CW_out(11), MIout => CW_out(10), MMout => CW_out(9), MWout => CW_out(8),
Inmediatoout(7) => CW_out(7), Inmediatoout(6) => CW_out(6), Inmediatoout(5) => CW_out(5), Inmediatoout(4) => CW_out(4),
Inmediatoout(3) => CW_out(3), Inmediatoout(2) => CW_out(2), Inmediatoout(1) => CW_out(1), Inmediatoout(0) => CW_out(0));

--Registro_Contador (PC)
PC_F: PC port map(Inmediato(7) => CW_out(7), Inmediato(6) => CW_out(6), Inmediato(5) => CW_out(5), Inmediato(4) => CW_out(4),
Inmediato(3) => CW_out(3), Inmediato(2) => CW_out(2), Inmediato(1) => CW_out(1), Inmediato(0) => CW_out(0), MB => MB, MC => MC, WPC => WPC, clk => clk,
PC(7) => PC_Rout(7), PC(6) => PC_Rout(6), PC(5) => PC_Rout(5), PC(4) => PC_Rout(4), PC(3) => PC_Rout(3), PC(2) => PC_Rout(2), PC(1) => PC_Rout(1), PC(0) => PC_Rout(0));

--Asignamos las salidas correspondientes.
DC(2) <= (CW_out(26));
DC(1) <= (CW_out(25));
DC(0) <= (CW_out(24));
DA(2) <= (CW_out(23));
DA(1) <= (CW_out(22));
DA(0) <= (CW_out(21));
DB(2) <= (CW_out(20));
DB(1) <= (CW_out(19));
DB(0) <= (CW_out(18));
Selc(4) <= (CW_out(17));
Selc(3) <= (CW_out(16));
Selc(2) <= (CW_out(15));
Selc(1) <= (CW_out(14));
Selc(0) <= (CW_out(13));
W <= (CW_out(12));
WE <= (CW_out(11));
MI <= (CW_out(10));
MM <= (CW_out(9));
MW <= (CW_out(8));
Inmediato(7) <= (CW_out(7));
Inmediato(6) <= (CW_out(6));
Inmediato(5) <= (CW_out(5));
Inmediato(4) <= (CW_out(4));
Inmediato(3) <= (CW_out(3));
Inmediato(2) <= (CW_out(2));
Inmediato(1) <= (CW_out(1));
Inmediato(0) <= (CW_out(0));
PCout <= PC_Rout;
Mem_Codigos_Data <= Mem_Codigos_out;

--Señal de salto
J <= (((CW_out(17)) and not((CW_out(16))) and (CW_out(15)))or((CW_out(17)) and (CW_out(16)) and (CW_out(15)))or((CW_out(17)) and (CW_out(16)) and not((CW_out(15))) and not((CW_out(14))) and not((CW_out(13)))));

end Datapath_PC;