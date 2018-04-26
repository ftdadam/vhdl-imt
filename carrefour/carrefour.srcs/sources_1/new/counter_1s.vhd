library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter_1s is
generic(G_SIZE : integer := 10; --- nombre de bits
        G_MAX : integer := 1000--- peut compter jusqu'à G_Max inclus
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_endcount : out STD_LOGIC
);

end entity counter_1s;

architecture Behavioral of counter_1s is
    signal counter_reg : unsigned(G_SIZE-1 downto 0);
begin


-- This process is combinatorial and sequential
-- The combinatorial part is only the asynchronous reset, that puts the Flip Flop Vector (counter register) to 0
-- The sequential part depends not only of the value of the counter register, but also of the input values
-- For this counter, while the enable is activated, it simply counts, adding 1 to the register,
-- when it reaches the maximum given value (to count exactly 1 second), it restarts automatically from 0, 
-- to count another second.
-- Also, there is no need to declare an ouput for the value of the register, we only need a flag signal to warn the
-- other counters that 1 second has passed, that signal is purely combinatory (o_endcount), lasting a clock cycle because
-- it depends of the values in the register (that holds for a whole clock cycle)  
process (clk, rst) is
    begin
        if(rst = '1') then
            counter_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            if(enb = '1') then
                if(counter_reg < G_MAX)then
                    counter_reg <= counter_reg + 1;
                else
                    counter_reg <= (others => '0');
                end if;
            else
                counter_reg <= (others => '0');
            end if;
        end if;
end process;

o_endcount <= '1' when counter_reg = G_MAX else '0';

end Behavioral;
