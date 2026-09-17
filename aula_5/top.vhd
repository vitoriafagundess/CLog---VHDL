LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY top IS
    PORT (
        sw : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8 switches -> 0 a 4 xN; 5 a 7 SH
        led : OUT STD_LOGIC_VECTOR(2 DOWNTO 0) -- 3v red LED
    );
END top;

ARCHITECTURE struc_arch OF top IS
    SIGNAL prio : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    prio_cod : ENTITY work.prio_encoder32(cond_arch)
        PORT MAP(
            r => sw(7 DOWNTO 5),
            code => prio(1 DOWNTO 0)
        );

    r1 : FOR i IN 0 TO 2 GENERATE
        r2 : IF (i = 2) GENERATE
            mux0 : ENTITY work.mux4(case_arch)
                PORT MAP(
                    dado(3) => sw(i + 2),
                    dado(2) => sw(i - 1),
                    dado(1) => sw(i),
                    dado(0) => sw(i + 1),
                    s => prio(1 DOWNTO 0),
                    x => led(i)
                );
        END GENERATE r2;
        r3 : IF (i < 2) GENERATE
            mux0 : ENTITY work.mux4(case_arch)
                PORT MAP(
                    dado(3) => sw(i + 2),
                    dado(2) => sw(i + 2),
                    dado(1) => sw(i),
                    dado(0) => sw(i + 1),
                    s => prio(1 DOWNTO 0),
                    x => led(i)
                );
        END GENERATE r3;
    END GENERATE r1;
END struc_arch;