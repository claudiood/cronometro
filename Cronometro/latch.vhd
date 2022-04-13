library ieee;
use ieee.std_logic_1164.all;

entity latch is
    port(rst, st    :    in std_logic;
         q, q_bar      :    inout std_logic);
end latch;

architecture funcionality of latch is
    begin
        q <= rst nor q_bar;
        q_bar <= st nor q;
    end
end funcionality;