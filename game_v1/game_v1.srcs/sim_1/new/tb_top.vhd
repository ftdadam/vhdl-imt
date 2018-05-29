library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is

component top is
port(
    CLK100MHZ : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR (1 downto 0);
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR (15 downto 0);
    VGA_R : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_B : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_G : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_HS : out STD_LOGIC;
    VGA_VS : out STD_LOGIC
);
end component;

CONSTANT clk_period : time := 10ns;

signal CLK100MHZ : STD_LOGIC := '0';
signal SW : STD_LOGIC_VECTOR (1 downto 0) := "01";
signal BTNU : STD_LOGIC := '0';
signal BTND : STD_LOGIC := '0';
signal LED : STD_LOGIC_VECTOR (15 downto 0);
signal VGA_R : STD_LOGIC_VECTOR (3 downto 0);
signal VGA_B : STD_LOGIC_VECTOR (3 downto 0);
signal VGA_G : STD_LOGIC_VECTOR (3 downto 0);
signal VGA_HS : STD_LOGIC;
signal VGA_VS : STD_LOGIC;

begin

CLK100MHZ <= not CLK100MHZ after clk_period;
SW <= "00" after 4600 ns, "10" after 4700 ns;


u_top : top
port map (
    CLK100MHZ => CLK100MHZ ,
    SW => SW ,
    BTNU => BTNU ,
    BTND => BTND ,
    LED => LED ,
    VGA_R => VGA_R ,
    VGA_B => VGA_B ,
    VGA_G => VGA_G ,
    VGA_HS => VGA_HS ,
    VGA_VS =>VGA_VS  
);

end Behavioral;
