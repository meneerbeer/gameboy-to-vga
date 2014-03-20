----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:30:01 08/02/2013 
-- Design Name: 
-- Module Name:    gb_interceptor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity gb_interceptor is
    Port ( hsync : in  STD_LOGIC;
           vsync : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (14 downto 0);
           write_enable : out  STD_LOGIC);
end gb_interceptor;

 architecture Behavioral of gb_interceptor is
	signal addr_count : STD_LOGIC_VECTOR(14 downto 0) := (others => '0');
	
begin

	addr <= addr_count; 
	
	write_enable <= '1';

		clk_proc: process(clk, vsync, hsync)
		begin

			if falling_edge(clk) then
				if((vsync = '1') and (hsync = '1')) then
					addr_count <= "000000000000001";
				elsif(addr_count = 23039) then
					addr_count <= (others => '0');
				else 
					addr_count <= addr_count + 1;
				end if;
			end if;
		end process;
		
end Behavioral;

