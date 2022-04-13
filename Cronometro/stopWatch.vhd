library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopWatch is
    port(clk, btn, reset, set : in std_logic,

         hex_d0, hex_d1,
         hex_d2, hex_d3,
         hex_d4, hex_d5,
         hex_d6               : out std_logic_vector(6 downto 0));
end stopWatch;

architecture funcionality of stopWatch is

    component freqDivider is
        port(clock : in std_logic,
          outclock : out std_logic);
    end component;

    component latch is
        port(rst, st       :    in std_logic;
             q, q_bar      :    out std_logic);
    end component latch;
    
    signal or_gate : std_logic;

begin

    lat : latch 
        port map(
            rst  => reset,
            st   => set
        );

    or_gate <= not q or not btn;



    


    







              