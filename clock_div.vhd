----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/18/2019 10:33:30 AM
-- Design Name: 
-- Module Name: clock_div - my_clock
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

entity clock_div is
  Port (
    clk : in std_logic;
    div : out std_logic
   );
end clock_div;

architecture my_clock of clock_div is
signal counter : std_logic_vector(26 downto 0):= (others => '0'); 
begin

process (clk)
begin
    if rising_edge(clk) then                
        if (unsigned(counter) < 62499999) then
            counter <= std_logic_vector(unsigned(counter) + 1);      
                else
                    counter <= (others => '0');                    
                end if;                  
         if (unsigned(counter) < 31250000) then
             div <= '1';
         else
            div <= '0';                    
         end if;            
      end if;           

end process;

end my_clock;
