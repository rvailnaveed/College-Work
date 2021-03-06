library IEEE;
use IEEE.std_logic_1164.ALL;

entity ripple_adder16tb is
end ripple_adder16tb;
 
architecture Behavioral of ripple_adder16tb is 
    
    component ripple_adder16
        port (
            A : in std_logic_vector(15 downto 0);
            B : in std_logic_vector(15 downto 0);
            Cin : in std_logic;
            S : out std_logic_vector(15 downto 0);
            Cout : out std_logic;
            V : out std_logic
        );
    end component;

    signal A : std_logic_vector(15 downto 0);
    signal B : std_logic_vector(15 downto 0);
    signal Cin : std_logic;

    signal S : std_logic_vector(15 downto 0);
    signal Cout : std_logic;
    signal v : std_logic;
 
begin
 
    uut: ripple_adder16
        Port Map (
            A => A,
            B => B,
            Cin => Cin,
            S => S,
            Cout => Cout,
            v => v
        );

    sim : process

    begin

        wait for 1 ns;

        A <= x"AAAA";
        B <= x"0000";
        Cin <= '0';

        wait for 1 ns;
        A <= x"AAA0";
        B <= x"0000";
        Cin <= '1';

        wait for 1 ns;
        A <= x"1100";
        B <= x"0001";
        Cin <= '0';
        
        wait for 1 ns;
        A <= x"1100";
        B <= x"0001";
        Cin <= '1';
        
        wait for 1 ns;
        A <= x"FFFE";
        B <= x"0001";
        Cin <= '1';

        wait;
   
   end process;

end;
