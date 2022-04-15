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
        port(clock    : in std_logic,
             outclock : out std_logic);
    end component;

    component latchRS is
        port(reset, set       :    in std_logic;
             q, q_bar         :    inout std_logic);
    end component latchRS;

    component counter is
        port(counterclock : in std_logic;
             reset   	  : inout std_logic;
             cout         : out std_logic;
             qc           : out std_logic_vector(3 downto 0));
    end component counter;

    component decoder is
        port(d       : in std_logic_vector(3 downto 0);
             qd      : out std_logic_vector(6 downto 0));
    end component decoder;
    
    signal or_gate, and_gate, x, y, outcounter1, outcounter2, outcounter3, outdecoder1, outdecoder2, outdecoder3, outdecoder4, indecoder1, indecoder2, indecoder3, indecoder4 : std_logic;
    

begin

    lat : latchRS 
        port map(
            reset          => reset,
            set            => set,
            x              => q
        );

    freqdiv: freqDivider
        port map(
            clock          => clk,
            y              => outclock
        );

    or_gate  <= not x or not btn;
    and_gate <= y and x;

    counter1: counter
        port map(
            and_gate       => counterclock,
            or_gate        => reset,
            outcounter1    => cout
            indecoder1     => qc
        );
    
    counter2: counter
        port map(
            outcounter1    => counterclock,
            or_gate        => reset,
            outcounter2    => cout
            indecoder2     => qc
        );

    counter3: counter
        port map(
            outcounter2    => counterclock,
            or_gate        => reset,
            outcounter3    => cout
            indecoder3     => qc
        );

    counter4: counter
        port map(
            outcounter3    => counterclock,
            or_gate        => reset
            indecoder4     => qc
        );

    decoder1: decoder
        port map(
            indecoder1     => d,
            outdecoder1    => qd
        );

    decoder2: decoder
        port map(
            indecoder2     => d,
            outdecoder2    => qd
        );

    decoder3: decoder
        port map(
            indecoder3     => d,
            outdecoder3    => qd
        );

    decoder4: decoder
        port map(
            indecoder4     => d,
            outdecoder4    => qd
        );
              