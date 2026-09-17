LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux4 IS
    PORT (
        dado : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        x : OUT STD_LOGIC
    );
END mux4;

ARCHITECTURE case_arch OF mux4 IS
BEGIN
    PROCESS (s, dado)
    BEGIN
        CASE s IS
            WHEN "00" =>
                x <= dado(0);
            WHEN "01" =>
                x <= dado(1);
            WHEN "10" =>
                x <= dado(2);
            WHEN OTHERS =>
                x <= dado(3);
        END CASE;
    END PROCESS;
END case_arch;