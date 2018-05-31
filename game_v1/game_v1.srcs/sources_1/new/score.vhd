library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity score is
generic(NB_COUNTER : integer := 12;
        MAX : integer := (2**12)-1
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_tick_gen_max : out STD_LOGIC_VECTOR (25 downto 0);
        o_score : out STD_LOGIC_VECTOR (NB_COUNTER - 1 downto 0)
);
end entity score;

architecture Behavioral of score is
    signal score : unsigned(NB_COUNTER-1 downto 0);
    signal tick_gen_max : integer;
begin

process (clk, rst) is
begin
    if(rst = '1') then
        score <= (others => '0');
        --tick_gen_max <= 12500000;
        tick_gen_max <= 10;
    elsif(rising_edge(clk)) then
        if(enb = '1') then
            if(score < MAX)then
                score <= score + 1;
                if (score < 25) then
                    --tick_gen_max <= 12500000;
                    tick_gen_max <= 10;
                elsif (score >= 25 and score < 75) then
                    --tick_gen_max <= 9375000;
                    tick_gen_max <= 9;
                elsif (score >= 75 and score < 175) then
                    --tick_gen_max <= 6200000;
                    tick_gen_max <= 8;
                elsif (score >= 175 and score < 375) then
                    --tick_gen_max <= 3125000;
                    tick_gen_max <= 7;
                else
                    --tick_gen_max <= 2343750;
                    tick_gen_max <= 6;
                end if;
            else
                score <= score;
            end if;
        else
            score <= score;
        end if;
    end if;
end process;

o_tick_gen_max <= std_logic_vector(to_unsigned(tick_gen_max,26));
o_score <= std_logic_vector(score);

end Behavioral;
