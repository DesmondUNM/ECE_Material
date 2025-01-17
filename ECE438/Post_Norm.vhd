library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity Post_Norm is
port(
  AddSubOut : in std_logic_vector(27 downto 0);
  Post_N_Val : out std_logic_vector(27 downto 0)
  );
end entity;

architecture Post_Norm of Post_Norm is  

signal Post_N_One : std_logic_vector(27 downto 0);
signal Post_N_Two : std_logic_vector(27 downto 0);
signal Post_N_Thr : std_logic_vector(27 downto 0);
signal Post_N_For : std_logic_vector(27 downto 0);
signal PostN : std_logic_vector(4 downto 0);

constant Zeros : std_logic_vector(31 downto 0) := X"00000000";
 
begin
                   
PostN(4) <= '1' after 2 ns when AddSubOut(27 downto 12) = X"0000" else '0' after 2 ns;
Post_N_One <= AddSubOut after 2 ns when PostN(4) = '0' else AddSubOut(11 downto 0) & Zeros(15 downto 0) after 2 ns;

PostN(3) <= '1' after 2 ns when Post_N_One(27 downto 20) = X"00" else '0' after 2 ns;
Post_N_Two <= Post_N_One after 2 ns when PostN(3) = '0' else Post_N_One(19 downto 0) & Zeros(7 downto 0) after 2 ns;

PostN(2) <= '1' after 2 ns when Post_N_Two(27 downto 24) = "0000" else '0' after 2 ns;
Post_N_Thr <= Post_N_Two after 2 ns when PostN(2) = '0' else Post_N_Two(23 downto 0) & Zeros(3 downto 0) after 2 ns;

PostN(1) <= '1' after 2 ns when Post_N_Thr(27 downto 26) = "00" else '0'after 2 ns;
Post_N_For <= Post_N_Thr after 2 ns when PostN(1) = '0' else Post_N_Thr(25 downto 0) & Zeros(1 downto 0) after 2 ns;

PostN(0) <= '1' after 2 ns when Post_N_For(27) = '0' else '0'after 2 ns;
Post_N_Val <= Post_N_For after 2 ns when PostN(0) = '0' else Post_N_For(26 downto 0) & Zeros(0) after 2 ns;

end architecture;

