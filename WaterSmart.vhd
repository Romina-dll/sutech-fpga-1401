library IEEE;
use IEEE.std_logic_1164.all;

entity FSM is 
  port(T,L,CLK,reset : in std_logic;
       M             : in std_logic_vector(2 downto 0);
       output        : out std_logic;
       seg7          : out std_logic_vector(6 downto 0));
end FSM;

architecture waterSystem of FSM is

  subtype state_type is std_logic_vector(1 downto 0);
  constant ST0: state_type := "00";
  constant ST1: state_type := "01";
  constant ST2: state_type := "11";
  signal present_state , next_state : state_type;
begin

first_proc : process (CLK,reset,next_state)
  begin
    if(reset = '1')then
      present_state <= ST0;
    elsif(rising_edge(CLK))then
      	present_state <= next_state;

    end if;
end process first_proc;

end waterSystem;
