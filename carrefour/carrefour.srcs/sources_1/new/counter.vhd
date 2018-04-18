library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter is

generic(G_SIZE : integer := 4
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_count : out STD_LOGIC_VECTOR (G_SIZE-1 downto 0);
        o_endcount : out STD_LOGIC
);


end entity counter;

architecture Behavioral of counter is

-- COMPONENTS


end Behavioral;
