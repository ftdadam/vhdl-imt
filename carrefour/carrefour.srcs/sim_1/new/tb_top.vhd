library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is

component top is
generic(NB_DISPLAY : integer := 8
);
port (  rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_presence : in STD_LOGIC;
        sim_o_led_rr : out STD_LOGIC;
        sim_o_led_ro : out STD_LOGIC;
        sim_o_led_rv : out STD_LOGIC;
        sim_o_led_cr : out STD_LOGIC;
        sim_o_led_co : out STD_LOGIC;
        sim_o_led_cv : out STD_LOGIC;
        sim_o_display : out STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0);
        sim_o_validate : out STD_LOGIC
);
end component;

CONSTANT NB_DISPLAY : integer := 8;
CONSTANT CLOCK_HALF_PERIOD  : time := 10 ns;
signal clk : STD_LOGIC:= '0';   
signal rst : STD_LOGIC:= '1';
signal i_presence : STD_LOGIC:= '0';

signal sim_o_led_rr : STD_LOGIC;
signal sim_o_led_ro : STD_LOGIC;
signal sim_o_led_rv : STD_LOGIC;
signal sim_o_led_cr : STD_LOGIC;
signal sim_o_led_co : STD_LOGIC;
signal sim_o_led_cv : STD_LOGIC;
signal sim_o_display : STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0);
signal sim_o_validate : STD_LOGIC;

begin

clk  <= not clk after CLOCK_HALF_PERIOD;
rst  <= '0' after 100 ns ;
i_presence <= '1' after 200ns, '0' after 600ns; 

u_top : top
generic map(
    NB_DISPLAY => NB_DISPLAY
)
port map(   rst => rst,
            clk => clk,
            i_presence => i_presence,
            sim_o_led_rr => sim_o_led_rr,
            sim_o_led_ro => sim_o_led_ro,
            sim_o_led_rv => sim_o_led_rv,
            sim_o_led_cr => sim_o_led_cr,
            sim_o_led_co => sim_o_led_co,
            sim_o_led_cv => sim_o_led_cv,
            sim_o_display => sim_o_display,
            sim_o_validate => sim_o_validate
);

end Behavioral;
