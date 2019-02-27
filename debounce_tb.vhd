----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 08:32:48 PM
-- Design Name: 
-- Module Name: debounce_tb - dbnc_tb
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

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture dbnc_tb of debounce_tb is
-- declare component to test
    component debounce
         Port ( 
        btn: in std_logic;
        clk: in std_logic;
        dbnc: out std_logic);
    end component;
-- create intermediate signals
    signal clk_tb: std_logic :='0';
    signal btn_tb: std_logic;
    signal dbnc_tb: std_logic :='0';

begin
-- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
        wait for 4 ns;
        clk_tb <= '1';       
        wait for 4 ns;
        clk_tb <= '0';  
    end process clk_gen_proc;

    btn_sim: process
    begin
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '0';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '1';
        wait for 8 ns;
        btn_tb <= '0';
        wait;
     end process;
     
     dut: debounce 
     port map(
        clk => clk_tb,
        btn => btn_tb,
        dbnc => dbnc_tb);
     

end dbnc_tb;
