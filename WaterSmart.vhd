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
second_proc : process (T,L,M,present_state)
  begin
    case present_state is
      when ST0 =>
        if(T='1' and L='1')then
          if(M > "011")then
            next_state <= ST0;
            seg7 <= "1110110";
          else
            next_state <= ST1;
            seg7 <= "1000000";
          end if;
        else
          if(M <= "001")then
            next_state <= ST1;
            seg7 <= "1000000";
          else
            next_state <= ST0;
            seg7 <= "1110110";
          end if;
        end if;
      when ST1 =>

        if(M >= "111")then
          next_state <= ST0;
          seg7 <= "1110110";
        elsif(T='1' and L ='1')then
            next_state <= ST1;
            seg7 <= "1000000";
          elsif(M < "011")then
              next_state <= ST1;
              seg7 <= "1000000";
            else
              next_state <= ST0;
              seg7 <= "1110110";
        end if;
      when others =>
        next_state <= ST0;
        seg7 <= "1110110";
    end case;
end process second_proc;
third_proc : process (present_state)
begin
  if(present_state = ST0)then
    output <= '0';
  else
    output <= '1';

  end if;
end process third_proc;

end waterSystem;
