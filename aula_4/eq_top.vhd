library ieee;
use ieee.std_logic_1164.all;
entity eq_top is
   port(
      sw  : in  std_logic_vector(15 downto 0); -- 4 switches
      an  : out std_logic_vector(7 downto 0);
      clk : in std_logic;
      sseg : out std_logic_vector(7 downto 0)
   );
end eq_top;

architecture harch of eq_top is
   
   signal s1 : std_logic_vector(7 downto 0);
   signal s2 : std_logic_vector(7 downto 0);
   signal s3 : std_logic_vector(7 downto 0);
   signal s4 : std_logic_vector(7 downto 0);

begin
   
   ledmux2: entity work.led_mux8(arch)
   port map(
      in0 => s1,
      in1 => s2,
      in2 => s3,
      in3 => s4,
      in4 => s1,
      in5 => s2,
      in6 => s3,
      in7 => s4,
      an => an,
      sseg => sseg,
      clk => clk,
      reset => '0'

   );

   hex0_4 : entity work.hex_to_sseg(arch)
      port map(
         hex    => sw(3 downto 0),
         dp    => '1',
         sseg => s1
      );

   hex1_5 : entity work.hex_to_sseg(arch)
      port map(
         hex    => sw(7 downto 4),
         dp    => '1',
         sseg => s2
      );

   hex2_6 : entity work.hex_to_sseg(arch)
      port map(
         hex    => sw(11 downto 8),
         dp    => '1',
         sseg => s3
      );

   hex3_7 : entity work.hex_to_sseg(arch)
      port map(
         hex    => sw(15 downto 12),
         dp    => '1',
         sseg => s4
      );

end harch;