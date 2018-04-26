library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_board_matrix is
end tb_board_matrix;

architecture Behavioral of tb_board_matrix is

component board_matrix is
generic(
    N_H_LANES : integer;
    N_V_LANES : integer;
    NB_LINE_SELECTION : integer
);
port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        enb : in STD_LOGIC;
        i_obstacle_bit : in STD_LOGIC;
        i_obstacle_line : in STD_LOGIC_VECTOR (NB_LINE_SELECTION-1 downto 0)
);
end component;

CONSTANT N_H_LANES : integer := 8;
CONSTANT N_V_LANES : integer := 16;
CONSTANT NB_LINE_SELECTION : integer := 3;
CONSTANT clk_period : time := 10ns;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '1';
signal enb : STD_LOGIC := '0';
signal i_obstacle_bit : STD_LOGIC := '1';
signal i_obstacle_line : STD_LOGIC_VECTOR (NB_LINE_SELECTION-1 downto 0) := "0000";

begin

clk <= not clk after clk_period;
rst <= '0' after 100ns;
enb <= '1' after 200ns, '0' after 600ns;
i_obstacle_line <= "0001" after 400ns;

u_board_matrix : board_matrix
generic map(
    N_H_LANES => N_H_LANES,
    N_V_LANES => N_V_LANES,
    NB_LINE_SELECTION => NB_LINE_SELECTION
)
port map(
    clk => clk,
    rst => rst,
    enb => enb,
    i_obstacle_bit => i_obstacle_bit,
    i_obstacle_line => i_obstacle_line
);

end Behavioral;
