library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopWatch is
    port(clk, pin_h2, reset, set           : in std_logic;
         hex3_d, hex2_d, hex1_d, hex0_d : out std_logic_vector(6 downto 0));
end stopWatch;

architecture funcionality of stopWatch is

    component freqDivider is
        port(clock    	  : in std_logic;
             outclock 	  : out std_logic);
    end component;

    component latchRS is
        port(reset, set   : in std_logic;
             q      	     : inout std_logic);
    end component;

    component counterfive is
        port(counterclock : in std_logic;
             reset   	  : in std_logic;
             sixout       : out std_logic;
             qc           : out std_logic_vector(3 downto 0));
    end component;

    component counternine is
        port(counterclock : in std_logic;
             reset   	  : in std_logic;
             nineout	  	  : out std_logic;
             qb           : out std_logic_vector(3 downto 0));
    end component;    

    component decoder is
        port(d       	  : in std_logic_vector(3 downto 0);
             qd      	  : out std_logic_vector(6 downto 0));
    end component;
    
    signal or_gate, and_gate, x, y, clockcounter2, clockcounter3, clockcounter4 : std_logic;
    signal outcounter1, outcounter2, outcounter3, outcounter4 : std_logic_vector(3 downto 0);
    

begin

    lat : latchRS 
        port map(
            reset          => reset,
            set            => set,
            q              => x
        );

    freqdiv: freqDivider
        port map(
            clock          => clk,
            outclock       => y
        );

    counter1: counternine
        port map(
            reset         => or_gate,
            counterclock  => and_gate,
            qb            => outcounter1,
            nineout       => clockcounter2
        );
    
    counter2: countersix
        port map(
            reset         => or_gate,
            counterclock  => clockcounter2,
            qc            => outcounter2,
            sixout        => clockcounter3
        );
    
    counter3: counternine
        port map(
            reset         => or_gate,
            counterclock  => clockcounter3,
            qb            => outcounter3,
            nineout       => clockcounter4
        );
    
    counter4: countersix
        port map(
            reset         => or_gate,
            counterclock  => clockcounter4,
            qc            => outcounter4
        );

    decoder1: decoder
        port map(
            d             => outcounter1,
            qd            => hex0_d
        );
    
    decoder2: decoder
        port map(
            d             => outcounter2,
            qd            => hex1_d
        );
    
    decoder3: decoder
        port map(
            d             => outcounter3,
            qd            => hex2_d
        );

    decoder4: decoder
        port map(
            d             => outcounter4,
            qd            => hex3_d
        );
		  
	 or_gate  <= (not x) or (not pin_h2);
	 and_gate <= y and x;

end funcionality;
