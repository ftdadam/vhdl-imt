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
        o_fsecu : out STD_LOGIC;
        o_frv : out STD_LOGIC;
        o_fro : out STD_LOGIC;
        o_fcv : out STD_LOGIC
);

CONSTANT COUNTER_1S_SIZE : integer := 5;
CONSTANT COUNTER_1S_MAX  : integer := 1;
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
generic(
        NB_OUTPUT_SIG : integer
);
port (  enb : in STD_LOGIC;
        i_counter_1s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_3s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_5s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_counter_7s : in STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0);
        i_selection : in STD_LOGIC_VECTOR (3 downto 0);
        o_mux : out STD_LOGIC_VECTOR (NB_OUTPUT_SIG-1 downto 0)
);
end component;

component deco is
generic(
    NB_DISPLAY : integer
    );
port ( enb : in STD_LOGIC;
       i_mux : in STD_LOGIC_VECTOR (3 downto 0);
       o_display : out STD_LOGIC_VECTOR (NB_DISPLAY-1 downto 0)
       );
end component;

-- SIGNALS
signal s_rdy_1s : STD_LOGIC;
signal s_init_value_7s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_init_value_5s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_init_value_3s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_init_value_1s : STD_LOGIC_VECTOR (COUNTER_SIZE-1 downto 0);
signal s_count_7s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_count_5s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_count_3s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_count_1s : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_enb_concat : STD_LOGIC_VECTOR (NB_SELECTION-1 downto 0);
signal s_mux : STD_LOGIC_VECTOR (NB_OUTPUT-1 downto 0);
signal s_enb_show : STD_LOGIC;

begin

s_init_value_7s <= "0111";
s_init_value_5s <= "0101";
s_init_value_3s <= "0011";
s_init_value_1s <= "0001";
s_enb_concat <= enb_secu & enb_lrv & enb_lro & enb_lcv;
s_enb_show <= enb_secu or enb_lrv or enb_lro or enb_lcv;

u_counter_s : counter_1s
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

u_counter_7s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_lrv              ,
    i_init_value => s_init_value_7s ,
    o_endcount => o_frv             ,
    o_count => s_count_7s
);

u_counter_5s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_lcv              ,
    i_init_value => s_init_value_5s ,
    o_endcount => o_fcv             ,
    o_count => s_count_5s
);

u_counter_3s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_lro              ,
    i_init_value => s_init_value_3s ,
    o_endcount => o_fro             ,
    o_count => s_count_3s
);

u_counter_1s : counter_sec
generic map(
    G_SIZE      => COUNTER_SIZE
)
port map(
    clk     => clk                  ,
    rst     => rst                  ,
    enb     => s_rdy_1s             ,
    i_init  => enb_secu             ,
    i_init_value => s_init_value_1s ,
    o_endcount => o_fsecu           ,
    o_count => s_count_1s
);

u_mux : mux
generic map(
            NB_OUTPUT_SIG => NB_OUTPUT_SIG
)
port map (  enb => s_enb_show,
            i_counter_1s => s_count_1s,
            i_counter_3s => s_count_3s,
            i_counter_5s => s_count_5s,
            i_counter_7s => s_count_7s,
            i_selection => s_enb_concat,
            o_mux => s_mux
);

u_deco : deco
generic map(
    NB_DISPLAY => NB_DISPLAY
    )
port map( enb => s_enb_show,
       i_mux => s_mux,
       o_display => o_display
       );

end Behavioral;
