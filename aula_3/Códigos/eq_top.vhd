-- library ieee;
-- use ieee.std_logic_1164.all;
-- entity eq_top is
--    port(  
--       sw  : in  std_logic_vector(2 downto 0);
--       led  : out std_logic_vector(3 downto 0)
--    );
-- end eq_top;

-- architecture carch of eq_top is
-- begin
--    -- instantiate 2-bit comparator
--    decoder : entity work.decoder_2_4(cond_arch)
--       port map(
--          a    => sw(1 downto 0),
--          en    => sw(2),
--          y => led
--       );
-- end carch;

-- library ieee;
-- use ieee.std_logic_1164.all;
-- entity eq_top is
--    port(  
--       sw  : in  std_logic_vector(1 downto 0);
--       led  : out std_logic_vector(3 downto 0)
--    );
-- end eq_top;

-- architecture carch of eq_top is
-- begin
--    -- instantiate 2-bit comparator
--    decoder : entity work.decoder_2_4(sel_arch)
--       port map(
--          a    => sw(1 downto 0),
--          en    => sw(2),
--          y => led
--       );
-- end carch;

library ieee;
use ieee.std_logic_1164.all;
entity eq_top is
   port(  
      sw  : in  std_logic_vector(4 downto 1);
      led  : out std_logic_vector(2 downto 0)
   );
end eq_top;

architecture carch of eq_top is
begin
   -- instantiate 2-bit comparator
   encoder : entity work.prio_encoder(if_arch)
      port map(
         r    => sw(3 downto 0),
         pcode => led
      );
end carch;