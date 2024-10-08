----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2024 04:30:02 PM
-- Design Name: 
-- Module Name: mealy1001overlap - Behavioral
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



entity mealy1001overlap is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input : in STD_LOGIC;
           output : out STD_LOGIC);
end mealy1001overlap;

architecture Behavioral of mealy1001overlap is
type state_type  is (A,B,C,D);
signal current_s,next_s:state_type;

begin
 process (clk,reset)
 begin
 if(reset='1')then
 current_s<=A;
 elsif(rising_edge(clk))then
 current_s<=next_s;
 end if;
 end process;
 process(current_s,input)
 begin
 case current_s is
 when A=>
 if(input='0')then
 output<='0';
 next_s<=A;
 else
 output<='0';
 next_s<=B;
 end if;
 when B=>
 if(input='0')then
 output<='0';
 next_s<=C;
 end if;
 when C=>
 if(input='0')then
 output<='0';
 next_s<=D;
 else
 output<='0';
 next_s<= B;
 end if;
 when D=>
 if(input='0')then
 output <='0';
 next_s<= A;
 else
 output<='1';
 next_s<=B;
 end if;
 end case;
 end process;
 
end Behavioral;
