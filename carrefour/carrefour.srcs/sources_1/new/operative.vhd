library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity operative is
generic(NB_DISPLAY : integer := 8;
        NB_OUTPUT_SIG : integer := 4;
        NB_SELECTION : integer := 4
);
port (  enb_secu : in STD_LOGIC;
        enb_lrv : in STD_LOGIC;
        enb_lro : in STD_LOGIC;
        enb_lcv : in STD_LOGIC;     
        enb_counter : in STD_LOGIC;   
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_display : out STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0);
        o_validate : out STD_LOGIC;
        o_fsecu : out STD_LOGIC;
        o_frv : out STD_LOGIC;
        o_fro : out STD_LOGIC;
        o_fcv : out STD_LOGIC
);

CONSTANT COUNTER_1S_SIZE : integer := 5;
CONSTANT COUNTER_1S_MAX  : integer := 20;
CONSTANT COUNTER_SIZE : integer := 4;
CONSTANT NB_OUTPUT : integer := 4;
CONSTANT NB_SELECT : integer := 4;

end entity operative;

architecture Behavioral of operative is

component counter_1s is
generic(
        G_SIZE : integer;
        G_MAX : integer
        );
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        o_endcount : out STD_LOGIC
);
end component;

component counter_sec is
generic(
        G_SIZE : integer
);
port (  enb : in STD_LOGIC;
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        i_init : in STD_LOGIC;
        i_init_value : in STD_LOGIC_VECTOR (G_SIZE-1 downto 0);
        o_count : out STD_LOGIC_VECTOR (G_SIZE-1 downto 0);
        o_endcount : out STD_LOGIC
);
end component;

component mux is
generic(NB_OUTPUT_SIG : integer;
        NB_SELECTION : integer
);
port (  enb : in STD_LOGIC;
        i_counter_2s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_4s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_7s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_9s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_selection : in STD_LOGIC_VECTOR (NB_SELECTION-1 downto 0);
        o_mux : out STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0)
);
end component;

component deco is
generic(
    NB_OUTPUT_SIG : integer;
    NB_DISPLAY : integer
    );
port ( enb : in STD_LOGIC;
       i_mux : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
       o_display : out STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0)
       );
end component;

-- SIGNALS
signal s_rdy_1s : STD_LOGIC;
signal s_init_value_9s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_init_value_7s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_init_value_4s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_init_value_2s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_count_9s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_count_7s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_count_4s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_count_2s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_enb_concat : STD_LOGIC_VECTOR (NB_SELECTION-1 downto 0);
signal s_mux : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_enb_show : STD_LOGIC;

begin

s_init_value_9s <= "1001";
s_init_value_7s <= "0111";
s_init_value_4s <= "0100";
s_init_value_2s <= "0010";
s_enb_concat <= enb_secu & enb_lrv & enb_lro & enb_lcv;
s_enb_show <= enb_secu or enb_lrv or enb_lro or enb_lcv;
o_validate <= enb_secu and enb_lrv and enb_lro and enb_lcv; -- change!!!!

u_counter_1s : counter_1s
generic map(
    G_SIZE      => COUNTER_1S_SIZE ,
    G_MAX       => COUNTER_1S_MAX
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => enb_counter          ,
    o_endcount  => s_rdy_1s
);

u_counter_9s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_lrv              ,
    i_init_value => s_init_value_9s ,
    o_endcount => o_frv             ,
    o_count => s_count_9s
);

u_counter_7s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_lcv              ,
    i_init_value => s_init_value_7s ,
    o_endcount => o_fcv             ,
    o_count => s_count_7s
);

u_counter_4s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_lro              ,
    i_init_value => s_init_value_4s ,
    o_endcount => o_fro             ,
    o_count => s_count_4s
);

u_counter_2s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_secu             ,
    i_init_value => s_init_value_2s ,
    o_endcount => o_fsecu           ,
    o_count => s_count_2s
);

u_mux : mux
generic map(NB_OUTPUT_SIG => NB_OUTPUT,
            NB_SELECTION => NB_SELECT
)
port map (  enb => s_enb_show,
            i_counter_2s => s_count_2s,
            i_counter_4s => s_count_4s,
            i_counter_7s => s_count_7s,
            i_counter_9s => s_count_9s,
            i_selection => s_enb_concat,
            o_mux => s_mux
);

u_deco : deco
generic map(
    NB_OUTPUT_SIG => NB_OUTPUT_SIG,
    NB_DISPLAY => NB_DISPLAY
    )
port map( enb => s_enb_show,
       i_mux => s_mux,
       o_display => o_display
       );

end Behavioral;
