library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counterfive is
    port(counterclock : in std_logic;
		   reset   	    : in std_logic;
         sixout       : out std_logic;
         qc           : out std_logic_vector(3 downto 0));
end counterfive;

architecture funcionality of counterfive is

signal count : std_logic_vector(3 downto 0);
	 
begin
	counter_bcd: process(counterclock, reset)
	begin
		if(reset = '0') then
			sixout   <= '0';
			qc 	  	<= "0000";
			count 	<= "0000";
			else if(reset = '1') then
				if(counterclock'event and counterclock = '1') then

					-- Conta até 5
					if(count < "0101") then
						count  <= count + '1';
						qc 	 <= count;
						else if(count = "0110") then
							sixout   <= '1';
							sixout   <= '0';
							qc 	  	<= "0000";
							count 	<= "0000";
						end if;
					end if;
				end if;
			end if;
		end if;
end process counter_bcd;
end funcionality;