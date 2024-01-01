library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_32 is
  port (
    a, b : in unsigned(31 downto 0); -- input operands
    cin : in std_logic; -- carry input
    sum : out unsigned(31 downto 0); -- output sum
    cout : out std_logic -- carry output
  );
end adder_32;

architecture behavioral of adder_32 is
begin
  -- add the input operands and the carry input
  sum <= a + b + ('0' & cin);
  -- assign the carry output to the most significant bit of the sum
  cout <= sum(31);
end behavioral;

