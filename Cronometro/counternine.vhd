library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counternine is
    port(counterclock : in std_logic;
		 reset   	  : in std_logic;
		 nineout	  : out std_logic;
         qb           : out std_logic_vector(3 downto 0));
end counternine;

architecture funcionality of counternine is

signal count : std_logic_vector(3 downto 0);
	 
begin
	counter_bcd: process(counterclock, reset)
	begin
		if(reset = '0') then
			qb 	  	<= "0000";
			count 	<= "0000";
			else --if(reset = '1') then
				if(counterclock'event and counterclock = '1') then

					-- Conta até 9
					if(count < "1001") then
						count 	 <= count + '1';
						qb 	  	 <= count;
						nineout  <= '0';
						else if(count = "1001") then
							nineout  <= '1';
							qb 	  	 <= "0000";
							count 	 <= "0000";
						end if;
					end if;
				end if;
			--end if;
		end if;
end process counter_bcd;
end funcionality;