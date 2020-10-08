library ieee;
use ieee.std_logic_1164.all;

entity digitizer is
    port(clk_25MHz: in  std_logic;
         pll_lock:  out std_logic);
end entity;

architecture rtl of digitizer is
    component clock_manager is
        port(clk_25MHz:   in  std_logic;
             clk_100MHz:  out std_logic;
             lock_100MHz: out std_logic);
    end component;
begin
    clk_manager: clock_manager port map(clk_25MHz   => clk_25MHz,
                                        clk_100MHz  => open,
                                        lock_100MHz => pll_lock);
end architecture;
