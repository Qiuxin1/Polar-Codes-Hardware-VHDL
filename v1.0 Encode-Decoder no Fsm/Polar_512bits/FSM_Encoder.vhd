-- Implementation #3
-- Three processes to implement Mealy FSM
library IEEE;
use IEEE.std_logic_1164.all;
use work.all;
use work.MyPackage.all;

entity FSM_Encoder is
port (clk: in std_logic;
		rst: in std_logic;
		generator: in std_logic_vector(N/2-1 downto 0);
		counter3: in std_logic_vector(Ndiv2bits-1 downto 0);
		count_en1: out std_logic;
		count_en3: out std_logic;
		dinready : out std_logic);
end entity FSM_Encoder;

architecture behavioral of FSM_Encoder is
 --Insert the following in the architecture before the begin keyword
   --Use descriptive names for the states, like st1_reset, st2_search
   type state_type is (reset,s0,idle);
   signal current_state, next_state : state_type; 
   --Declare internal signals for all outputs of the state-machine
   signal count1,count3,din : std_logic;
	constant max_gen : std_logic_vector(N/2-1 downto 0):= (others=>'1');
	constant max_counter3: std_logic_vector(Ndiv2bits-1 downto 0):= (1=>'0',others=>'1');
   constant one: std_logic_vector(Ndiv2bits-1 downto 0):= (0=>'1', others=>'0');
	--other outputs

begin
	--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (rst = '1') then
            current_state <= reset;
				count_en1 <= '0';
				count_en3 <= '0';
				dinready <= '0';
         else
				dinready <= din;
            current_state <= next_state;
            count_en1 <= count1;
				count_en3 <= count3;
         -- assign other outputs to internal signals
         end if;        
      end if;
   end process;
 
   --MEALY State-Machine - Outputs based on state and inputs
   OUTPUT_DECODE: process (current_state,counter3,generator)
   begin
      --insert statements to decode internal output signals
      --below is simple example
		if(current_state = reset) then
			din <= '0';
			count1 <='0';
			count3 <='0';
		elsif(current_state = s0) then
			if(generator = max_gen) then
				din <= '0';
				count1 <='0';
				count3 <='0';
--			elsif(counter3 = max_counter3) then
--				din <= '1';
--				count1 <='1';
--				count3 <='1';
--			elsif( counter3 = one) then
--				din <='1';
--				count1 <='0';
--				count3 <='1';
--			else
--				din <='1';
--				count1 <='0';
--				count3 <='1';
			else
				din<='1';
				count1 <='1';
				count3 <='1';
			end if;
      elsif(current_state = idle) then
			din <= '0';
			count1 <='0';
			count3<='0';
		else
			din <= '0';
			count1 <='0';
			count3 <='0';
      end if;
   end process;
 
   NEXT_STATE_DECODE: process (current_state, generator, rst)
   begin
      --declare default state for next_state to avoid latches
      next_state <= current_state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (current_state) is
         when reset =>
            if rst = '0' then
					next_state <= s0;
				end if;
         when s0 =>
				if generator = max_gen then
               next_state <= idle;
            end if;
         when idle =>
            next_state <= idle;
         when others =>
            next_state <= reset;
      end case;      
   end process;
	
end architecture behavioral;
