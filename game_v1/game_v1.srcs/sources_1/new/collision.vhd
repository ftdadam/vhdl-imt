library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_MISC.ALL;

entity collision is
generic(
        N_H_LANES : integer := 8
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
end collision;

architecture Behavioral of collision is

signal lives : integer;
signal game_over : STD_LOGIC;
signal collision : STD_LOGIC;

begin

collision <= or_reduce(i_board_vect and i_player_vect);

process (clk,rst,lives) is
begin
    if(rst = '1') then
        lives <= 3;
        game_over <= '0';
    else
        if(rising_edge(clk)) then
            if(enb = '1') then
                if(collision = '1' and lives /= 0) then
                    lives <= lives -1;
                    game_over <= '0';
                elsif(lives = 0) then
                    game_over <= '1';
                else
                    game_over <= '0';
                end if; 
            else
                lives <= lives;
                game_over <= game_over;
            end if;
        end if;
    end if;
    
    case (lives) is 
        when 3 =>
            o_lives <= "111";
        when 2 =>
            o_lives <= "011";
        when 1 =>
            o_lives <= "001";
        when 0 =>
            o_lives <= "000";
        when others =>
            o_lives <= "000";
    end case;

end process;

o_game_over <= game_over;

end Behavioral;
