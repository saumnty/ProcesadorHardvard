library IEEE;
use IEEE.std_logic_1164.all;

entity Procesador is
	port(
	clk: in std_logic;
	Mem_Codigos_Data: out std_logic_vector (20 downto 0);
	DCout, DAout, DBout: out std_logic_vector (2 downto 0);
	WIRout, WCWout: out std_logic;
	Wout, WEout, Miout, MMout, MWout: out std_logic;
	MBout, MCout, WPCout: out std_logic;
	Selc_out: out std_logic_vector(4 downto 0);
	Carry_out,Vo_out,Zero_out,Signo_out: out std_logic;
	J_Result, Sv_result: out std_logic;
	PCout: out std_logic_vector (7 downto 0);
	Result: out std_logic_vector (7 downto 0));
end Procesador;

architecture Procesador of Procesador is

component Datapath_PC
	port(
	clk:in std_logic;
	WIR, WCW: in std_logic;
	MB,MC,WPC: in std_logic;
	DC: out std_logic_vector(2 downto 0);
	Mem_Codigos_Data: out std_logic_vector (20 downto 0);
	DA: out std_logic_vector(2 downto 0); 
	DB: out std_logic_vector(2 downto 0);
	Selc: out std_logic_vector(4 downto 0);
	W: out std_logic;
	WE: out std_logic;
	MI: out std_logic;
	MM: out std_logic;
	MW: out std_logic;
    Inmediato: out std_logic_vector(7 downto 0);
	PCout: out std_logic_vector (7 downto 0);
	J: out std_logic);
end component;

component Datapath
	port(
	Inmediato: in std_logic_vector (7 downto 0);
	Da,Db,Dc: in std_logic_vector (2 downto 0);
	W,WE,MI,MM,MW: in std_logic;
	clk: in std_logic;
	Selector: in std_logic_vector (4 downto 0);
	Carry_out,Vo_out,Zero_out,Signo_out: out std_logic;
	SV: out std_logic;
	Result: out std_logic_vector (7 downto 0));
end component;

component Secuenciador
	port(
	J,Sv: in std_logic;
	clk: in std_logic;
	WIR,WCW: out std_logic;
	MB,MC,WPC: out std_logic);
end component;

signal J_signal, Sv_signal: std_logic;
signal WIR_signal, WCW_signal: std_logic;
signal MB_signal, MC_signal, WPC_signal, MWC_signal: std_logic;

signal DC_signal, DA_signal, DB_signal: std_logic_vector (2 downto 0);
signal Selc_signal: std_logic_vector (4 downto 0);
signal W_signal, WE_signal, Mi_signal, MM_signal, MW_signal: std_logic;
signal Inmediato_signal: std_logic_vector (7 downto 0);

begin

Secuenciador_F: Secuenciador port map(J => J_signal, Sv => Sv_signal, clk => clk, WIR => WIR_signal, WCW => WCW_signal, MB => MB_signal, MC => MC_signal, WPC => WPC_signal);

Datapath_PC_F: Datapath_PC port map(clk => clk, WIR => WIR_signal, WCW => WCW_signal, MB => MB_signal, MC => MC_signal, WPC => WPC_signal, DC => DC_signal,
Mem_Codigos_Data => Mem_Codigos_Data, DA => DA_signal, DB => DB_signal, Selc => Selc_signal, W => W_signal, WE => WE_signal, MI => Mi_signal, MM => MM_signal, MW => MW_signal,
Inmediato => Inmediato_signal, PCout => PCout, J => J_signal);

Datapath_F: Datapath port map(Inmediato => Inmediato_signal, Da => DA_signal, Db => DB_signal, Dc => DC_signal, W => W_signal, WE => WE_signal,
MI => Mi_signal, MM => MM_signal, MW => MW_signal, clk => clk, Selector => Selc_signal, Carry_out => Carry_out, Vo_out => Vo_out, Zero_out => Zero_out,
Signo_out => Signo_out, SV => Sv_signal, Result => Result);

Selc_out <= Selc_signal;
Wout <= W_signal;
WEout <= WE_signal;
Miout <= Mi_signal;
MMout <= MM_signal;
MWout <= MW_signal;
MBout <= MB_signal;
MCout <= MC_signal;
WPCout <= WPC_signal;
WIRout <= WIR_signal;
WCWout <= WCW_signal;
DCout <= DC_signal;
DAout <= DA_signal;
DBout <= DB_signal;

J_Result <= J_signal;
Sv_result <= Sv_signal;

end Procesador;