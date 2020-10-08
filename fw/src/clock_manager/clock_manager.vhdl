library ieee;
use ieee.std_logic_1164.all;

entity clock_manager is
    port(clk_25MHz:   in  std_logic;
         clk_100MHz:  out std_logic;
         lock_100MHz: out std_logic);
end entity;

architecture rtl of clock_manager is
    component pll is
        port(CLKI:  in  std_logic;
             RST:   in  std_logic;
             CLKOP: out std_logic;
             LOCK:  out std_logic);
    end component;

    signal lock_25MHz_sync_r:  std_logic;
    signal lock_100MHz_meta_r: std_logic;
begin
    pll_clk_100MHz: pll port map(CLKI  => clk_25MHz,
                                 RST   => '0',
                                 CLKOP => clk_100MHz,
                                 LOCK  => lock_25MHz_sync_r);

    process(clk_100MHz) begin
        if(rising_edge(clk_100MHz)) then
            lock_100MHz_meta_r <= lock_25MHz_sync_r;
            lock_100MHz        <= lock_100MHz_meta_r;
        end if;
    end process;
end architecture;
