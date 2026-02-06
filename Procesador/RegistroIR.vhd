--Este es el Registro que almacenara la instruccion IR:
--   S    Dc  Da MD2 Inmediato MD1
-- 00000 000 000  0  00000000   0  21 bits
--Estos se almacenaran en sus respectivos registros, y dejaran las siguientes salidas:
--   S    Dc  Da MD2 DB/Inmediato MD1
-- 00000 000 000  0  000  00000    0  24 bits
--Tenemos mas salidas, siendo 3 bits mayor a la entrada, esto ocurre debido a que utilizamos los 3 bits ams significativos de el Inmediato para la salida DB_out, reutilizando 3 bits.

library IEEE;
use IEEE.std_logic_1164.all;

entity RegistroIR is
    port(
        S_in: in std_logic_vector(4 downto 0);
        DC_in, DA_in: in std_logic_vector(2 downto 0);
		MD2_in: in std_logic;
        Inmediato_in: in std_logic_vector(7 downto 0);
        MD1_in: in std_logic;
		
        WIR: in std_logic; --Señal que se utiliza para guardar los valores en los registros.
        clk: in std_logic;
		
        S_out: out std_logic_vector(4 downto 0);
        DC_out: out std_logic_vector(2 downto 0);
        DB_out: out std_logic_vector(2 downto 0);
        DA_out: out std_logic_vector(2 downto 0);
        MD2_out: out std_logic;
        Inmediato_out: out std_logic_vector(7 downto 0);
        MD1_out: out std_logic);
end RegistroIR;
architecture RegistroIR of RegistroIR is
component FFDw 
    port (
	d, w, clk: in std_logic; 
	q: out std_logic);
end component;
begin
    FFS1: FFDw port map(S_in(0),WIR,clk,S_out(0)); -- Sin
    FFS2: FFDw port map(S_in(1),WIR,clk,S_out(1));
    FFS3: FFDw port map(S_in(2),WIR,clk,S_out(2));
    FFS4: FFDw port map(S_in(3),WIR,clk,S_out(3));
    FFS5: FFDw port map(S_in(4),WIR,clk,S_out(4)); -- AQUI ACABA LA Sin

    FFDC_6: FFDw port map(DC_in(0),WIR,clk,DC_out(0)); -- DCin
    FFDC_7: FFDw port map(DC_in(1),WIR,clk,Dc_out(1));
    FFDC_8: FFDw port map(DC_in(2),WIR,clk,DC_out(2)); -- AQUI ACABA DCin

    FFDA_9: FFDw port map(DA_in(0),WIR,clk,DA_out(0)); -- DAin
    FFDA_10: FFDw port map(DA_in(1),WIR,clk,DA_out(1));
    FFDA_11: FFDw port map(DA_in(2),WIR,clk,DA_out(2)); -- AQUI ACABA DAin

    FFMD_12: FFDw port map(MD2_in,WIR,clk,MD2_out); -- MD2
	
    FFInm_13: FFDw port map(Inmediato_in(0),WIR,clk,Inmediato_out(0)); -- Inmediato
    FFInm_14: FFDw port map(Inmediato_in(1),WIR,clk,Inmediato_out(1));
    FFInm_15: FFDw port map(Inmediato_in(2),WIR,clk,Inmediato_out(2));
    FFInm_16: FFDw port map(Inmediato_in(3),WIR,clk,Inmediato_out(3));
    FFInm_17: FFDw port map(Inmediato_in(4),WIR,clk,Inmediato_out(4));
    FFInm_18: FFDw port map(Inmediato_in(5),WIR,clk,Inmediato_out(5));
    FFInm_19: FFDw port map(Inmediato_in(6),WIR,clk,Inmediato_out(6));
    FFInm_20: FFDw port map(Inmediato_in(7),WIR,clk,Inmediato_out(7)); -- AQUI ACABA EL Inmediato
	
	--Aqui damos el valor almacenamos, y damos el valor a DB_out, siendo este:
	--Inmediato_in(5) a DA_out(0), Inmediato_in(6) a DA_out(1), Inmediato_in(7) a DA_out(2):
	
	FFDB_21: FFDw port map(Inmediato_in(5),WIR,clk,DB_out(0)); -- DBout
	FFDB_22: FFDw port map(Inmediato_in(6),WIR,clk,DB_out(1));
	FFDB_23: FFDw port map(Inmediato_in(7),WIR,clk,DB_out(2)); -- AQUI ACABA DBout

    FFMD24: FFDw port map(MD1_in,WIR,clk,MD1_out); -- MD1
	
end RegistroIR;