library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_game_controller is
end tb_game_controller;

architecture Behavioral of tb_game_controller is

component game_controller is
port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enb : in STD_LOGIC;
    i_button_up : in STD_LOGIC;
    i_button_down : in STD_LOGIC;
    i_h_count : in STD_LOGIC_VECTOR (11-1 downto 0);
    i_v_count : in STD_LOGIC_VECTOR (11-1 downto 0);
    o_lives : out STD_LOGIC_VECTOR (2 downto 0);
    o_game_over : out STD_LOGIC
);
end component;

CONSTANT clk_period : time := 10ns;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '1';
signal enb : STD_LOGIC := '0';
signal i_button_up : STD_LOGIC := '0';
signal i_button_down : STD_LOGIC := '0';
signal i_h_count : STD_LOGIC_VECTOR (11-1 downto 0) := "00000000000";
signal i_v_count : STD_LOGIC_VECTOR (11-1 downto 0) := "00000000000";
signal o_lives : STD_LOGIC_VECTOR (2 downto 0);
signal o_game_over : STD_LOGIC;

begin

clk <= not clk after clk_period;
rst <= '0' after 100ns;
enb <= '1' after 200ns, '0' after 5000ns;
i_button_down <= '1' after 300ns, '0' after 500ns;
i_button_up <= '1' after 500ns, '0' after 700ns;

u_game_controller : game_controller
port map( 
    clk => clk,
    rst => rst,
    enb => enb,
    i_button_down => i_button_down,
    i_button_up => i_button_up,
    i_h_count => i_h_count,
    i_v_count => i_v_count,
    o_lives => o_lives,
    o_game_over => o_game_over
);

end Behavioral;
