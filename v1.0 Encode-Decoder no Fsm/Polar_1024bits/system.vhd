----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:39 05/15/2016 
-- Design Name: 
-- Module Name:    system - Behavioral 
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
use work.all;
use work.MyPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity system is
    Port ( clk : in  STD_LOGIC;
           boot : in  STD_LOGIC;
           correct : out  STD_LOGIC);
end system;

architecture Behavioral of system is
constant correct_check: std_logic_vector(N/2-1 downto 0) := (others =>'0');
signal ce_decoder,ce_delay,input_enable: std_logic;
signal in_generator,delay1,delay2,dec_out,check: std_logic_vector(N/2-1 downto 0);
signal encoder_out: std_logic_vector(N-1 downto 0);
signal llr_out: data;
begin
--FSM
input_enable <= '1';
ce_decoder <= '1';
ce_delay <= '1';
check <= (delay2 xor dec_out);
correct <= '1' when (check = correct_check)
else '0';
--Generate Input
U_Input_Generator: entity counter generic map(width => N/2)
											 port map(clk => clk,
														 rst => boot,
														 count => input_enable,
														 q => in_generator);
--Delay Input
U_Delay1: entity D_FF_gen generic map(width => N/2) port map(clk =>clk,rst =>boot,ce =>ce_delay,d => in_generator,q =>delay1);
U_Delay2: entity D_FF_gen generic map(width => N/2) port map(clk =>clk,rst =>boot,ce =>ce_delay,d => delay1,q =>delay2);
														 
--Encoder 														 
U_Encoder: entity Encoder1024 port map(inputs =>in_generator,
													 outputs =>encoder_out);
--llr transform
U_Channel: entity llr_test port map(inputs => encoder_out,
												 outputs => llr_out);
--Decoder												 
U_Decoder: entity Decoder1024 port map(clk => clk,
													rst => boot,
													ce_inputs => ce_decoder,
													inputs => llr_out,
													outputs => dec_out);
													

end Behavioral;

