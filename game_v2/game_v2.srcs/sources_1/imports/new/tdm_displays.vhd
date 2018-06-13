library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tdm_displays is
port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    i_digit_0 : in STD_LOGIC_VECTOR (3 downto 0);
    i_digit_1 : in STD_LOGIC_VECTOR (3 downto 0);
    i_digit_2 : in STD_LOGIC_VECTOR (3 downto 0);
    i_digit_3 : in STD_LOGIC_VECTOR (3 downto 0);
    o_segments : out STD_LOGIC_VECTOR (7 downto 0);
    o_enb_display : out STD_LOGIC_VECTOR (3 downto 0)
);
end tdm_displays;

architecture Behavioral of tdm_displays is
    signal sel_display : STD_LOGIC_VECTOR (1 downto 0);
    signal digit : STD_LOGIC_VECTOR (3 downto 0);
begin

process(clk,rst) is
begin
    if(rst ='1') then
        sel_display <= (others => '0');
    elsif(rising_edge(clk)) then
        sel_display <= sel_display + 1;
    end if;
end process;

o_enb_display <= "1110" when sel_display = "00" else 
                 "1101" when sel_display = "01" else
                 "1011" when sel_display = "10" else
                 "0111" when sel_display = "11" else
                 "1111";

digit <= i_digit_0 when sel_display = "00" else 
         i_digit_1 when sel_display = "01" else
         i_digit_2 when sel_display = "10" else
         i_digit_3 when sel_display = "11" else
         "0000";
---------------ABCDEFGH
o_segments <= "00000011" when digit = "0000" else --03
              "10011111" when digit = "0001" else --9F
              "00100101" when digit = "0010" else --25
              "00001101" when digit = "0011" else --0D
              "10011001" when digit = "0100" else --99
              "01001001" when digit = "0101" else --49
              "01000001" when digit = "0110" else --41
              "00011111" when digit = "0111" else --1F
              "00000001" when digit = "1000" else --01
              "00011001" when digit = "1001" else --19
              "11111111"; --FF

end Behavioral;
