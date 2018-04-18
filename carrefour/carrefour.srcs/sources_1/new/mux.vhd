library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
generic(NB_OUTPUT_SIG : integer := 4;
        NB_SELECTION : integer := 4
);
port (  enb : in STD_LOGIC;
        i_counter_2s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_4s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_7s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_9s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_selection : in STD_LOGIC_VECTOR (NB_SELECTION-1 downto 0);
        o_mux : out STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0)
);
end entity mux;

architecture Behavioral of mux is

begin

process (enb,i_selection,i_counter_2s,i_counter_4s,i_counter_7s,i_counter_9s) is
begin 
    if(enb = '1') then
        case i_selection is
            when "1000" =>  o_mux  <= i_counter_2s;
            when "0100" =>  o_mux  <= i_counter_9s;
            when "0010" =>  o_mux  <= i_counter_4s;
            when "0001" =>  o_mux  <= i_counter_7s;
            when others =>  o_mux  <= "1111";
        end case;
    else
        o_mux  <= "1111";
    end if;
end process;

end Behavioral;
