library IEEE;
use IEEE.std_logic_1164.all;

entity FFDw is
	port (
	d, w, clk: in std_logic; 
	q: out std_logic);
end FFDw;

architecture FFDw of FFDw is
begin
	process (d, clk)
	begin
		if (clk'event and clk = '1') then
			if (d='U') then
				q <= '0';
		else
			if (w = '1') then
				q <= d;
			end if;
			end if;
		end if;
   end process;
end FFDw;