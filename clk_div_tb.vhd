--
-- filename:    clk_div_tb.vhd
-- written by:  marissa navarro
-- description: testbench for clk_div.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clk_div_tb is
end clk_div_tb;

architecture testbench of clk_div_tb is
-- intermediate signal declarations
    signal tb_clk : std_logic := '0';
    signal tb_div : std_logic;
    signal tb_led: std_logic;
    
-- component declaration   
    component clock_div is
        port(
        
            clk  : in std_logic;        -- 125 Mhz clock            
            div : out std_logic        -- div, '1' 
        
        );
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    

    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : clock_div
    port map (
    
        clk  => tb_clk,
        div => tb_div
        );

    
end testbench; 