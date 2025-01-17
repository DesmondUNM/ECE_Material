library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity compare_1bit is
port(
  A : in  std_logic;
  B : in  std_logic;
  AGTB : out std_logic;
  ALTB : out std_logic;
  AETB : out std_logic
  );
end entity;

architecture compare_1bit of compare_1bit is
  
begin

AGTB <= A and (not(B));

ALTB <= (not(A)) and B;

AETB <= (not(A) and not(B)) or (A and B);

end compare_1bit; 
