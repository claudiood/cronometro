library ieee;
use ieee.std_logic_1164.all;

entity latchRS is
    port(pin_f1            :    in std_logic;
         q         	   :    out std_logic);
end latchRS;

architecture funcionality of latchRS is
begin
	process(pin_f1)
	begin
	if(pin_f1 = '0') then
		q 	<= '0';
			else if(pin_f1 = '1') then
				q <= '1';
			end if;
		end if;
	end process;
end funcionality;
