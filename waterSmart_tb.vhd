library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ws_tb is
end ws_tb;

architecture wateSmart of ws_tb is

  component FSM
    port(T,L,CLK,reset : in std_logic;
         M             : in std_logic_vector(2 downto 0);
         output        : out std_logic;
         seg7          : out std_logic_vector(6 downto 0));
  end component FSM;

  signal T,L,CLK,reset :  std_logic;
  signal M : std_logic_vector(2 downto 0);
  signal output: std_logic;
  signal seg7: std_logic_vector(6 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;


begin

  uut: FSM port map ( T      => T,
                         L      => L,
                         CLK    => CLK,
                         reset  => reset,
       			output   => output,
                         M      => M,
                         seg7   => seg7 );

  stimulus: process
  begin

    T <= '0';
    L <= '0';
    M <= "110";
    wait for 20 ns;

    T <= '0';
    L <= '0';
    M <= "001";
    wait for 20 ns;

    T <= '1';
    L <= '0';
    M <= "001";
    wait for 20 ns;

    T <= '0';
    L <= '1';
    M <= "101";
    wait for 20 ns;

    T <= '0';
    L <= '0';
    M <= "101";
    wait for 20 ns;

    T <= '1';
    L <= '1';
    M <= "111";
    wait for 20 ns;

    T <= '1';
    L <= '1';
    M <= "001";
    wait for 20 ns;

    T <= '1';
    L <= '1';
    M <= "011";
    wait for 20 ns;

    stop_the_clock <= true;
    wait;
  end process stimulus;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process clocking;

end wateSmart;
