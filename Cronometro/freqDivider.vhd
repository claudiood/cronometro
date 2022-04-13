library ieee;
use ieee.std_logic_1164.all;

entity freqDivider is
    port(clock     : in std_logic;
          outclock : inout std_logic);
end freqDivider;

architecture funcionality of freqDivider is
begin
