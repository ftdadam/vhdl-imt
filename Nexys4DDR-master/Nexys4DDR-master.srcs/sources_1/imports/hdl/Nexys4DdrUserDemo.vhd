library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Nexys4DdrUserDemo is
   port(
      clk_i          : in  std_logic;
      rstn_i         : in  std_logic;
      -- VGA display
      vga_hs_o       : out std_logic;
      vga_vs_o       : out std_logic;
      vga_red_o      : out std_logic_vector(3 downto 0);
      vga_blue_o     : out std_logic_vector(3 downto 0);
      vga_green_o    : out std_logic_vector(3 downto 0)
   );
end Nexys4DdrUserDemo;

architecture Behavioral of Nexys4DdrUserDemo is

----------------------------------------------------------------------------------
-- Component Declarations
----------------------------------------------------------------------------------  

-- 200 MHz Clock Generator
component ClkGen
port
 (-- Clock in ports
  clk_100MHz_i           : in     std_logic;
  -- Clock out ports
  clk_100MHz_o          : out    std_logic;
  clk_200MHz_o          : out    std_logic;
  -- Status and control signals
  reset_i             : in     std_logic;
  locked_o            : out    std_logic
 );
end component;


COMPONENT Vga is
PORT( 
   clk_i          : in  std_logic;
   vga_hs_o       : out std_logic;
   vga_vs_o       : out std_logic;
   vga_red_o      : out std_logic_vector(3 downto 0);
   vga_blue_o     : out std_logic_vector(3 downto 0);
   vga_green_o    : out std_logic_vector(3 downto 0);
   RGB_LED_RED    : in STD_LOGIC_VECTOR (7 downto 0);
   RGB_LED_GREEN  : in STD_LOGIC_VECTOR (7 downto 0);
   RGB_LED_BLUE   : in STD_LOGIC_VECTOR (7 downto 0);
   ACCEL_RADIUS   : in  STD_LOGIC_VECTOR (11 downto 0);
   LEVEL_THRESH   : in  STD_LOGIC_VECTOR (11 downto 0);
	ACL_X_IN       : in  STD_LOGIC_VECTOR (8 downto 0);
   ACL_Y_IN       : in  STD_LOGIC_VECTOR (8 downto 0);
   ACL_MAG_IN     : in  STD_LOGIC_VECTOR (11 downto 0);
   MIC_M_DATA_I   : IN STD_LOGIC;
   MIC_M_CLK_RISING  : IN STD_LOGIC;
   MOUSE_X_POS    :  in std_logic_vector (11 downto 0);
   MOUSE_Y_POS    :  in std_logic_vector (11 downto 0);
   XADC_TEMP_VALUE_I : in std_logic_vector (11 downto 0);
   ADT7420_TEMP_VALUE_I : in std_logic_vector (12 downto 0);
   ADXL362_TEMP_VALUE_I : in std_logic_vector (11 downto 0)
   );
END COMPONENT;
  
-- Inverted input reset signal
signal rst        : std_logic;
-- Reset signal conditioned by the PLL lock
signal reset      : std_logic;
signal resetn     : std_logic;
signal locked     : std_logic;

-- 100 MHz buffered clock signal
signal clk_100MHz_buf : std_logic;
-- 200 MHz buffered clock signal
signal clk_200MHz_buf : std_logic;


begin
   
   -- The Reset Button on the Nexys4 board is active-low,
   -- however many components need an active-high reset
   rst <= not rstn_i;

   -- Assign reset signals conditioned by the PLL lock
   reset <= rst or (not locked);
   -- active-low version of the reset signal
   resetn <= not reset;


   -- Assign pdm_clk output
   pdm_clk_o <= pdm_clk;


----------------------------------------------------------------------------------
-- 200MHz Clock Generator
----------------------------------------------------------------------------------
   Inst_ClkGen: ClkGen
   port map (
      clk_100MHz_i   => clk_i,
      clk_100MHz_o   => clk_100MHz_buf,
      clk_200MHz_o   => clk_200MHz_buf,
      reset_i        => rst,
      locked_o       => locked
      );

----------------------------------------------------------------------------------
-- VGA Controller
----------------------------------------------------------------------------------
   Inst_VGA: Vga
   port map(
      clk_i          => clk_100MHz_buf,
      vga_hs_o       => vga_hs_o,
      vga_vs_o       => vga_vs_o,
      vga_red_o      => vga_red_o,
      vga_blue_o     => vga_blue_o,
      vga_green_o    => vga_green_o,
      RGB_LED_RED    => rgb_led_red,
      RGB_LED_GREEN  => rgb_led_green,
      RGB_LED_BLUE   => rgb_led_blue,
      ACCEL_RADIUS   => X"007",
      LEVEL_THRESH   => X"020",
      ACL_X_IN       => ACCEL_X,
      ACL_Y_IN       => ACCEL_Y,
      ACL_MAG_IN     => ACCEL_MAG,
      MIC_M_DATA_I   => pdm_data_i,
      MIC_M_CLK_RISING => pdm_clk_rising,
      MOUSE_X_POS    => MOUSE_X_POS,
      MOUSE_Y_POS    => MOUSE_Y_POS,
      XADC_TEMP_VALUE_I => fpgaTempValue,
      ADT7420_TEMP_VALUE_I => tempValue,
      ADXL362_TEMP_VALUE_I => ACCEL_TMP
      );  
end Behavioral;

