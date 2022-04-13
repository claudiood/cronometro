library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity freqDivider is
    port(clock     : in std_logic;
         outclock  : inout std_logic);
end freqDivider;

architecture funcionality of freqDivider is
    signal contador std_logic_vector(25 downto 0); -- 10 1111 1010 1111 0000 1000 0000 = 50M em binário
begin

comparadorIncrementador: process(contador, clock)
begin
    contador <= "0";
    if (clock'event and clock='1') then
        contador <= contador + "1" when contador =/ "10 1111 1010 1111 0000 1000 0000" else

        if(contador = "10 1111 1010 1111 0000 1000 0000") then
            outclock <= "1";
            else
                outclock <= "0";
            end if;

        contador <= "0"            when contador =  "10 1111 1010 1111 0000 1000 0000";
     end if;
end process comparadorIncrementador;

end funcionality;
