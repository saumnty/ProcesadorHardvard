library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlagRegisterUnit is
    Port (
        clk : in STD_LOGIC; -- Señal de reloj
        rst : in STD_LOGIC; -- Reset para inicializar las banderas
        selector : in STD_LOGIC_VECTOR(1 downto 0); -- Selector de 2 bits
        C_in, V_in, S_in, Z_in : in STD_LOGIC;
        C_out, V_out, S_out, Z_out : out STD_LOGIC);
end FlagRegisterUnit;

architecture Behavioral of FlagRegisterUnit is
    signal selected_flag : STD_LOGIC; 
    signal C_reg, V_reg, S_reg, Z_reg : STD_LOGIC := '0'; -- Registros de banderas

    component Mux4a1
        port (a, b, c, d: in STD_LOGIC;
              S: in STD_LOGIC_VECTOR (1 downto 0);
              r: out STD_LOGIC);
    end component;

begin
    MUX: Mux4a1
        port map (
            a => C_in,
            b => V_in,
            c => S_in,
            d => Z_in,
            S => selector,
            r => selected_flag
        );

    process (clk, rst, selector, selected_flag)
    begin
        C_reg <= (C_reg and (selector(1) or selector(0))) or (selected_flag and not selector(1) and not selector(0));
        V_reg <= (V_reg and (selector(1) or not selector(0))) or (selected_flag and not selector(1) and selector(0));
        S_reg <= (S_reg and (not selector(1) or selector(0))) or (selected_flag and selector(1) and not selector(0));
        Z_reg <= (Z_reg and (not selector(1) or not selector(0))) or (selected_flag and selector(1) and selector(0));
    end process;

    -- Asignar las salidas
    C_out <= C_reg;
    V_out <= V_reg;
    S_out <= S_reg;
    Z_out <= Z_reg;

end Behavioral;