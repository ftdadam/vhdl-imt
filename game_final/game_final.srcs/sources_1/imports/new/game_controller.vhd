library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity game_controller is
port ( 
        clk : in STD_LOGIC;
        player_clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        rst_game : in STD_LOGIC; 
        enb : in STD_LOGIC;
        i_button_up : in STD_LOGIC;
        i_button_down : in STD_LOGIC;
        i_h_count : in STD_LOGIC_VECTOR (11-1 downto 0);
        i_v_count : in STD_LOGIC_VECTOR (11-1 downto 0);
        i_sw_seed : in STD_LOGIC_VECTOR (13 downto 0);
        o_lives : out STD_LOGIC_VECTOR (2 downto 0);
        o_game_over : out STD_LOGIC;
        o_tick_gen_max : out STD_LOGIC_VECTOR (25 downto 0);
        o_rgb : out STD_LOGIC_VECTOR (12-1 downto 0);
        o_digit_0 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_1 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_2 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_3 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_4 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_5 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_6 : out STD_LOGIC_VECTOR (3 downto 0);
        o_digit_7 : out STD_LOGIC_VECTOR (3 downto 0)
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
    i_h_count : in STD_LOGIC_VECTOR (11 - 1 downto 0);  --CAMBIAR LONG
    i_v_count : in STD_LOGIC_VECTOR (11 - 1 downto 0);  --CAMBIAR LONG
    i_player_vector : in STD_LOGIC_VECTOR (N_H_LANES - 1 downto 0);
    i_game_over : in STD_LOGIC;
    i_obstacle_bit : in STD_LOGIC_VECTOR (0 downto 0);
    i_obstacle_line : in STD_LOGIC_VECTOR (NB_LINE_SELECTION-1 downto 0);
    o_rgb_data : out STD_LOGIC_VECTOR (12-1 downto 0);
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
    o_lives : out STD_LOGIC_VECTOR (2 downto 0);
    o_game_over : out STD_LOGIC
);
end component;

component score is
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        rst_game : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_tick_gen_max : out STD_LOGIC_VECTOR (25 downto 0);
        o_score : out STD_LOGIC_VECTOR (12 - 1 downto 0);
        o_h_score : out STD_LOGIC_VECTOR (12 - 1 downto 0)
);
end component;

component bin2bcd is
port (
    i_binary : in STD_LOGIC_VECTOR (12-1 downto 0);
    o_digit_0 : out STD_LOGIC_VECTOR (3 downto 0);
    o_digit_1 : out STD_LOGIC_VECTOR (3 downto 0);
    o_digit_2 : out STD_LOGIC_VECTOR (3 downto 0);
    o_digit_3 : out STD_LOGIC_VECTOR (3 downto 0)
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
signal connect_board_to_collision : STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);
signal connect_player_to_collision : STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);
signal connect_game_over : STD_LOGIC;
signal connect_rgb_data : STD_LOGIC_VECTOR (12-1 downto 0);
signal connect_o_lives : STD_LOGIC_VECTOR (2 downto 0);
signal connect_score : STD_LOGIC_VECTOR (12 - 1 downto 0);
signal connect_h_score : STD_LOGIC_VECTOR (12 - 1 downto 0);

begin

seed_lane_gen <= std_logic_vector(to_unsigned(12182,seed_lane_gen'length) + unsigned(i_sw_seed) );
seed_obj_gen <= std_logic_vector(to_unsigned(34232,seed_obj_gen'length) + unsigned(i_sw_seed) );

lane_generator : prbs
generic map(
    TAP_0   => TAP_0,
    TAP_1   => TAP_1,
    NB_OUT  => NB_OUT_LANE_GEN,
    NB_PRBS => NB_PRBS_LANE_GEN
)
port map(
    rst     => rst_game,
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
    rst     => rst_game,
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
    rst => rst_game,
    enb => enb,
    i_h_count => i_h_count,
    i_v_count => i_v_count,
    i_player_vector => connect_player_to_collision,
    i_game_over => connect_game_over,
    i_obstacle_bit => connect_obj_gen_to_board,
    i_obstacle_line => connect_lane_gen_to_board,
    o_board_end_vector => connect_board_to_collision,
    o_rgb_data => connect_rgb_data
);

player : player_vector
generic map(
    N_H_LANES => N_H_LANES
)
port map(
    clk => player_clk,
    rst => rst_game,
    enb => enb,
    i_button_down => i_button_down,
    i_button_up => i_button_up,
    o_player_vect => connect_player_to_collision
);

collision_control : collision
generic map(
        N_H_LANES => N_H_LANES 
)
port map(
    clk => clk,
    rst => rst_game,
    enb => enb,
    i_player_vect => connect_player_to_collision,
    i_board_vect => connect_board_to_collision,
    o_lives => connect_o_lives,
    o_game_over => connect_game_over
);

score_counter : score
port map(
    enb => enb,
    rst => rst_game,
    rst_game => rst_game,
    clk => clk,
    o_score => connect_score,
    o_h_score => connect_h_score,
    o_tick_gen_max => o_tick_gen_max
);

u_bin2bcd_score : bin2bcd
port map(
    i_binary => connect_score,
    o_digit_0 => o_digit_0,
    o_digit_1 => o_digit_1,
    o_digit_2 => o_digit_2,
    o_digit_3 => o_digit_3
);

u_bin2bcd_h_score : bin2bcd
port map(
    i_binary => connect_h_score,
    o_digit_0 => o_digit_4,
    o_digit_1 => o_digit_5,
    o_digit_2 => o_digit_6,
    o_digit_3 => o_digit_7
);

o_rgb <= connect_rgb_data;
o_lives <= connect_o_lives;
o_game_over <= connect_game_over;

end Behavioral;
