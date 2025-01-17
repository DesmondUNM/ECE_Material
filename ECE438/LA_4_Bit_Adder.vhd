library ieee;
use ieee.std_logic_1164.all;

entity LA_4_Bit_Adder is
  port(
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    carry_in : in std_logic;
    sum : out std_logic_vector(3 downto 0);
    carry_out : out std_logic
    );
  end LA_4_Bit_Adder;
  
architecture LA_4_Bit_Adder OF LA_4_Bit_Adder IS

signal gen : std_logic_vector(3 downto 0); 
signal prop : std_logic_vector(3 downto 0); 
signal carry : std_logic_vector(3 downto 0);
 
begin
    
  gen <= a and b after 2 ns;
  prop <= a xor b after 2 ns;
   
  carry(0) <= carry_in after 2 ns;
  carry(1) <= gen(0) or (prop(0) and carry_in) after 4 ns;
  carry(2) <= gen(1) or
          (prop(1) and gen(0)) or
          (prop(1) and prop(0) and carry_in) after 4 ns;
  carry(3) <= gen(2) or
          (prop(2) and gen(1)) or
          (prop(2) and prop(1) and Gen(0)) OR
          (prop(2) and prop(1) and Prop(0) and carry_in) after 4 ns;
  carry_out <= gen(3) or
          (prop(3) and gen(2)) or
          (prop(3) and prop(2) and gen(1)) or
          (prop(3) and prop(2) and prop(1) and gen(0)) or
          (prop(3) and prop(2) and prop(1) and prop(0) and carry_in) after 4 ns;
    
  sum <= prop xor carry after 2 ns;
end architecture;