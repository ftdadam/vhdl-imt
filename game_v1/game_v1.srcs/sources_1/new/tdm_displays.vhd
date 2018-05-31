library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tdm_displays is
port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enb : in STD_LOGIC;
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

process(rst,enb,clk) is
begin
    if(rst = '1') then
        sel_display <= (others => '0');
    elsif(rising_edge(clk)) then
        if(enb = '1') then
            sel_display <= sel_display + 1;
        else
            sel_display <= sel_display + 1;
        end if;
    end if;
end process;

o_segments <= segments;

case (sel_display) is
    when "00" => o_enb_display <= "0001"; 
    when "01" => o_enb_display <= "0010";
    when "10" => o_enb_display <= "0100";
    when "11" => o_enb_display <= "1000";
    when others => o_enb_display <= "0000";
 end case;
    

end Behavioral;
