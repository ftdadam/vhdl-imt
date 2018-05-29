library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity board_matrix is
generic (
    N_H_LANES : integer := 8;
    N_V_LANES : integer := 16;
    NB_LINE_SELECTION : integer := 3
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
end board_matrix;

architecture Behavioral of board_matrix is

type board_matrix is array (N_H_LANES-1 downto 0) of STD_LOGIC_VECTOR(N_V_LANES - 1 downto 0);
signal board : board_matrix;
signal pointer : integer;

signal draw_obst : STD_LOGIC;
signal draw_player : STD_LOGIC;
signal rgb_data : STD_LOGIC_VECTOR (12-1 downto 0);
signal x,y : integer;
signal color_selector : STD_LOGIC_VECTOR (2 downto 0);

function get_col( a : board_matrix; col : integer) return std_logic_vector is
    variable ret : STD_LOGIC_VECTOR(N_H_LANES-1 downto 0);
begin
    for i in 0 to N_H_LANES-1 loop
        ret(i) := a(i)(col);
    end loop;
    return ret;
end function get_col;

begin

pointer <= conv_integer(i_obstacle_line);

process (clk,rst) is 
begin
    if(rst = '1') then
        board <= (others => (others => '0'));
    else
        if(rising_edge(clk)) then
            if(enb = '1') then
                for ptr in board_matrix'range loop
                    if(ptr /= pointer) then
                        board (ptr) <= board (ptr) (N_V_LANES-2 downto 0) & '0';
                    else
                        board(ptr) <=  board (ptr) (N_V_LANES-2 downto 0) & i_obstacle_bit;
                    end if;
                end loop;
            else
                board <= board;
            end if;
        end if;
    end if;
end process;

o_board_end_vector <= get_col(board,N_V_LANES-1);
o_rgb_data <= rgb_data;

x <= conv_integer(i_h_count);
y <= conv_integer(i_v_count);

draw_obst <= '1' when(
    (x >   0 and x <  40 and y >   0 and y <  60 and board(7)(15) = '1') or
    (x >  40 and x <  80 and y >   0 and y <  60 and board(7)(14) = '1') or
    (x >  80 and x < 120 and y >   0 and y <  60 and board(7)(13) = '1') or
    (x > 120 and x < 160 and y >   0 and y <  60 and board(7)(12) = '1') or
    (x > 160 and x < 200 and y >   0 and y <  60 and board(7)(11) = '1') or
    (x > 200 and x < 240 and y >   0 and y <  60 and board(7)(10) = '1') or
    (x > 240 and x < 280 and y >   0 and y <  60 and board(7)( 9) = '1') or
    (x > 280 and x < 320 and y >   0 and y <  60 and board(7)( 8) = '1') or
    (x > 320 and x < 360 and y >   0 and y <  60 and board(7)( 7) = '1') or
    (x > 360 and x < 400 and y >   0 and y <  60 and board(7)( 6) = '1') or
    (x > 400 and x < 440 and y >   0 and y <  60 and board(7)( 5) = '1') or
    (x > 440 and x < 480 and y >   0 and y <  60 and board(7)( 4) = '1') or
    (x > 480 and x < 520 and y >   0 and y <  60 and board(7)( 3) = '1') or
    (x > 520 and x < 560 and y >   0 and y <  60 and board(7)( 2) = '1') or
    (x > 560 and x < 600 and y >   0 and y <  60 and board(7)( 1) = '1') or
    (x > 600 and x < 640 and y >   0 and y <  60 and board(7)( 0) = '1') or
    
    (x >   0 and x <  40 and y >  60 and y < 120 and board(6)(15) = '1') or
    (x >  40 and x <  80 and y >  60 and y < 120 and board(6)(14) = '1') or
    (x >  80 and x < 120 and y >  60 and y < 120 and board(6)(13) = '1') or
    (x > 120 and x < 160 and y >  60 and y < 120 and board(6)(12) = '1') or
    (x > 160 and x < 200 and y >  60 and y < 120 and board(6)(11) = '1') or
    (x > 200 and x < 240 and y >  60 and y < 120 and board(6)(10) = '1') or
    (x > 240 and x < 280 and y >  60 and y < 120 and board(6)( 9) = '1') or
    (x > 280 and x < 320 and y >  60 and y < 120 and board(6)( 8) = '1') or
    (x > 320 and x < 360 and y >  60 and y < 120 and board(6)( 7) = '1') or
    (x > 360 and x < 400 and y >  60 and y < 120 and board(6)( 6) = '1') or
    (x > 400 and x < 440 and y >  60 and y < 120 and board(6)( 5) = '1') or
    (x > 440 and x < 480 and y >  60 and y < 120 and board(6)( 4) = '1') or
    (x > 480 and x < 520 and y >  60 and y < 120 and board(6)( 3) = '1') or
    (x > 520 and x < 560 and y >  60 and y < 120 and board(6)( 2) = '1') or
    (x > 560 and x < 600 and y >  60 and y < 120 and board(6)( 1) = '1') or
    (x > 600 and x < 640 and y >  60 and y < 120 and board(6)( 0) = '1') or
    
    (x >   0 and x <  40 and y > 120 and y < 180 and board(5)(15) = '1') or
    (x >  40 and x <  80 and y > 120 and y < 180 and board(5)(14) = '1') or
    (x >  80 and x < 120 and y > 120 and y < 180 and board(5)(13) = '1') or
    (x > 120 and x < 160 and y > 120 and y < 180 and board(5)(12) = '1') or
    (x > 160 and x < 200 and y > 120 and y < 180 and board(5)(11) = '1') or
    (x > 200 and x < 240 and y > 120 and y < 180 and board(5)(10) = '1') or
    (x > 240 and x < 280 and y > 120 and y < 180 and board(5)( 9) = '1') or
    (x > 280 and x < 320 and y > 120 and y < 180 and board(5)( 8) = '1') or
    (x > 320 and x < 360 and y > 120 and y < 180 and board(5)( 7) = '1') or
    (x > 360 and x < 400 and y > 120 and y < 180 and board(5)( 6) = '1') or
    (x > 400 and x < 440 and y > 120 and y < 180 and board(5)( 5) = '1') or
    (x > 440 and x < 480 and y > 120 and y < 180 and board(5)( 4) = '1') or
    (x > 480 and x < 520 and y > 120 and y < 180 and board(5)( 3) = '1') or
    (x > 520 and x < 560 and y > 120 and y < 180 and board(5)( 2) = '1') or
    (x > 560 and x < 600 and y > 120 and y < 180 and board(5)( 1) = '1') or
    (x > 600 and x < 640 and y > 120 and y < 180 and board(5)( 0) = '1') or
    
    (x >   0 and x <  40 and y > 180 and y < 240 and board(4)(15) = '1') or
    (x >  40 and x <  80 and y > 180 and y < 240 and board(4)(14) = '1') or
    (x >  80 and x < 120 and y > 180 and y < 240 and board(4)(13) = '1') or
    (x > 120 and x < 160 and y > 180 and y < 240 and board(4)(12) = '1') or
    (x > 160 and x < 200 and y > 180 and y < 240 and board(4)(11) = '1') or
    (x > 200 and x < 240 and y > 180 and y < 240 and board(4)(10) = '1') or
    (x > 240 and x < 280 and y > 180 and y < 240 and board(4)( 9) = '1') or
    (x > 280 and x < 320 and y > 180 and y < 240 and board(4)( 8) = '1') or
    (x > 320 and x < 360 and y > 180 and y < 240 and board(4)( 7) = '1') or
    (x > 360 and x < 400 and y > 180 and y < 240 and board(4)( 6) = '1') or
    (x > 400 and x < 440 and y > 180 and y < 240 and board(4)( 5) = '1') or
    (x > 440 and x < 480 and y > 180 and y < 240 and board(4)( 4) = '1') or
    (x > 480 and x < 520 and y > 180 and y < 240 and board(4)( 3) = '1') or
    (x > 520 and x < 560 and y > 180 and y < 240 and board(4)( 2) = '1') or
    (x > 560 and x < 600 and y > 180 and y < 240 and board(4)( 1) = '1') or
    (x > 600 and x < 640 and y > 180 and y < 240 and board(4)( 0) = '1') or
    
    (x >   0 and x <  40 and y > 240 and y < 300 and board(3)(15) = '1') or
    (x >  40 and x <  80 and y > 240 and y < 300 and board(3)(14) = '1') or
    (x >  80 and x < 120 and y > 240 and y < 300 and board(3)(13) = '1') or
    (x > 120 and x < 160 and y > 240 and y < 300 and board(3)(12) = '1') or
    (x > 160 and x < 200 and y > 240 and y < 300 and board(3)(11) = '1') or
    (x > 200 and x < 240 and y > 240 and y < 300 and board(3)(10) = '1') or
    (x > 240 and x < 280 and y > 240 and y < 300 and board(3)( 9) = '1') or
    (x > 280 and x < 320 and y > 240 and y < 300 and board(3)( 8) = '1') or
    (x > 320 and x < 360 and y > 240 and y < 300 and board(3)( 7) = '1') or
    (x > 360 and x < 400 and y > 240 and y < 300 and board(3)( 6) = '1') or
    (x > 400 and x < 440 and y > 240 and y < 300 and board(3)( 5) = '1') or
    (x > 440 and x < 480 and y > 240 and y < 300 and board(3)( 4) = '1') or
    (x > 480 and x < 520 and y > 240 and y < 300 and board(3)( 3) = '1') or
    (x > 520 and x < 560 and y > 240 and y < 300 and board(3)( 2) = '1') or
    (x > 560 and x < 600 and y > 240 and y < 300 and board(3)( 1) = '1') or
    (x > 600 and x < 640 and y > 240 and y < 300 and board(3)( 0) = '1') or
    
    (x >   0 and x <  40 and y > 300 and y < 360 and board(2)(15) = '1') or
    (x >  40 and x <  80 and y > 300 and y < 360 and board(2)(14) = '1') or
    (x >  80 and x < 120 and y > 300 and y < 360 and board(2)(13) = '1') or
    (x > 120 and x < 160 and y > 300 and y < 360 and board(2)(12) = '1') or
    (x > 160 and x < 200 and y > 300 and y < 360 and board(2)(11) = '1') or
    (x > 200 and x < 240 and y > 300 and y < 360 and board(2)(10) = '1') or
    (x > 240 and x < 280 and y > 300 and y < 360 and board(2)( 9) = '1') or
    (x > 280 and x < 320 and y > 300 and y < 360 and board(2)( 8) = '1') or
    (x > 320 and x < 360 and y > 300 and y < 360 and board(2)( 7) = '1') or
    (x > 360 and x < 400 and y > 300 and y < 360 and board(2)( 6) = '1') or
    (x > 400 and x < 440 and y > 300 and y < 360 and board(2)( 5) = '1') or
    (x > 440 and x < 480 and y > 300 and y < 360 and board(2)( 4) = '1') or
    (x > 480 and x < 520 and y > 300 and y < 360 and board(2)( 3) = '1') or
    (x > 520 and x < 560 and y > 300 and y < 360 and board(2)( 2) = '1') or
    (x > 560 and x < 600 and y > 300 and y < 360 and board(2)( 1) = '1') or
    (x > 600 and x < 640 and y > 300 and y < 360 and board(2)( 0) = '1') or
    
    (x >   0 and x <  40 and y > 360 and y < 420 and board(1)(15) = '1') or
    (x >  40 and x <  80 and y > 360 and y < 420 and board(1)(14) = '1') or
    (x >  80 and x < 120 and y > 360 and y < 420 and board(1)(13) = '1') or
    (x > 120 and x < 160 and y > 360 and y < 420 and board(1)(12) = '1') or
    (x > 160 and x < 200 and y > 360 and y < 420 and board(1)(11) = '1') or
    (x > 200 and x < 240 and y > 360 and y < 420 and board(1)(10) = '1') or
    (x > 240 and x < 280 and y > 360 and y < 420 and board(1)( 9) = '1') or
    (x > 280 and x < 320 and y > 360 and y < 420 and board(1)( 8) = '1') or
    (x > 320 and x < 360 and y > 360 and y < 420 and board(1)( 7) = '1') or
    (x > 360 and x < 400 and y > 360 and y < 420 and board(1)( 6) = '1') or
    (x > 400 and x < 440 and y > 360 and y < 420 and board(1)( 5) = '1') or
    (x > 440 and x < 480 and y > 360 and y < 420 and board(1)( 4) = '1') or
    (x > 480 and x < 520 and y > 360 and y < 420 and board(1)( 3) = '1') or
    (x > 520 and x < 560 and y > 360 and y < 420 and board(1)( 2) = '1') or
    (x > 560 and x < 600 and y > 360 and y < 420 and board(1)( 1) = '1') or
    (x > 600 and x < 640 and y > 360 and y < 420 and board(1)( 0) = '1') or
    
    (x >   0 and x <  40 and y > 420 and y < 480 and board(0)(15) = '1') or
    (x >  40 and x <  80 and y > 420 and y < 480 and board(0)(14) = '1') or
    (x >  80 and x < 120 and y > 420 and y < 480 and board(0)(13) = '1') or
    (x > 120 and x < 160 and y > 420 and y < 480 and board(0)(12) = '1') or
    (x > 160 and x < 200 and y > 420 and y < 480 and board(0)(11) = '1') or
    (x > 200 and x < 240 and y > 420 and y < 480 and board(0)(10) = '1') or
    (x > 240 and x < 280 and y > 420 and y < 480 and board(0)( 9) = '1') or
    (x > 280 and x < 320 and y > 420 and y < 480 and board(0)( 8) = '1') or
    (x > 320 and x < 360 and y > 420 and y < 480 and board(0)( 7) = '1') or
    (x > 360 and x < 400 and y > 420 and y < 480 and board(0)( 6) = '1') or
    (x > 400 and x < 440 and y > 420 and y < 480 and board(0)( 5) = '1') or
    (x > 440 and x < 480 and y > 420 and y < 480 and board(0)( 4) = '1') or
    (x > 480 and x < 520 and y > 420 and y < 480 and board(0)( 3) = '1') or
    (x > 520 and x < 560 and y > 420 and y < 480 and board(0)( 2) = '1') or
    (x > 560 and x < 600 and y > 420 and y < 480 and board(0)( 1) = '1') or
    (x > 600 and x < 640 and y > 420 and y < 480 and board(0)( 0) = '1')
    
)else '0';

draw_player <= '1' when(
    (x >   0 and x <  40 and y >   0 and y <  60 and i_player_vector="10000000") or
    (x >   0 and x <  40 and y >  60 and y < 120 and i_player_vector="01000000") or
    (x >   0 and x <  40 and y > 120 and y < 180 and i_player_vector="00100000") or
    (x >   0 and x <  40 and y > 180 and y < 240 and i_player_vector="00010000") or
    (x >   0 and x <  40 and y > 240 and y < 300 and i_player_vector="00001000") or
    (x >   0 and x <  40 and y > 300 and y < 360 and i_player_vector="00000100") or
    (x >   0 and x <  40 and y > 360 and y < 420 and i_player_vector="00000010") or
    (x >   0 and x <  40 and y > 420 and y < 480 and i_player_vector="00000001")
)else'0';

color_selector <= draw_obst & draw_player & i_game_over;
with color_selector select
    rgb_data <= 
    "000011110000" when "100", -- blue for obstacles
    "111111111111" when "110", -- white for player
	"111111111111" when "010", 
	"111100000000" when "101", -- red player and obstacles when game is over
	"111100000000" when "111",
	"111100000000" when "011",
	"000000000000" when others;
			 
end Behavioral;
