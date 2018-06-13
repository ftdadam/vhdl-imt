library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is

component top is
port(
    CLK100MHZ : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR (15 downto 0);
    BTNU : in STD_LOGIC;
    BTND : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR (15 downto 0);
    VGA_R : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_B : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_G : out STD_LOGIC_VECTOR (3 downto 0);
    VGA_HS : out STD_LOGIC;
    VGA_VS : out STD_LOGIC;
    AN : out STD_LOGIC_VECTOR (3 downto 0);
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC
);
end component;

CONSTANT clk_period : time := 10ns;

signal CLK100MHZ : STD_LOGIC := '0';
signal SW : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
signal BTNU : STD_LOGIC := '0';
signal BTND : STD_LOGIC := '0';
signal LED : STD_LOGIC_VECTOR (15 downto 0);
signal VGA_R : STD_LOGIC_VECTOR (3 downto 0);
signal VGA_B : STD_LOGIC_VECTOR (3 downto 0);
signal VGA_G : STD_LOGIC_VECTOR (3 downto 0);
signal VGA_HS : STD_LOGIC;
signal VGA_VS : STD_LOGIC;
signal AN : STD_LOGIC_VECTOR (3 downto 0);
signal CA : STD_LOGIC;
signal CB : STD_LOGIC;
signal CC : STD_LOGIC;
signal CD : STD_LOGIC;
signal CE : STD_LOGIC;
signal CF : STD_LOGIC;
signal CG : STD_LOGIC;
signal DP : STD_LOGIC;

begin

CLK100MHZ <= not CLK100MHZ after clk_period;
SW <= "0000000000000000" after 4600 ns, "0000000000000010" after 4700 ns;


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
    VGA_VS =>VGA_VS,
    AN => AN,
    CA => CA,
    CB => CB,
    CC => CC,
    CD => CD,
    CE => CE,
    CF => CF,
    CG => CG,
    DP => DP  
);

end Behavioral;
