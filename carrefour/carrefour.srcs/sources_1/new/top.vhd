library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
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
        sim_o_validate : out STD_LOGIC_VECTOR (3 downto 0)
);

CONSTANT NB_OUTPUT_SIG : integer := 4;
CONSTANT NB_SELECTION : integer := 4;
end entity top;

architecture Behavioral of top is

component operative is

generic(NB_DISPLAY : integer := 8;
        NB_OUTPUT_SIG : integer := 4;
        NB_SELECTION : integer := 4
);
port (  enb_secu : in STD_LOGIC;
        enb_lrv : in STD_LOGIC;
        enb_lro : in STD_LOGIC;
        enb_lcv : in STD_LOGIC;     
        enb_counter : in STD_LOGIC;   
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_display : out STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0);
        o_fsecu : out STD_LOGIC;
        o_frv : out STD_LOGIC;
        o_fro : out STD_LOGIC;
        o_fcv : out STD_LOGIC
);
end component;

component control is
port (  rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_fsecu : in STD_LOGIC;
        i_frv : in STD_LOGIC;
        i_fro : in STD_LOGIC;
        i_fcv : in STD_LOGIC;
        i_presence : in STD_LOGIC;
        o_enb_secu : out STD_LOGIC;
        o_enb_lrv : out STD_LOGIC;
        o_enb_lro : out STD_LOGIC;
        o_enb_lcv : out STD_LOGIC;
        o_led_rr : out STD_LOGIC;
        o_led_ro : out STD_LOGIC;
        o_led_rv : out STD_LOGIC;
        o_led_cr : out STD_LOGIC;
        o_led_co : out STD_LOGIC;
        o_led_cv : out STD_LOGIC
);
end component;

-- SIGNALS

signal enb_counter : STD_LOGIC;
signal connect_fsecu : STD_LOGIC;
signal connect_frv : STD_LOGIC;
signal connect_fro : STD_LOGIC;
signal connect_fcv : STD_LOGIC;
signal connect_enb_secu : STD_LOGIC;
signal connect_enb_lrv : STD_LOGIC;
signal connect_enb_lro : STD_LOGIC;
signal connect_enb_lcv : STD_LOGIC;

begin

-- This process is combinatorial, the signal "enb_counter" enables the counter
-- to count until 1 second passes (i.e CYCLES = clock frequency) 
process (rst) is
begin
    enb_counter <= not rst;
end process;

u_operative : operative
generic map(NB_DISPLAY => NB_DISPLAY,
            NB_OUTPUT_SIG => NB_OUTPUT_SIG,
            NB_SELECTION => NB_SELECTION
)
port map(   enb_secu => connect_enb_secu,
            enb_lrv => connect_enb_lrv,
            enb_lro => connect_enb_lro,
            enb_lcv => connect_enb_lcv,
            enb_counter => enb_counter,
            rst => rst,
            clk => clk,
            o_display => sim_o_display,
            o_fsecu => connect_fsecu,
            o_frv => connect_frv,
            o_fro => connect_fro,
            o_fcv => connect_fcv
);

u_control : control
port map(   rst => rst,
            clk => clk,
            i_fsecu => connect_fsecu,
            i_frv => connect_frv,
            i_fro => connect_fro,
            i_fcv => connect_fcv,
            i_presence => i_presence,
            o_enb_secu => connect_enb_secu,
            o_enb_lrv => connect_enb_lrv,
            o_enb_lro => connect_enb_lro,
            o_enb_lcv => connect_enb_lcv,
            o_led_rr => sim_o_led_rr,
            o_led_ro => sim_o_led_ro,
            o_led_rv => sim_o_led_rv,
            o_led_cr => sim_o_led_cr,
            o_led_co => sim_o_led_co,
            o_led_cv => sim_o_led_cv 
);

sim_o_validate <= "1110";

end Behavioral;
