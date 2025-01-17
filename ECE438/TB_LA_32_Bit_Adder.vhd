library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity TB_LA_32_Bit_Adder is
end entity;

architecture TB_LA_32_Bit_Adder of TB_LA_32_Bit_Adder is  

signal a : STD_LOGIC_VECTOR(27 downto 0);
signal b : STD_LOGIC_VECTOR(27 downto 0);
signal C_IN : STD_LOGIC;
signal SUM : STD_LOGIC_VECTOR(27 downto 0);
signal C_OUT : STD_LOGIC;

begin
  
process
begin  
  
a <= X"0000000";
b <= X"0000000";
C_IN <= '0';
wait for 80 ns;
  
a <= X"0000010";
b <= X"0000001";
C_IN <= '0';
wait for 80 ns;

a <= X"0000100";
b <= X"0000001";
C_IN <= '0';
wait for 80 ns;  

a <= X"0101010";
b <= X"1010101";
C_IN <= '0';
wait for 80 ns; 

a <= X"0101010";
b <= X"1010101";
C_IN <= '1';
wait for 80 ns;  
    
    
    
wait;
end process;

UUT_LA_32_Bit_Adder: entity work.LA_32_Bit_Adder
port map (
a => a, --: IN STD_LOGIC_VECTOR(31 downto 0);
b => b, --: IN STD_LOGIC_VECTOR(31 downto 0);
C_IN => C_IN, --: IN STD_LOGIC;
SUM => Sum,     --: OUT STD_LOGIC_VECTOR(31 downto 0);
C_OUT => C_OUT    --: OUT STD_LOGIC
);

end architecture;
