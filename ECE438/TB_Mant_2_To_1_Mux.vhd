library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity TB_Mant_2_To_1_Mux is
end entity;

architecture TB_Mant_2_To_1_Mux of TB_Mant_2_To_1_Mux is  

signal A_Val_Mant : std_logic_vector(27 downto 0);
signal B_Val_Mant : std_logic_vector(27 downto 0);
signal AGTB : std_logic;
signal ALTB : std_logic;
signal AETB : std_logic;
signal Mant_Out : std_logic_vector(27 downto 0); 

begin
  
process
begin

A_Val_Mant <= X"0000000";
B_Val_Mant <= X"0000000";
AGTB <= '0';
ALTB <= '0';
AETB <= '0';
wait for 80 ns;

A_Val_Mant <= X"000000A";
B_Val_Mant <= X"000000B";
AGTB <= '1';
ALTB <= '0';
AETB <= '0';
wait for 80 ns;

A_Val_Mant <= X"000000A";
B_Val_Mant <= X"000000B";
AGTB <= '0';
ALTB <= '1';
AETB <= '0';
wait for 80 ns;

A_Val_Mant <= X"000000A";
B_Val_Mant <= X"000000B";
AGTB <= '0';
ALTB <= '0';
AETB <= '1';
wait for 80 ns;


 


wait;
end process;


UUT_TB_Mant_2_To_1_Mux : entity work.Mant_2_To_1_Mux_Align
port map (
  A_Val_Mant => A_Val_Mant,      --: in std_logic_vector(23 downto 0);
  B_Val_Mant => B_Val_Mant,      --: in std_logic_vector(23 downto 0);
  AGTB => AGTB,      --: in std_logic;
  ALTB => ALTB,      --: in std_logic;
  AETB => AETB,      --: in std_logic;
  Mant_Out => Mant_Out    --: out std_logic_vector(23 downto 0) 
);

end architecture;

