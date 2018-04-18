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

process (clk, rst, i_init_value) is
    begin
        if(rst = '1') then
            --counter_reg <= (others => '0');
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