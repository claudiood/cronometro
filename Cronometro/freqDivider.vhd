library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity freqDivider is
    port(clock     : in std_logic;
         outclock  : buffer std_logic);
end freqDivider;

architecture funcionality of freqDivider is
    signal contador : std_logic_vector(25 downto 0); -- 10 1111 1010 1111 0000 1000 0000 = 25M em binário 
begin

comparadorIncrementador: process(contador, clock)
begin
    if(clock'event and clock='1') then
	 
        if (contador /= "1011111010111100001000000") then
				contador <= contador + '1';
				--outclock <= '0';
				else
					outclock <= not outclock;
					contador <=(others=> '0');
        end if;
    end if;
end process comparadorIncrementador;
end funcionality;
