library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity prbs is
generic(
        TAP_0 : integer := 15;
        TAP_1 : integer := 14;
        NB_OUT : integer := 3;
        NB_PRBS : integer := 16
);
port (  
        rst : in STD_LOGIC;
        enb : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_seed : in STD_LOGIC_VECTOR (NB_PRBS - 1 downto 0);
        o_prbs : out STD_LOGIC_VECTOR (NB_OUT - 1 downto 0)
);
end prbs;

architecture Behavioral of prbs is
signal shift_reg : STD_LOGIC_VECTOR (NB_PRBS - 1 downto 0);

begin
process (clk, rst, i_seed) is
begin
    if(rst = '1') then
        shift_reg <= i_seed;
    elsif (rising_edge(clk)) then
        if(enb = '1') then
            shift_reg <=  (shift_reg (NB_PRBS-2 downto 0)) & (shift_reg(TAP_0) xor shift_reg(TAP_1));
        else
            shift_reg <= shift_reg;
        end if;
    end if;
end process;

o_prbs <= shift_reg (NB_PRBS-1 downto NB_PRBS-NB_OUT);

end Behavioral;
