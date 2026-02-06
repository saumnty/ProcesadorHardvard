--Este registro se encarga de almacenar la palabra de control (CW), entonces tenemos:
-- Dc  Da  Db    S   W WE MI MM MW Inmediato
-- 000 000 000 00000 0 0  0  0  0  00000000 27 bits

--La salida es de 27 bits, los mismos de entrada.

library IEEE;
use IEEE.std_logic_1164.all;

entity RegistroCW is
    port(
        DCin: in std_logic_vector(2 downto 0); --15:13
        DAin: in std_logic_vector(2 downto 0); -- 12:10
        DBin: in std_logic_vector(2 downto 0); -- 8:6
        Sin: in std_logic_vector(4 downto 0); --20:16
        Win: in std_logic; -- Se conecta A
        WEin: in std_logic; -- Se conecta B
        MIin: in std_logic; -- Va conectado MD2
        MMin: in std_logic; -- Va conecctado MD1;
        MWin: in std_logic; -- Se conecta C
        Inmediatoin: in std_logic_vector(7 downto 0);

        WCW: in std_logic; --Señal que se utiliza para guardar los valores en los registros.
        clk: in std_logic;

        DCout: out std_logic_vector(2 downto 0); --15:13
        DAout: out std_logic_vector(2 downto 0); -- 12:10
        DBout: out std_logic_vector(2 downto 0); -- 8:6
        Sout: out std_logic_vector(4 downto 0); --20:16
        Wout: out std_logic; -- Salida de A
        WEout: out std_logic; -- Salida de B
        MIout: out std_logic; -- Va conectado MD2
        MMout: out std_logic; -- Va conecctado MD1;
        MWout: out std_logic; --Salida de C
        Inmediatoout: out std_logic_vector(7 downto 0));
end RegistroCW;
architecture RegistroCW of RegistroCW is
component FFDw 
    port (
	d, w, clk: in std_logic; 
	q: out std_logic);
end component;
begin
    FF1: FFDw port map(DCin(0),WCW,clk,DCout(0)); -- DCin
    FF2: FFDw port map(DCin(1),WCW,clk,Dcout(1));
    FF3: FFDw port map(DCin(2),WCW,clk,DCout(2)); -- AQUI ACABA DCin 

    FF4: FFDw port map(DAin(0),WCW,clk,DAout(0)); -- DAin
    FF5: FFDw port map(DAin(1),WCW,clk,DAout(1));
    FF6: FFDw port map(DAin(2),WCW,clk,DAout(2)); -- AQUI ACABA DAin 

    FF7: FFDw port map(DBin(0),WCW,clk,DBout(0)); -- DBin
    FF8: FFDw port map(DBin(1),WCW,clk,DBout(1));
    FF9: FFDw port map(DBin(2),WCW,clk,DBout(2)); -- AQUI ACABA DBin 

    FF10: FFDw port map(Sin(0),WCW,clk,Sout(0)); -- Sin
    FF11: FFDw port map(Sin(1),WCW,clk,Sout(1));
    FF12: FFDw port map(Sin(2),WCW,clk,Sout(2));
    FF13: FFDw port map(Sin(3),WCW,clk,Sout(3));
    FF14: FFDw port map(Sin(4),WCW,clk,Sout(4)); -- AQUI ACABA LA Sin

    FF15: FFDw port map(Win,WCW,clk,Wout); -- Conexión de A
    FF16: FFDw port map(WEin,WCW,clk,WEout); -- Conexión de B
    FF17: FFDw port map(MIin,WCW,clk,MIout);  -- Conexión de MD2 
    FF18: FFDw port map(MMin,WCW,clk,MMout);  -- Conexión de MD1 
    FF19: FFDw port map(MWin,WCW,clk,MWout); -- Conexión de C
	
    FF20: FFDw port map(Inmediatoin(0),WCW,clk,Inmediatoout(0)); -- Inmediato
    FF21: FFDw port map(Inmediatoin(1),WCW,clk,Inmediatoout(1));
    FF22: FFDw port map(Inmediatoin(2),WCW,clk,Inmediatoout(2));
    FF23: FFDw port map(Inmediatoin(3),WCW,clk,Inmediatoout(3));
    FF24: FFDw port map(Inmediatoin(4),WCW,clk,Inmediatoout(4));
    FF25: FFDw port map(Inmediatoin(5),WCW,clk,Inmediatoout(5));
    FF26: FFDw port map(Inmediatoin(6),WCW,clk,Inmediatoout(6));
    FF27: FFDw port map(Inmediatoin(7),WCW,clk,Inmediatoout(7)); -- AQUI ACABA EL Inmediato
	
end RegistroCW;