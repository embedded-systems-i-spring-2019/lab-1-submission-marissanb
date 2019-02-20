----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 10:51:33 AM
-- Design Name: 
-- Module Name: fancy_counter_tb - fancy_ctr_tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fancy_counter_tb is
--  Port ( );
end fancy_counter_tb;

architecture fancy_ctr_tb of fancy_counter_tb is
-- declare component to test
component fancy_counter
    port(
        clk, clk_en, dir, en, ld, rst, updn: in std_logic;
        val : in std_logic_vector(3 downto 0);
        cnt: out std_logic_vector(3 downto 0));
end component;

-- create intermediate signals
signal clk_tb: std_logic := '0';
signal  clk_en_tb, dir_tb, en_tb, ld_tb, rst_tb, updn_tb : std_logic := '0';
signal val_tb, cnt_tb : std_logic_vector(3 downto 0);

begin
-- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
        wait for 4 ns;
        clk_tb <= '1';       
        wait for 4 ns;
        clk_tb <= '0';  
    end process clk_gen_proc;

 sim: process
    begin
    en_tb <= '1';
    clk_en_tb <= '1';
    dir_tb <= '0';
    updn_tb <= '1';
    val_tb <= "1010";
    ld_tb <= '1';
    wait for 30 ns;
    rst_tb <= '1';
    dir_tb <= '1';
    wait for 10 ns;
    rst_tb <= '0';
    wait for 40 ns;
       
end process sim;
    
dut: fancy_counter
port map(
        clk => clk_tb, clk_en => clk_en_tb, dir => dir_tb, en => en_tb, ld => ld_tb, rst => rst_tb, updn => updn_tb, val=> val_tb, cnt => cnt_tb);

end fancy_ctr_tb;
