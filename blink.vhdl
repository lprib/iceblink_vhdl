architecture blink of leds is
    signal idx: integer range 0 to 3;
begin

    process (clk)
        variable counter : unsigned (23 downto 0);
    begin
        if rising_edge(clk) then
            if counter = 400_000 then
                counter := x"000000";

                if idx = 3 then
                    idx <= 0;
                else
                    idx <= idx + 1;
                end if;

            else
                counter := counter + 1;
            end if;

        end if;
    end process;

    led1 <= '1' when idx = 0 else '0';
    led2 <= '1' when idx = 1 else '0';
    led3 <= '1' when idx = 2 else '0';
    led4 <= '1' when idx = 3 else '0';
end blink;