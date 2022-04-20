library ieee;
use ieee.std_logic_1164.all;

entity latchRS is
    port(reset             :    in std_logic;
         q         	   :    out std_logic);
end latchRS;

architecture funcionality of latchRS is
begin
	process(reset)
	begin
	if(reset = '0') then
		q 	<= '0';
			else if(reset = '1') then
				q <= '1';
			end if;
		end if;
	end process;
end funcionality;
