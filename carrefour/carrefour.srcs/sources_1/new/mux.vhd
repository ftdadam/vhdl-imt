library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
generic(NB_OUTPUT_SIG : integer := 4
);
port (  enb : in STD_LOGIC;
        i_counter_1s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_3s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_5s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_7s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_selection : in STD_LOGIC_VECTOR (3 downto 0);
        o_mux : out STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0)
);
end entity mux;

architecture Behavioral of mux is

begin

-- This process is combinatorial, acording to the selection input, the multiplexer
-- switches its output, giving it to the decoder to turn on the displays.
-- We included an enable signal to turn off the displays if the road was permanently on green
-- We also included a default case to avoid latches.
process (enb,i_selection,i_counter_1s,i_counter_3s,i_counter_5s,i_counter_7s) is
begin 
    if(enb = '1') then
        case i_selection is
            when "1000" =>  o_mux  <= i_counter_1s;
            when "0100" =>  o_mux  <= i_counter_7s;
            when "0010" =>  o_mux  <= i_counter_3s;
            when "0001" =>  o_mux  <= i_counter_5s;
            when others =>  o_mux  <= "1111";
        end case;
    else
        o_mux  <= "1111";
    end if;
end process;

end Behavioral;
