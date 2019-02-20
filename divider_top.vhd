----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/18/2019 03:55:25 PM
-- Design Name: 
-- Module Name: divider_top - my_divider
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_top is
  Port ( 
    clk: in std_logic;
    led0: out std_logic
  );
end divider_top;

architecture my_divider of divider_top is
-- Component declaration
component clock_div
    port( 
        clk : in std_logic;
        div : out std_logic
        );
end component;
-- Intermediate signal declaration
signal led: std_logic;
signal div_i: std_logic;

begin
x1: clock_div port map (div => div_i,
                        clk => clk);

divider: process(clk)
begin
    if rising_edge(clk) then
        if (div_i = '1') then
            led <= NOT(led);
          end if;
     end if;
     led0 <= led;
end process;
     
                        


end my_divider;
