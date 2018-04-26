library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity game_controller is
port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        enb : in STD_LOGIC;
        i_button_up : in STD_LOGIC;
        i_button_down : in STD_LOGIC
);
end game_controller;

architecture Behavioral of game_controller is

component prbs is
generic(
        TAP_0 : integer;
        TAP_1 : integer;
        NB_OUT : integer;
        NB_PRBS : integer
);
port (  
        rst : in STD_LOGIC;
        enb : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_seed : in STD_LOGIC_VECTOR (NB_PRBS - 1 downto 0);
        o_prbs : out STD_LOGIC_VECTOR (NB_OUT - 1 downto 0)
);
end component;

component board_matrix is
generic (
    N_H_LANES : integer;
    N_V_LANES : integer;
    NB_LINE_SELECTION : integer
);
port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        enb : in STD_LOGIC;
        i_obstacle_bit : in STD_LOGIC_VECTOR (0 downto 0);
        i_obstacle_line : in STD_LOGIC_VECTOR (NB_LINE_SELECTION-1 downto 0);
        o_board_end_vector : out STD_LOGIC_VECTOR (N_H_LANES-1 downto 0)
);
end component;

component player_vector is
generic(
    N_H_LANES : integer
);
port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enb : in STD_LOGIC;
    i_button_down : in STD_LOGIC;
    i_button_up : in STD_LOGIC;
    o_player_vect : out STD_LOGIC_VECTOR (N_H_LANES-1 downto 0)
);
end component;

component collision is
generic(
    N_H_LANES : integer
);
port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enb : in STD_LOGIC;
    i_player_vect : in STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);
    i_board_vect : in STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);
    o_game_over : out STD_LOGIC
);
end component;

CONSTANT TAP_0 : integer := 15;
CONSTANT TAP_1 : integer := 14;
CONSTANT NB_OUT_LANE_GEN : integer := 3; 
CONSTANT NB_PRBS_LANE_GEN: integer := 16;
CONSTANT NB_OUT_OBJ_GEN : integer := 1;
CONSTANT NB_PRBS_OBJ_GEN : integer := 16;
CONSTANT N_H_LANES : integer := 8; --2**NB_OUT_LANE_GEN
CONSTANT N_V_LANES : integer := 16;

signal seed_lane_gen : STD_LOGIC_VECTOR (NB_PRBS_LANE_GEN-1 downto 0);
signal seed_obj_gen : STD_LOGIC_VECTOR (NB_PRBS_OBJ_GEN-1 downto 0);
signal connect_lane_gen_to_board : STD_LOGIC_VECTOR (NB_OUT_LANE_GEN-1 downto 0);
signal connect_obj_gen_to_board : STD_LOGIC_VECTOR (NB_OUT_OBJ_GEN-1 downto 0);
signal connect_board_to_collition : STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);
signal connect_player_to_collition : STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);
signal connect_game_over : STD_LOGIC;

begin

seed_lane_gen <= std_logic_vector(to_unsigned(12182,seed_lane_gen'length));
seed_obj_gen <= std_logic_vector(to_unsigned(34232,seed_lane_gen'length));

lane_generator : prbs
generic map(
    TAP_0   => TAP_0,
    TAP_1   => TAP_1,
    NB_OUT  => NB_OUT_LANE_GEN,
    NB_PRBS => NB_PRBS_LANE_GEN
)
port map(
    rst     => rst,
    enb     => enb,
    clk     => clk,
    i_seed  => seed_lane_gen,
    o_prbs  => connect_lane_gen_to_board
);

object_generator : prbs
generic map(
    TAP_0   => TAP_0,
    TAP_1   => TAP_1,
    NB_OUT  => NB_OUT_OBJ_GEN,
    NB_PRBS => NB_PRBS_OBJ_GEN
)
port map(
    rst     => rst,
    enb     => enb,
    clk     => clk,
    i_seed  => seed_obj_gen,
    o_prbs  => connect_obj_gen_to_board
);

board : board_matrix
generic map(
    N_H_LANES => N_H_LANES,
    N_V_LANES => N_V_LANES,
    NB_LINE_SELECTION => NB_OUT_LANE_GEN
)
port map(
    clk => clk,
    rst => rst,
    enb => enb,
    i_obstacle_bit => connect_obj_gen_to_board,
    i_obstacle_line => connect_lane_gen_to_board,
    o_board_end_vector => connect_board_to_collition
);

player : player_vector
generic map(
    N_H_LANES => N_H_LANES
)
port map(
clk => clk,
rst => rst,
enb => enb,
i_button_down => i_button_down,
i_button_up => i_button_up,
o_player_vect => connect_player_to_collition
);

collision_control : collision
generic map(
        N_H_LANES => N_H_LANES 
)
port map(
    clk => clk,
    rst => rst,
    enb => enb,
    i_player_vect => connect_player_to_collition,
    i_board_vect => connect_board_to_collition,
    o_game_over => connect_game_over
);

end Behavioral;
