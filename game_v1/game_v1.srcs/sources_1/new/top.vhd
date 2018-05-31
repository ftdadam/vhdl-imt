library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
port (
    CLK100MHZ : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR (15 downto 0);
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR (15 downto 0);
    VGA_R : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_B : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_G : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_HS : out STD_LOGIC;
    VGA_VS : out STD_LOGIC
);
end top;

architecture Behavioral of top is

component game_controller
port ( 
    clk : in STD_LOGIC;
    player_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enb : in STD_LOGIC;
    i_button_up : in STD_LOGIC;
    i_button_down : in STD_LOGIC;
    i_h_count : in STD_LOGIC_VECTOR (11-1 downto 0);
    i_v_count : in STD_LOGIC_VECTOR (11-1 downto 0);
    i_sw_seed : in STD_LOGIC_VECTOR (13 downto 0);
    o_lives : out STD_LOGIC_VECTOR (2 downto 0);
    o_game_over : out STD_LOGIC;
    o_tick_gen_max : out STD_LOGIC_VECTOR (25 downto 0);
    o_rgb : out STD_LOGIC_VECTOR (12-1 downto 0)
);
end component;

component clk_wiz_v3_6 is
port (
    CLK_IN1           : in     std_logic;
    CLK_OUT1          : out    std_logic
);
end component;

component tick_gen is
port (  
    enb : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    i_tick_gen_max : in STD_LOGIC_VECTOR (25 downto 0);
    o_endcount : out STD_LOGIC
);
end component;

component player_tick_gen is
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_endcount : out STD_LOGIC
);
end component;

component vga_controller_640_60
port(
   rst         : in std_logic;
   pixel_clk   : in std_logic;
   HS          : out std_logic;
   VS          : out std_logic;
   hcount      : out std_logic_vector(10 downto 0);
   vcount      : out std_logic_vector(10 downto 0)
);
end component;

signal pixel_clk : STD_LOGIC;
signal game_clk : STD_LOGIC;
signal player_clk : STD_LOGIC;
signal display_clk : STD_LOGIC;
signal connect_h_count : STD_LOGIC_VECTOR (11-1 downto 0);
signal connect_v_count : STD_LOGIC_VECTOR (11-1 downto 0);
signal connect_rgb : STD_LOGIC_VECTOR (12-1 downto 0);
signal connect_o_lives : STD_LOGIC_VECTOR (2 downto 0);
signal connect_game_over : STD_LOGIC;
signal connect_tick_gen_max : STD_LOGIC_VECTOR (25 downto 0);
signal tick_gen_max_display : STD_LOGIC_VECTOR (25 downto 0);
signal enb : STD_LOGIC;
signal prbs_seed : STD_LOGIC_VECTOR(13 downto 0);

begin

enb <= not(connect_game_over) and SW(1); 
tick_gen_max_display <= std_logic_vector(to_unsigned(416667,tick_gen_max_display'length));

u_game_controller : game_controller
port map (
    clk => game_clk,
    player_clk => player_clk,
    rst => SW(0),
    enb => enb,
    i_button_up => BTNU,
    i_button_down => BTND, 
    i_h_count => connect_h_count,
    i_v_count => connect_v_count,
    i_sw_seed => prbs_seed,
    o_lives => connect_o_lives,
    o_rgb => connect_rgb,
    o_tick_gen_max => connect_tick_gen_max,
    o_game_over => connect_game_over
);

pixel_clock : clk_wiz_v3_6
port map ( 
    CLK_IN1  => CLK100MHZ,
    CLK_OUT1 => pixel_clk
);

u_tick_gen : tick_gen
port map (
    enb => enb,
    rst => SW(0),
    clk => pixel_clk,
    i_tick_gen_max => connect_tick_gen_max,
    o_endcount => game_clk 
);

u_tick_gen_displays : tick_gen
port map (
    enb => enb,
    rst => SW(0),
    clk => pixel_clk,
    i_tick_gen_max => tick_gen_max_display,
    o_endcount => display_clk 
);

u_player_tick_gen : player_tick_gen
port map (  enb => enb,
            rst => SW(0),
            clk => pixel_clk,
            o_endcount => player_clk
);

u_vga_contoller : vga_controller_640_60
port map(
    rst         => SW(0),
    pixel_clk   => pixel_clk,
    HS          => VGA_HS,
    VS          => VGA_VS,
    hcount      => connect_h_count,
    vcount      => connect_v_count
);

VGA_R <= connect_rgb(11 downto 8);
VGA_G <= connect_rgb(7 downto 4);
VGA_B <= connect_rgb(3 downto 0);

LED (0) <= SW(0);
LED (1) <= SW(1);
LED (12 downto 2) <= "00000000000";
LED (15 downto 13) <= connect_o_lives;
prbs_seed <= SW (15 downto 2);

end Behavioral;
