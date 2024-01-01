library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_32_tb is
end adder_32_tb;

architecture test of adder_32_tb is
  -- declare the signals to connect to the adder_32 entity
  signal a, b, sum : unsigned(31 downto 0);
  signal cin, cout : std_logic;
  -- create a component of the adder_32 entity
  component adder_32
    port (
      a, b : in unsigned(31 downto 0);
      cin : in std_logic;
      sum : out unsigned(31 downto 0);
      cout : out std_logic
    );
  end component;
begin
  -- instantiate the adder_32 component
  uut : adder_32 port map (a, b, cin, sum, cout);
  -- generate some test vectors for the input operands and the carry input
  stim_proc : process
  begin
    -- test case 1: 256487 + 99999 + 0 = 0
    a <= to_unsigned(256487, 32);
    b <= to_unsigned(99999, 32);
    cin <= '0';
    wait for 10 ns;
    -- test case 2: 11458796 + 15487 + 0 = 2
    a <= to_unsigned(11458796, 32);
    b <= to_unsigned(15487, 32);
    cin <= '0';
    wait for 10 ns;
    -- test case 3: 587964 + 1012563 + 1 = 3
    a <= to_unsigned(587964, 32);
    b <= to_unsigned(1012563, 32);
    cin <= '1';
    wait for 10 ns;
    -- test case 4: 20000 + 10000 + 1 = 30001
    a <= to_unsigned(20000, 32);
    b <= to_unsigned(10000, 32);
    cin <= '1';
    wait for 10 ns;
    -- test case 5: 20000 + 10000 + 0 = 30000
    a <= to_unsigned(20000, 32);
    b <= to_unsigned(10000, 32);
    cin <= '0';
    wait for 10 ns;
    -- stop the simulation
    wait;
  end process;
end test;

