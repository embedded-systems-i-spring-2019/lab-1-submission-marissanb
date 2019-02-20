----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 12:37:22 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_top is
  Port ( 
        btn: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        sw: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0)
  );
end counter_top;

architecture Behavioral of counter_top is
-- component declaration
component clock_div
    port(
    clk : in std_logic;
    div : out std_logic);
end component;
component debounce
    Port ( 
        btn: in std_logic;
        clk: in std_logic;
        dbnc: out std_logic);
end component;
component fancy_counter
    port (
    clk, clk_en, dir, en, ld, rst, updn: in std_logic;
        val : in std_logic_vector(3 downto 0);
        cnt: out std_logic_vector(3 downto 0));
end component;
-- intermediate signals
signal dbnc1, dbnc2, dbnc3, dbnc4, div_out : std_logic;
begin
u1: debounce port map(
    btn => btn(0),
    clk => clk,
    dbnc => dbnc1);
u2: debounce port map(
    btn => btn(1),
    clk => clk,
    dbnc => dbnc2);
u3: debounce port map(
    btn => btn(2),
    clk => clk,
    dbnc => dbnc3);
u4: debounce port map(
    btn => btn(3),
    clk => clk,
    dbnc => dbnc4);
u5: clock_div port map(
    clk => clk,
    div => div_out);
u6: fancy_counter port map(
    clk => clk,
    clk_en => div_out,
    dir => sw(0),
    en => dbnc2,
    ld => dbnc4,
    rst => dbnc1,
    updn => dbnc3,
    val => sw,
    cnt => led);

end Behavioral;
