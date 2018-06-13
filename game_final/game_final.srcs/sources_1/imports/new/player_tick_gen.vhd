library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity player_tick_gen is
generic(NB_COUNTER : integer := 21;
        MAX : integer := 1562500
        --MAX : integer := 10
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_endcount : out STD_LOGIC
);

end entity player_tick_gen;

architecture Behavioral of player_tick_gen is
    signal counter_reg : unsigned(NB_COUNTER-1 downto 0);
begin

process (clk, rst) is
    begin
        if(rst = '1') then
            counter_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            if(enb = '1') then
                if(counter_reg < max)then
                    counter_reg <= counter_reg + 1;
                else
                    counter_reg <= (others => '0');
                end if;
            else
                counter_reg <= (others => '0');
            end if;
        end if;
end process;

o_endcount <= '1' when counter_reg = MAX else '0';

end Behavioral;

