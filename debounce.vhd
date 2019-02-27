----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 07:22:39 PM
-- Design Name: 
-- Module Name: debounce - my_debounce
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

entity debounce is
  Port ( 
        btn: in std_logic;
        clk: in std_logic;
        dbnc: out std_logic
  );
end debounce;

architecture my_debounce of debounce is
-- intermediate signals
signal reg: std_logic_vector (1 downto 0);
signal counter: std_logic_vector (2 downto 0):=(others=>'0');
signal counterz: std_logic_vector (2 downto 0):=(others=>'0');

begin

process (clk)

begin
    if rising_edge(clk) then
        reg(1) <= reg(0);
        reg(0) <= btn;
            
            if (unsigned(counter) < 4) then  -- 20 ms
                dbnc <= '0';
                if reg(1)= '1' then            
                    counter <= std_logic_vector(unsigned(counter) + 1);
                else
                    counter <= (others => '0');
                end if;
            else
                dbnc <= '1';
                if (unsigned(counterz) < 4) then  -- 20 ms                  
                    if reg(1)= '0' then            
                        counterz <= std_logic_vector(unsigned(counterz) + 1);
                    else
                        counterz <= (others => '0');
                    end if;
                else
                    dbnc <= '0';
                    counter <= (others => '0');
                    counterz <= (others => '0');                   
                end if;
            end if;
   end if;
end process;
           
end my_debounce;
