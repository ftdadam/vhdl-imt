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
