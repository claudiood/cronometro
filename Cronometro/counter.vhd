library ieee;
use ieee.std_logic_1164.all;

entity counter is
    port(rst, outclock              : in std_logic;
         qd, qc, qb, qa, outclock   : out std_logic);
end counter;

architecture funcionality of counter is
