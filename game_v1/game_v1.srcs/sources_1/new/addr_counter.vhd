library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity addr_counter is
generic(NB_COUNTER : integer := 10; --- nombre de bits
        MAX : integer := 1000--- peut compter jusqu'à MAX inclus
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_endcount : out STD_LOGIC;
        o_count : out STD_LOGIC_VECTOR (NB_COUNTER - 1 downto 0)
);

end entity addr_counter;

architecture Behavioral of addr_counter is
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
                    counter_reg <= counter_reg;
                end if;
            else
                counter_reg <= (others => '0');
            end if;
        end if;
end process;

o_endcount <= '1' when counter_reg = MAX else '0';
o_count <= counter_reg;

end Behavioral;