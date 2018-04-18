library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_operative is
end tb_operative;

architecture Behavioral of tb_operative is

component operative is
generic(NB_DISPLAY : integer;
        NB_OUTPUT_SIG : integer;
        NB_SELECTION : integer
);
port (  enb_secu : in STD_LOGIC;
        enb_lrv : in STD_LOGIC;
        enb_lro : in STD_LOGIC;
        enb_lcv : in STD_LOGIC;     
        enb_counter : in STD_LOGIC;   
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_display : out STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0);
        o_validate : out STD_LOGIC;
        o_fsecu : out STD_LOGIC;
        o_frv : out STD_LOGIC;
        o_fro : out STD_LOGIC;
        o_fcv : out STD_LOGIC
);

end component;

CONSTANT NB_OUTPUT_SIG : integer := 4;
CONSTANT NB_DISPLAY : integer := 8;
CONSTANT NB_SELECTION : integer := 4;
CONSTANT CLOCK_HALF_PERIOD  : time := 10 ns;

signal enb_secu : STD_LOGIC := '0';
signal enb_lrv : STD_LOGIC:= '0';
signal enb_lro : STD_LOGIC:= '0';
signal enb_lcv : STD_LOGIC:= '0'; 
signal enb_counter : STD_LOGIC:= '0';   
signal rst : STD_LOGIC:= '1';
signal clk : STD_LOGIC:= '0';
signal o_display : STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0);
signal o_validate : STD_LOGIC;
signal o_fsecu : STD_LOGIC;
signal o_frv : STD_LOGIC;
signal o_fro : STD_LOGIC;
signal o_fcv : STD_LOGIC;

begin

clk  <= not clk after CLOCK_HALF_PERIOD;
rst  <= '0' after 50 ns ;
enb_counter <= '1' after 150 ns;
enb_lrv <= '1' after 50ns;

u_operative : operative
generic map(
    NB_OUTPUT_SIG => NB_OUTPUT_SIG,
    NB_DISPLAY => NB_DISPLAY,
    NB_SELECTION => NB_SELECTION
)
port map(
    enb_secu => enb_secu,
    enb_lrv => enb_lrv,
    enb_lro => enb_lro,
    enb_lcv => enb_lcv,
    enb_counter => enb_counter,
    rst => rst,
    clk => clk,
    o_display => o_display,
    o_validate => o_validate,
    o_fsecu => o_fsecu,
    o_frv => o_frv,
    o_fro => o_fro,
    o_fcv => o_fcv
);

end Behavioral;
