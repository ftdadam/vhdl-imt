library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tick_gen is
generic(NB_COUNTER : integer := 25;
        MAX : integer := 12500000
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_endcount : out STD_LOGIC
);

end entity tick_gen;

architecture Behavioral of tick_gen is
    signal counter_reg : unsigned(NB_COUNTER-1 downto 0);
begin
  
process (clk, rst) is
    begin
        if(rst = '1') then
            counter_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            if(enb = '1') then
                if(counter_reg < MAX)then
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
