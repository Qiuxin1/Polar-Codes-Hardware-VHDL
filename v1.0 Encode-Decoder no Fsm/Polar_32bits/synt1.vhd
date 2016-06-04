library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity synt1 is
port( 
	  address1	: in signed (5 downto 0);
	  stoixeio1	: out signed (80-1 downto 0)
);
end synt1;


architecture struct of synt1 is

    type rom_type is array (35 downto 0) of signed (79 downto 0);
    constant stoixeia : rom_type :=("00000000000001001011010110101010010011111100101001000010101011101100000000000000",
"00000000000001001010001010101101100000011010110111101010100010011000000000000000",
"00000000000001001000111101100001011001110010001100100100110010000100000000000000",
"00000000000001000111101111000010101110010100110110010100000001111000000000000000",
"00000000000001000110011111001100001110011111111111010110000011101000000000000000",
"00000000000001000101001101111001010100101101001000110100111010111000000000000000",
"00000000000001000011111011000110000101010010001010100110111101000000000000000000",
"00000000000001000010100110101011010010110111001011000101000110011000000000000000",
"00000000000001000001010000100011000011111100111110000000110111000100000000000000",
"00000000000000111111111000100110110101001000000000011111011101010010000000000000",
"00000000000000111110011110101111011001000000011000111001110101011110000000000000",
"00000000000000111101000010110011100100011001001001100100000110110100000000000000",
"00000000000000111011100100101001100010001000111110000110000110100110000000000000",
"00000000000000111010000100000110110011001010001011011011011000011100000000000000",
"00000000000000111000100000111111100100011110011001000110111100010110000000000000",
"00000000000000110110111011000101011011010101110011111010101011001110000000000000",
"00000000000000110101010010001000101001000111111011001111111010011100000000000000",
"00000000000000110011100101110110001101011110011101000010100110011110000000000000",
"00000000000000110001110101111001001010001110000011001001110110011110000000000000",
"00000000000000110000000001110110100111101100001011001110010001100100000000000000",
"00000000000000101110001001010000011100100000100001011011000110000110000000000000",
"00000000000000101100001011100001111011110111001111000000110000100000000000000000",
"00000000000000101010000111111100100011110011001000110111100010101100000000000000",
"00000000000000100111111101100101111111011000101011011010101110100000000000000000",
"00000000000000100101101011010100110101000000001001001011001100111110000000000000",
"00000000000000100011001111100101011101010011101000111110110000000010000000000000",
"00000000000000100000101000010000111000000010001000010100001001110000000000000000",
"00000000000000011101110010010100011100000110010011101100111010011010000000000000",
"00000000000000011010101001000011111111100101110010010001110100010101000000000000",
"00000000000000010111000100100111100100010011111010000001010001010001000000000000",
"00000000000000010010110101101001011011100101100010100011001011110100000000000000",
"00000000000000001101010100100011000100010111000101100100101010011011100000000000",
"00000000000000001110101001011001110011001001011011101010111011011100100000000000",
"11111111111111010110000110101001010101000010000111000000000000000000000000000000",
"11111111111111001101100101100001111001001111011101101000000000000000000000000000",
"11111111111010111101010110000111100100111101110110011000000000000000000000000000");

begin

stoixeio1<=stoixeia(to_integer((unsigned(address1))));
end struct;