library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control is
--generic(
--);
port (  rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_fsecu : in STD_LOGIC;
        i_frv : in STD_LOGIC;
        i_fro : in STD_LOGIC;
        i_fcv : in STD_LOGIC;
        i_presence : in STD_LOGIC;
        o_enb_secu : out STD_LOGIC;
        o_enb_lrv : out STD_LOGIC;
        o_enb_lro : out STD_LOGIC;
        o_enb_lcv : out STD_LOGIC;
        o_led_rr : out STD_LOGIC;
        o_led_ro : out STD_LOGIC;
        o_led_rv : out STD_LOGIC;
        o_led_cr : out STD_LOGIC;
        o_led_co : out STD_LOGIC;
        o_led_cv : out STD_LOGIC
);

CONSTANT NB_LEDS  : integer := 3;
CONSTANT NB_ENBS  : integer := 4;

end entity control;

architecture Behavioral of control is

type t_state is (s0, s1, s2, s3, s4, s5, s6);
signal s_present : t_state;
signal s_future : t_state;
signal s_tl_r : STD_LOGIC_VECTOR (NB_LEDS-1 downto 0);
signal s_tl_c : STD_LOGIC_VECTOR (NB_LEDS-1 downto 0);
signal s_enbs : STD_LOGIC_VECTOR (NB_ENBS-1 downto 0);

begin

-- This process is combinatorial and sequential
-- The combinatorial part can be seen with the asynchronous reset
-- The rest of the process is sequential, every clock cycle the state of the FSM changes. 
process(clk,rst) is
begin
    if(rst = '1') then
        s_present <= s0;
    elsif(rising_edge(clk)) then
        s_present <= s_future;
    else
        s_present <= s_present;
    end if;
end process;

-- This process is Combinatorial, according to the values of the inputs in
-- each state, the FSM prepares to change to the next state or stays in the current one.

process (i_fsecu,i_frv,i_fro ,i_fcv,i_presence,s_present) is
begin

s_tl_r <= "000";
s_tl_c <= "000";
s_enbs <= "0000";

case (s_present) is
    
    when s0 =>
        if(i_presence = '1') then
            s_future <= s1;
        else
            s_tl_r <= "100";
            s_tl_c <= "001";
            s_enbs <= "0000";
            s_future <= s_present;
        end if;
    
    when s1 =>
        if(i_frv = '1') then
            s_future <= s2;
        else
            s_tl_r <= "100";
            s_tl_c <= "001";
            s_enbs <= "0100";
            s_future <= s_present;
        end if;
    
    when s2 =>
        if(i_fro = '1') then
            s_future <= s3;
        else
            s_tl_r <= "010";
            s_tl_c <= "001";
            s_enbs <= "0010";
            s_future <= s_present;
        end if;

    when s3 =>
        if(i_fsecu = '1') then
            s_future <= s4;
        else
            s_tl_r <= "001";
            s_tl_c <= "001";
            s_enbs <= "1000";
            s_future <= s_present;
        end if;

    when s4 =>
        if(i_fcv = '1') then
            s_future <= s5;
        else
            s_tl_r <= "001";
            s_tl_c <= "100";
            s_enbs <= "0001";
            s_future <= s_present;
        end if;

    when s5 =>
        if(i_fro = '1') then
            s_future <= s6;
        else
            s_tl_r <= "001";
            s_tl_c <= "010";
            s_enbs <= "0010";
            s_future <= s_present;
        end if;

    when s6 =>
        if(i_fsecu = '1') then
            s_future <= s0;
        else
            s_tl_r <= "001";
            s_tl_c <= "001";
            s_enbs <= "1000";
            s_future <= s_present;
        end if;
end case;
end process; 

o_enb_secu <= s_enbs(3);
o_enb_lrv <= s_enbs(2);
o_enb_lro <= s_enbs(1);
o_enb_lcv <= s_enbs(0);
o_led_rr <= s_tl_r(0);
o_led_ro <= s_tl_r(1);
o_led_rv <= s_tl_r(2);
o_led_cr <= s_tl_c(0);
o_led_co <= s_tl_c(1);
o_led_cv <= s_tl_c(2);


end Behavioral;
