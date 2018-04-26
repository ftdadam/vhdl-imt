library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter_sec is
generic(G_SIZE : integer := 4      
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_init : in STD_LOGIC;
        i_init_value : in STD_LOGIC_VECTOR (G_SIZE-1 downto 0);
        o_endcount : out STD_LOGIC;
        o_count : out STD_LOGIC_VECTOR (G_SIZE-1 downto 0)
);

end entity counter_sec;

architecture Behavioral of counter_sec is
    signal counter_reg : unsigned (G_SIZE-1 downto 0);
begin


-- This process is combinatorial and sequential
-- The combinatorial part is only the asynchronous reset, that puts the Flip Flop Vector (counter register)
-- to the initial value, given from an external signal (in order to use the same design source).
-- The sequential part depends not only of the value of the counter register, but also of the input values
-- For this counter, while the enable is activated and the value of the register is above 0 it simply counts, subtracting 1 to the register,
-- when it reaches the value 0 the register freezes in 0. 
-- A flag signal warns the control stage that a counter has finished that signal is purely combinatory (o_endcount), lasting a clock cycle because
-- it depends of the values in the register (that holds for a whole clock cycle).
-- The signal enb comes from the 1 second counter, the signal i_init from the control module, indicating that the counter has to be used.
-- this signal allows to retain the counter value, waiting for the enb signal to subtract another value.
process (clk, rst, i_init_value) is
    begin
        if(rst = '1') then
            counter_reg <= unsigned(i_init_value);
        elsif(rising_edge(clk)) then
            if(enb = '1' and i_init = '1') then
                if(counter_reg > 0)then
                    counter_reg <= counter_reg - 1;
                else
                    counter_reg <= counter_reg;
                end if;
            elsif(enb = '0' and i_init = '1') then
                counter_reg <= counter_reg;
            else
                counter_reg <= unsigned(i_init_value);
            end if;
        end if;
end process;

o_endcount  <= '1' when counter_reg = 0 else '0';
o_count     <= STD_LOGIC_VECTOR(counter_reg);

end Behavioral;