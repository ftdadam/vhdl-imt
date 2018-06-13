library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity player_vector is
generic(
    N_H_LANES : integer := 8
);
port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enb : in STD_LOGIC;
    i_button_down : in STD_LOGIC;
    i_button_up : in STD_LOGIC;
    o_player_vect : out STD_LOGIC_VECTOR (N_H_LANES-1 downto 0)
);
end player_vector;

architecture Behavioral of player_vector is

signal player_vect : STD_LOGIC_VECTOR (N_H_LANES-1 downto 0);

begin

process (clk,rst) is
begin
    if(rst = '1') then
        player_vect <= "00010000";
    else
        if(rising_edge(clk)) then
            if(enb = '1') then
                if(i_button_up = '1' and player_vect /= "10000000") then
                    player_vect <= player_vect(N_H_LANES-2 downto 0) & '0';
                elsif(i_button_down = '1' and player_vect /= "00000001") then
                    player_vect <= '0' & player_vect(N_H_LANES-1 downto 1);
                else
                    player_vect <= player_vect;
                end if;
            else
                player_vect <= player_vect;
            end if;
        end if;
    end if;
end process;

o_player_vect <= player_vect;

end Behavioral;
