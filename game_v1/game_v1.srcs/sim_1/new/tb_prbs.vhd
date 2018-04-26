library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity tb_prbs is
end tb_prbs;

architecture Behavioral of tb_prbs is

component prbs is
generic(
        TAP_0  : integer;
        TAP_1  : integer;
        NB_OUT : integer;
        NB_PRBS : integer
);
port (  
        rst : in STD_LOGIC;
        enb : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_seed : in STD_LOGIC_VECTOR (NB_PRBS - 1 downto 0);
        o_lane : out STD_LOGIC_VECTOR (NB_OUT - 1 downto 0)
);
end component;

CONSTANT CLOCK_HALF_PERIOD  : time := 10 ns;
CONSTANT TAP_0  : integer := 15;
CONSTANT TAP_1  : integer := 14;
CONSTANT NB_OUT : integer := 4;
CONSTANT NB_PRBS : integer := 16;

signal rst : STD_LOGIC := '1';
signal enb : STD_LOGIC := '0';
signal clk : STD_LOGIC := '0';
signal i_seed : STD_LOGIC_VECTOR (NB_PRBS - 1 downto 0) := "1010100100100101";
signal o_lane : STD_LOGIC_VECTOR (NB_OUT - 1 downto 0);

begin

clk  <= not clk after CLOCK_HALF_PERIOD;
rst  <= '0' after 50 ns;
enb <= '1' after 150 ns;

u_prbs : prbs
generic map (
        TAP_0 => TAP_0,
        TAP_1 => TAP_1,
        NB_OUT => NB_OUT,
        NB_PRBS => NB_PRBS
)
port map (  
        rst    => rst,
        enb    => enb,
        clk    => clk,
        i_seed => i_seed,
        o_lane => o_lane
);

end Behavioral;
