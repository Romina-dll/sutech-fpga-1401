library IEEE;
use IEEE.Std_logic_1164.all;

package waterSmart_lib is

	component FSM is 
  		port(T,L,CLK,reset : in std_logic;
       		     M             : in std_logic_vector(2 downto 0);
       		     output        : out std_logic;
       		     seg7          : out std_logic_vector(6 downto 0));
	end component FSM;

	type state_type is (ST0,ST1,ST2);

end package waterSmart_lib ;
