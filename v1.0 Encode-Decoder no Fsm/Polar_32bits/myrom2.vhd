library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity myrom2 is
port( 
	  address1	: in signed (9 downto 0);
	  address2	: in signed (9 downto 0);
	  address3	: in signed (9 downto 0);
	  address4	: in signed (9 downto 0);
	  stoixeio1	: out signed (31 downto 0);
	  stoixeio2	: out signed (31 downto 0);
	  stoixeio3	: out signed (31 downto 0);
	  stoixeio4	: out signed (31 downto 0)
);
end myrom2;


architecture struct of myrom2 is

   type rom_type is array (623 downto 0) of signed (31 downto 0);
    constant stoixeia : rom_type :=( "11111010011011100010011101111010","01000000100000011001110101100100","10110010011101101000100011011000","00111010101011001100000011111111",
"00011111011010101110011010110001","01010000010011111011000000001101","10100010010101010001100011110011","00110101101110101100001011111001","01000011100010111100110111001101",        --v4
"01000011011110000111101001010011","01001100010000011101111001101100","01101100000111100011100100101011","01111010011101101010001100001001","01000110001011010010100011011101",
"00110000011111000111000010000101","10110001110111010111000011101010","01011111110011100110101100001011","10111001111111001011101010001001","11010010111000010001111100110100",
"00000011101000111001100001101011","00100010101110101100011111101100","01000101010010101001000000001001","01001111010111101001111000001001","11010100010100110000111011100111",
"00110110101011001000100001100011","00011100111011110111101011111101","01101011010001101110111110001110","11100011001001011000110101111111","10100110100110010000010110011011",
"11101011011001000110000110011110","00000000101011011001101111111000","10011000101011110011110101111111","10101111111110011101010010010011","00110110100100101100101100010011",
"01010001110010001100011011101000","01101000000010111111010001111011","00110111100010001001000111010101","10100011100000010010111011111001","01011000111000110100100111000010",
"11100100001000010101101100110001","01011110011101010100011110001111","11100010101011010011001100110101","11101101011011001110100001011101","10110100011010111111001111000101",
"11100001110111010101111011010100","00101010010101111011010010111100","11000110101111010111110111011011","11110010001010101010001110000111","11011100011110000000110100000100",
"01111010111100110011101010011111","00010011010010001011110100101101","11101000001111100100100100110111","01000111101000011001100111000100","00000010011100000000000001010111",
"00110000100110000011001101001000","00100111001010111001011100010100","11100010010110001110111111110100","11111001001101101010100111111110","10001100111111010111001000100110",
"11011000011110111011100001101000","10101010100010001000010011010100","10101001010001010001101100001110","00110101101101000000111001001111","00010010010100011111100100100111",
"10111011101110000101100111110100","10010101111101100010110000010110","10110010010010011001001000100110","11110100011011100111001110000010","11101001110011101000111011110101",
"01011111001101111001101111010110","10011011000000001110000001111110","00110011101100000000100011010010","01001101001100011100101101011111","10000111010101001101010111000000",
"00101001000011010101011011110101","00111000010111110010011110011100","00110110000000000000001100011100","11100101111011011101000100011011","10111001101000011001011101110100",
"00101110010101101100100010011001","10111101101100110011101111111101","11111011010001110110100101000111","11010011001001000010010110100001","01000001000000100010011001110111",
"11000001100100100101111010101011","01100000100111110011011000110000","10011011011011111110001010001100","11010101100101011010000100010100","10110000100111001111100000010010",
"00011100000011001001011011110101","00000001100010000000100110101111","01000101100100010101100101000110","10101101100001000111100110101000","00110111100001110100010011010100",
"11001000100010011010101101001100","01010001011011000001110100111001","11100000000001010111001000100000","01100100011111100101110110110000","00011001000111111110011000010010",
"10101111110011101110010101101001","01001000001100100110011110011000","10101011000101101011100000011000","10111011011001100101011010011001","01111100100011011110001010111110",
"11110101010101010101111001010110","11110000110100101100100111110110","01010010010010110101011101101100","01011011001101100101011100001000","01011111110111011001110011111110",
"01001110110111000111010101011110","10010000100000010000101100001010","01101100100101101011010000000101","00001100010000100110011011000010","01110011001001101001100111010011",
"00110100000110110101110110011111","01011101001111011010100000110011","11100000101000111110100000101011","00110100010100010111011101110100","10101101000110010010111101110011",
"10011101000010110010101000111110","10000011100000101100000110001111","00111010010110101011001010111011","10011000111000111000110011101010","11101000110010101011111001110100",
"10000111110100000100101101001110","10011011100111000101111000101010","10111000110000010001010010011110","00000010011111101101000001000101","11011001011000111100000000111001",
"11100111100000101000101100100100","00011101000011101000001000111001","01110110100110110100011000111111","01101100110010000010010100110111","10101010011001111101000011100111",
"01100101101110101011101101001101","01010011110111001100100110011111","01001010011000101001011000100001","00001100110101111011001010101000","00110110100010000001101011000101",
"10001100000100011101111011101001","00010001101010111000011101110110","01011111000100111010001111110000","01110110100000001110111001111110","10010100101101111100101000010110",
"01111100010010110010111100100111","01111100101111100001111110101011","00111101011010110010110010111100","00101011100101111110011101001101","11010010101110101100101100100110",
"11011010111011011110001100111101","10010010010111101100101101100101","01000100101001111011101110000011","01010011100000000011011101010001","10000100000011111010000011101101",
"10001001000010001001001001101101","01011010000010011111011001110110","10010111100010011010101010010010","01010111010011001010101100111100","01000000001010001100101010001010",
"11000100010100010111110000110000","11100111111010010101111010110011","11100000011011101000001001010110","11101010101101010010011010111100","10000000000100111000110111001010",
"11011000001001111110110100100000","00100100110000110000110011111010","01101011101000001101001111111011","10011000100000111101101101111100","01100111111011000000100000011000",
"01101011000001010110111011111010","01100001101001010110110010000100","10011100101011000100010101101110","00000001011000111010000100101001","11110000010100010111001010000111",
"10010110110010011111100000101111","11011111110101011000010010011001","10011101101111100010100110110001","11110011111111100010111000100101","11111111000100010111000011010111",
"01011111000000000000110100111101","00001101100101110010010110100101","01000010000010011110100101001101","01110010101110000101101100010010","10001011100111010110000111001100",
"10100100101110001010111101101101","00101010010010001101101001111001","10110101111101101101111001110001","01000100101011011110100110110001","10100101010111011110010101001110",
"01010011111110100000111000001001","00010011100010100000001010001110","00100011000000110010011000011111","11111001100001000110111100101011","00001001111001010000000100110000",
"10110011111011110110010100011010","00000101110101001110100010001010","10110011001110100000010110000010","00010001101010101110001111100110","00110000111010110011011101010011",
"00111111001000110100101101110000","10010010110001100001011101001011","01000001000110100011010010111101","00000101010001100010111001101001","10111001000101000001100110000100",
"10000010100111100101100110011011","10011010001000111100001100011000","01011110011001111110011010010001","00110100000111110111101101110111","11000110100110101101011101111010",
"01010110001110100001001001010000","01101000101010110010100101001001","01111000101111100010101101100100","11001101100011110000100110101101","00010101111011010010101010100101",
"11000001100010101101111010100001","10101001101011010100110001001100","10111110100011001111101111100110","00100110110100110110100000010000","11110011000000010011100011010101",
"01101001000101001010111100011010","11100000001110100100010010001100","10101001110110111111100100011011","00111110010010110101001000000011","00000001111001011011011101010100",
"11110001000011001011001001101101","10110000111010001100101101110111","00001111111101111010111000011111","01111101100011101111110000010100","01110001110010001011001110111110",
"11000111101111101100000110101101","11000011000100011100110001100100","00111001101100111111011001011100","10010100110111001101010111101000","00001111101010001100011001010110",
"00110011000000110011110001111100","00101111100000110100011100010100","11000011010000011010101100000010","00011110011100110011110001111110","00111010011010000010100101001011",
"10101000001010010001111000001110","01110101100101110000101100100011","01010001001011101010010111001011","00001110011100101011110011111011","11101001010110111000001010001011",
"00101010101100110001001011001001","01001001001011101011001000110111","00101110010001001001001111001101","11010110101101000101011001000000","10100010010100100111010010001101",
"00000100100010101000101011001101","01010110101110001010101101011111","11111001001110100111011001110001","00111101000101011111111000101101","01101011111101101001010000110011",
"10001110000101001001001000010110","11011000111010110101011011101111","00110110101011001011100100110001","11001111111111110011110011101111","00010001010101001011001001101010",
"00001011100100011111101011010000","10011100010110010111011011110110","11011010010111111111101101000101","00001110100001111011000110011001","01111110010110001101100100000111",
"01001011101100001101011001101011","01000010100000000110001100001101","00100111111100011001101011100001","11011111001011111000011100100011","10110000000011101001101011111000",
"10001010011111100000110001110000","10110111101001110011100001010001","10010010010010101011101000111100","01101000000110100110110011110001","11101000001000010110100101011111",
"00101111011111110110101001011101","01101101011010001100010000010100","01101110011000101111111000101101","11100000101110001111000001111010","11000000000010110001010011001111",
"11100110111110001001001100100001","00011010001100011101001000010010","11001011001101111100100110111101","11110010100100001100010001111101","11111100000001011011110110101010",
"01001011100001110001110001111001","11100111100010110000111101101010","01011110101011000011100101000000","01010101000100100010011010000000","10111110011001110001101111010000",
"11000001001001101010011001011010","00010111010101101110101100001000","01000000010000111001011110110001","01000111110111110011011000000101","00000010110110110111110001101000",
"01100110100101010000101010100100","00000111001110111111001100100100","01010101001111101111101000001000","01011010110001101010001101001000","10101000101000110110011101101001",
"00011011011111110101110000011000","10111011111111001101000100101101","01111000011010100000011011100010","10100001010100111011110001010111","10110110000110010000110000100101",
"11001011011001000010110100010000","11000110110000101101111001001110","10010001111010011110000001010101","00101101001011101010011001010101","11101011100101110100000010000000",
"01000000001101001011100101001010","10001001001110110011000101000101","00100010101000101100010011100000","10000100011101001100111000000101","00101010010000011011001011011000",
"01100100100000011010101100110010","11011001111101000001010001110111","00100000011110001101100101010100","00000110100110011101010110110110","10101010101111111110110010011101",
"00001010011100010001111001111000","01101111001101011011010100110100","01101010001001111100110111001000","01011100110001111101100110101011","00111101001100011111111010101100",
"11011110100100010110000011001000","00110001100000101101110100111000","11010110111111100100000110010111","00100101011101111011011110000100","01000101101001101111001111000001",
"10100110001100100111100101001101","11101110011110111110100001010111","10111111000111111110001111000101","00011110100011101111011110010001","10101011010011010101110110001001",
"11001111100101011001101010101111","10100101010010000111000011000010","10101001110110101011101101010111","11001100100101110101110001111100","00111001011001100110000111100000",
"00010000101110000010111010010010","01011010100100111111111010100010","01010100110110100010001100010101","11110110001000010100101010101101","10100011110000001101010001110101",
"11000000100000010010111101100000","10110110111000011010110100101100","01101111110010110000010110101110","10001101000000011001111111111111","01001001011001011110011011111000",
"00011010000100111010000110111001","01010011000100111010001010101100","00011101101111111000010001100011","11101011011010010100101001111110","00101101011010111101000100000011",
"01000100100100111011011001100111","01111001001111001111101111001000","10001110111111000011011011000100","11111100010010111001001101011100","11110000001110110101000000001101",
"10010001100010001111101010010111","01011110011110110111101010110111","01101110100111010011100100010000","10000100000000000101000001100011","01001101100011110010000000110100",
"00101111111011000000000001011010","01101000100000000011111111001011","00111001111011100111101100001000","01110100110101111000011011110110","10011101001010111100001111001111",
"01100010001001000110000011100111","00001001001110110111101010100100","11001001111111101001111101001010","11101111011110100000110110010011","10111010100111111100001010010100",
"10110011100011000100110011001111","01010101110100011101101111101111","01001101110010101101011111101001","10110100100010010001101000101100","11111011010010001111000110111000",
"00101100011010101110100100000100","11000110000101000001010001011101","01010110100100100001011000100001","11101110110110101100101111001001","11110010010010010011001000000100",
"01111000001101001100001010001000","01010011110001100110100111000001","00001000101110000100000010101100","11010001100001000011111101100100","10111110100010010001111100110001",
"01101101001100000010100011001101","00001110110001010101011101011001","11101100110100110010011101010100","10100111000000001011001000111100","01110010000011011000001110101010",
"00000100010111100000001101011010","10000100110000100111000111000010","11001000111111100001011001100010","01111111110110001110011100011000","01011100001110011001111111011100",
"10000011001100000010111000000111","01011100001101000000100100010111","01110000010101100010100100101010","01010001111000001100011110011000","01010010001001011011010011010100",
"10100000100110110101100111011010","10110011011011101010100100000111","10011010100011111111001100011111","00010101111100000010100000111110","11001000010010000101010101010011",
"11110101101010001110010001111000","00110010101101100111101010110010","00111000000011001100100100100000","10011000001101100111111011101111","01101010011000001101111111000010",
"00100000001001100100000000111101","00110000110100010101001111000111","01000000101010110001101110111110","10000110111011000000011101100101","10000101011001000110100010000101",
"01001110000010011101100001110001","11010110001110000011110111000011","11111010010110110110110001000111","00011110010101110000100100011010","01101000000001001000011110000101",
"11100111101111010101001010010110","01001110110101010010101000100100","01010011001111011011101010000001","01010101111000010010111011010111","11010011101001110110110101101010",
"00101000111000011110000101010111","11111001100011100000100011011010","00001101010011010100101011010000","10010010110111101101101010110110","11110001001100000011010011111011",
"00011110101111001101101111001011","01011111101110110110111000000110","10010101101000100110111001010110","10011000011110001111010011101100","01011110101110000000100110110010",
"00011000100001101101110101010010","11110111100001100101100000011111","01000100000011010010011110100001","11011000000000001100001011111010","01000100000011111000000111000010",
"01011010001101100111111010001111","01111100001100001000010010011010","10000011100111111111011011111111","01010010100001000100110110001000","10110110011101101110111000101011",
"00110101000010011101010000100100","01000110111111001010011101000101","10001101010010101110001011011010","01101000011010110010110001111010","11011000110001011000011000000110",
"01111000011001011010100100110001","10010000100010100100001011100110","01110101011110110001110101111100","11011001110111011100001101111000","10101010101000110011010010101011",
"00011000101100001111101000000011","00110101101000001110111111010010","11101101010000110111001010001100","00011010100001101100101011111111","10001100111110101001100010101111",
"01111101111010100011001110001010","10010001111111000001010100001010","10111110100101010001110111110101","10010010110111000001011000000101","11010110001111110011001001001011",
"11011010101011001110110100000101","01100101000110011111011010001011","01110010010110011110000011001001","01101000000011001000101111110001","00111000011000011101001101011101",
"11111011001001010001000110001010","10111110000101010011001011010100","11110110001000011010000110111001","00100110011010010101110110010000","00111111111111100000010100000101",
"10110111011000001111001011101111","00011000100101010100010000101100","01111010101001101010011000010110","11111010011111011011001010010011","01101111110011010111010100101100",
"11010101110110110101100001010001","00100100110101000101110001101111","11101010110010101011010001001110","01101100000101001110000001100010","01010011100010011100111000010000",
"10101100100100010100010101100100","00111101110111001000100000101001","01110000111010001101010101010100","10101110010111000000100000011100","00110011100000111011100111000011",
"11011001110000111011100001110111","11111110111000000000101111100100","00000010111111111011001101111011","00100110101001001111001100001101","10100000101111111101011011010011",
"00100111010100010101000101000011","11000110101101100010001000110011","01110110101000010000101111000111","11001001001000011001110001100000","11000110101001010110110110100001",
"10011100000111101100000011100110","00010011111010001000011111110101","10110001000111011101000101010100","01100100010010111001000111111001","00110011001110111100010001111011",
"10001110111001010110001011011100","10011010000111101011010010000110","01011000010010101011111111000000","10101101011100010111101100111101","00001010011001100101111010100111",
"10101001010100101110101011011010","10010010110011001101111001001100","01100101110010000101010001100000","11000000000000001010011000010101","11010011110111001011011010111111",
"01000000110011010010110000001101","11011100111110111110100000110100","11010000100011011001000001110110","00000000011001010010001101001011","00000010100010111100010011101110",
"10101100010100111100010001101100","10110001100110001010101110101001","11110101101000011010111111110000","01011001110000011101010001000001","11111100010000000101011111001101",
"00101000001100100010000010001100","00000010010101110101011101010110","01101101111111111011001011110110","00001100100011111101000100000011","11100101010010001110100110111111",
"10110110100000011111011010011110","01110111001000000100101101001011","10010010101001000001110101110011","10111000000011011111101110111001","11101110111001111111000010000000",
"00111101010111001111111111011111","00100110100110001101010010101001","01110100011111110100101011010000","01100100000110001110001001001111","00010001111111011000001111100111",
"10100000011010011011111010000100","11100111101001110100000001100000","01100111101010000010101010101011","00001001110010110101010111111110","11011101001111101111100100001001",
"00011001010110101100010000000101","10111110011111001111000000011111","01000100100100011110100011000011","01101010011110110000110010000011","00010110110101001100010100100010",
"00001001111101100111101001111110","11011001011001001011001010111110","00010110001001110011000011111110","10111001100101011011010110110111","01000000000001100010011001001001",
"11101101011100000011100101110001","10110010010100100110000001101111","01110001000001110001010111000010","01110001101111100010001110110101","11111001011111011000001001000010",
"01100111000000000001001101010010","10011000001111010001110110111011","10000101101001001101110000000100","01101001011100100000010010001001","00111011000000011010111001110110",
"11010111111000001010001111000101","01010111110011110001000010010001","01110111010111110100010001111101","00011000110010101010011011110110","11101100011011101101101011111001",
"00011000100111000010001000110110","01110101011011011111001101000010","00110010001000110010000101011111","00111010001101111110001000110010","10011101010111110111110111100001",
"01111101001111000010101110110000","00110010110111111111001000010111","11011011000010000101101110101110","00000001100011101101000110001011","11011011000110111001100010001100",
"01010101101011111100100111111101","11010111001101101101111001001000","00100100111100011001101100001001","10000001111101011100101111110000","01110100011111100000100010011110",
"10100010100011101011010111101010","01001101010100010010000100000010","11000011110000011100111010000010","10011001010000001100011100011111","10001111111010111011011111001001",
"01110110100100000011101110001111","10000011010100000101111000001111","11100110101101011101110100110001","00100111110010011111111001100100","00010011010111000000100001010101",
"00000110000100001111000010111110","10000000101001011100111001110110","01000100010000001010111100001000","00011000000111001000100110010111","00101010000110100101101010011111",
"10001100011001111010000101011101","11101001010100000101011110001111","00101100011101010100000011110001","11010100101100110111000111111000","01010000001110001100010011010011",
"10100000110011011100001001101101","11100000110011000111001001100011","11010101111110100001101011111011","10110010011010011011011001101001","01010100100100110010001110100010",
"11101001110010111100101101110010","11001100100011011101110101011110","01101111000011100001000111100001","01010010000111101000110111111110","11001100101000101111110111011000",
"10010001001000011001110000100001","00101101010011001110110111010111","00010110010001000100001000010100","10000001010101100001001101101100","10000000000000000000000000000000"
);  

begin

stoixeio1<=stoixeia(to_integer((unsigned(address1))));
stoixeio2<=stoixeia(to_integer((unsigned(address2))));
stoixeio3<=stoixeia(to_integer((unsigned(address3))));
stoixeio4<=stoixeia(to_integer((unsigned(address4))));
end struct;
