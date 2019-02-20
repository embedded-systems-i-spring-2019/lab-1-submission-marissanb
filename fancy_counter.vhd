----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 10:20:26 AM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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

entity fancy_counter is
  Port ( 
        clk, clk_en, dir, en, ld, rst, updn: in std_logic;
        val : in std_logic_vector(3 downto 0);
        cnt: out std_logic_vector(3 downto 0)
  );
end fancy_counter;

architecture Behavioral of fancy_counter is
-- intermediate signals
signal counter: std_logic_vector(3 downto 0);
signal value: std_logic_vector(3 downto 0);

begin
process (en, clk)
    begin
    if en = '1' then
        if rising_edge(clk) then
            if rst = '1' then
               counter <= (others => '0');
               cnt <= counter;
            elsif ld = '1' then
                value <= val;
                if clk_en = '1' then
                    if updn = '1' then
                        if dir = '1' then
                            if unsigned(counter) < unsigned(value) then
                                counter <= std_logic_vector(unsigned(counter)+1);
                            else
                                counter <= (others => '0');
                            end if;
                        else
                            if unsigned(counter) > "0000" then
                                counter <= std_logic_vector(unsigned(counter)-1);
                            else
                                counter <= value;
                            end if;
                     end if;
                    end if;
                 cnt <= counter;
                 end if;
             end if;
          end if;
      end if;
end process;
                        
end Behavioral;
