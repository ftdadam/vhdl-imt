library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin2bcd is
generic(
    NB_COUNTER : integer := 12
);
port (
    i_binary : in STD_LOGIC_VECTOR (NB_COUNTER-1 downto 0);
    o_digit_0 : out STD_LOGIC_VECTOR (3 downto 0);
    o_digit_1 : out STD_LOGIC_VECTOR (3 downto 0);
    o_digit_2 : out STD_LOGIC_VECTOR (3 downto 0);
    o_digit_3 : out STD_LOGIC_VECTOR (3 downto 0)
);
end bin2bcd;

architecture Behavioral of bin2bcd is

begin

process (i_binary) is
    variable aux_counter : integer := 0;
    variable digit_0 : integer := 0;
    variable digit_1 : integer := 0;
    variable digit_2 : integer := 0;
    variable digit_3 : integer := 0;
begin
    aux_counter := 0;
    for ptr in 0 to NB_COUNTER-1 loop 
        if (i_binary(ptr) = '1') then aux_counter := aux_counter + 2**ptr;  end if; 
    end loop;

    digit_0 := 0;
    digit_1 := 0;
    digit_2 := 0;
    digit_3 := 0;

    for ptr in 1 to 4 loop
	    exit when (aux_counter < 1000); 
	    digit_3 := digit_3 + 1; -- increment the mmds count
	    aux_counter := aux_counter - 1000;
    end loop;
    
    for ptr in 1 to 9 loop
        exit when (aux_counter < 100); 
        digit_2 := digit_2 + 1; -- increment the mmds count
        aux_counter := aux_counter - 100;
    end loop;

    for ptr in 1 to 9 loop
        exit when (aux_counter < 10); 
        digit_1 := digit_1 + 1; -- increment the mmds count
        aux_counter := aux_counter - 10;
    end loop;
    
    digit_0 := aux_counter;

    case digit_0 is 
        when 9 => o_digit_0 <= "1001";
        when 8 => o_digit_0 <= "1000";
        when 7 => o_digit_0 <= "0111";
        when 6 => o_digit_0 <= "0110";
        when 5 => o_digit_0 <= "0101";
        when 4 => o_digit_0 <= "0100";
        when 3 => o_digit_0 <= "0011";
        when 2 => o_digit_0 <= "0010";
        when 1 => o_digit_0 <= "0001";
        when 0 => o_digit_0 <= "0000";
        when others =>  o_digit_0 <= "0000"; 
    end case; 
    
    case digit_1 is 
        when 9 => o_digit_1 <= "1001";
        when 8 => o_digit_1 <= "1000";
        when 7 => o_digit_1 <= "0111";
        when 6 => o_digit_1 <= "0110";
        when 5 => o_digit_1 <= "0101";
        when 4 => o_digit_1 <= "0100";
        when 3 => o_digit_1 <= "0011";
        when 2 => o_digit_1 <= "0010";
        when 1 => o_digit_1 <= "0001";
        when 0 => o_digit_1 <= "0000";
        when others =>  o_digit_1 <= "0000"; 
    end case; 
    case digit_2 is 
        when 9 => o_digit_2 <= "1001";
        when 8 => o_digit_2 <= "1000";
        when 7 => o_digit_2 <= "0111";
        when 6 => o_digit_2 <= "0110";
        when 5 => o_digit_2 <= "0101";
        when 4 => o_digit_2 <= "0100";
        when 3 => o_digit_2 <= "0011";
        when 2 => o_digit_2 <= "0010";
        when 1 => o_digit_2 <= "0001";
        when 0 => o_digit_2 <= "0000";
        when others =>  o_digit_2 <= "0000"; 
    end case; 
    case digit_3 is 
        when 4 => o_digit_3 <= "0100";
        when 3 => o_digit_3 <= "0011";
        when 2 => o_digit_3 <= "0010";
        when 1 => o_digit_3 <= "0001";
        when 0 => o_digit_3 <= "0000";
        when others =>  o_digit_3 <= "0000"; 
    end case;


end process;

end Behavioral;
