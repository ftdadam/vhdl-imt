library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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
    i_obstacle_bit : in STD_LOGIC_VECTOR (0 downto 0);
    i_obstacle_line : in STD_LOGIC_VECTOR (NB_LINE_SELECTION-1 downto 0);
    o_board_end_vector : out STD_LOGIC_VECTOR (N_H_LANES-1 downto 0)
);
end board_matrix;

architecture Behavioral of board_matrix is

type board_matrix is array (N_H_LANES-1 downto 0) of STD_LOGIC_VECTOR(N_V_LANES - 1 downto 0);
signal board : board_matrix;
signal pointer : integer;

function get_col( a : board_matrix; col : integer) return std_logic_vector is
    variable ret : STD_LOGIC_VECTOR(N_H_LANES-1 downto 0);
begin
    for i in 0 to N_H_LANES-1 loop
        ret(i) := a(i)(col);
    end loop;
    return ret;
end function get_col;

begin

pointer <= to_integer(unsigned(i_obstacle_line));

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

end Behavioral;
