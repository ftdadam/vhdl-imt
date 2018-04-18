library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_counter is
end tb_counter;

architecture Behavioral of tb_counter is

component counter is
generic(
    G_SIZE : integer
    );
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_count : out STD_LOGIC_VECTOR (G_SIZE-1 downto 0);
        o_endcount : out STD_LOGIC
);

end component;

CONSTANT COUNTER_SIZE       : integer := 4;
CONSTANT CLOCK_HALF_PERIOD  : time := 10 ns;

signal clk       : std_logic := '0';
signal rst       : std_logic := '1';
signal enb       : std_logic := '0';
signal o_endcount    : std_logic;
signal o_count       : std_logic_vector(COUNTER_SIZE-1 downto 0);

begin

clk  <= not clk after CLOCK_HALF_PERIOD;
rst  <= '0' after 50 ns ;
enb <= '1' after 150 ns;

u_counter : counter
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk   ,
    rst     => rst   ,
    enb     => enb  ,
    o_endcount  => o_endcount,
    o_count     => o_count 
);


end Behavioral;
