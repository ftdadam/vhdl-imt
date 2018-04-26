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
    i_button_down : in STD_LOGIC
);
end component;

CONSTANT clk_period : time := 10ns;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '1';
signal enb : STD_LOGIC := '0';
signal i_button_up : STD_LOGIC := '0';
signal i_button_down : STD_LOGIC := '0';

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
    i_button_up => i_button_up
);

end Behavioral;
