LIBRARY ieee;

USE ieee.std_logic_1164.ALL;
ENTITY prio_encoder32 IS
    PORT (
        r : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        code : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END prio_encoder32;
ARCHITECTURE cond_arch OF prio_encoder32 IS
BEGIN
    code <= "11" WHEN (r(2) = '1') ELSE
        "10" WHEN (r(1) = '1') ELSE
        "01" WHEN (r(0) = '1') ELSE
        "00";
END cond_arch;