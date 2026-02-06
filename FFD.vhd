library IEEE;
use IEEE.std_logic_1164.all;

entity FFD is
	port (
	d, clk: in std_logic;
	q: out std_logic);
end FFD;

architecture Ar_FFD of FFD is
begin
	process (d, clk)
	begin
	if (clk'event and clk = '1') then
		if (d='U') then
			q <= '0';
        else
			q <= d;
        end if;
    end if;
	end process;
end Ar_FFD;