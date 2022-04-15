library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counter is
    port(counterclock : in std_logic;
		 reset   	  : inout std_logic;
         cout         : out std_logic;
         qc           : out std_logic_vector(3 downto 0));
end counter;

architecture funcionality of counter is

    signal count : std_logic_vector(3 downto 0);
	 
	 begin
		 counter_bcd: process(counterclock, reset)
		 begin
			  if(reset = '0') then
					count <= "0000";
                    cout  <= '0';
			        else if(counterclock'event and counterclock = '1') then
					    if(count <= "1000") then  -- If counter less than 9 then increment count
						    count <= count + '1';
						    qc <= count;
						    else if(count = "1001") then -- If counter = 9 then reset = 0
                                cout  <= '1';
							    reset <= '0';
                      end if;
						 end if;
                 end if;    
			  end if;
		 end process counter_bcd;
end funcionality;