LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY fsm IS
PORT(sw : in std_logic;
		reset : in bit;
     clock : in std_logic; -- clock
     ledR : out std_logic_vector(8 downto 0)); --aktualny stan FSM
END fsm;
 
ARCHITECTURE Behavior OF fsm IS
  --deklaracja sygnałów
  TYPE State_type IS (A, B, C, D, E, F, G, H, I, J, K, L);
  SIGNAL ST : State_type; --stan aktualny
BEGIN
  --
  PROCESS(sw, clock, reset)
  BEGIN
     if(reset ='0') then ST <= A;
     elsif(clock'event and clock='0') then
 
     CASE ST IS
      WHEN A=> IF(sw = '0') THEN ST <= B;
          ELSIF(sw='1') THEN ST <= F;
        END IF;
		WHEN B=> IF(sw = '0') THEN ST <= C;
          ELSE ST <= F;
        END IF;
		WHEN C=> IF(sw = '0') THEN ST <= D;
          ELSE ST <= F;
        END IF;
		WHEN D=> IF(sw = '0') THEN ST <= E;
          ELSE ST <= F;
        END IF;
		WHEN E=> IF(sw = '0') THEN ST <= J;
          ELSE ST <= F;
			END IF;
		WHEN J=> IF(sw = '0') THEN ST <= K;
          ELSE ST <= F;
			 END IF;
		WHEN K=> IF(sw = '0') THEN ST <= L;
          ELSE ST <= F;
			 END IF;
		WHEN L=> IF(sw = '0') THEN ST <= L;
          ELSE ST <= F;
        END IF;
		WHEN F=> IF(sw = '1') THEN ST <= G;
          ELSE ST <= B;
        END IF;
		WHEN G=> IF(sw = '1') THEN ST <= H;
          ELSE ST <= B;
        END IF;
		WHEN H=> IF(sw = '1') THEN ST <= I;
          ELSE ST <= B;
        END IF;
		WHEN I=> IF(sw = '1') THEN ST <= I;
          ELSE ST <= B;
        END IF; 
     END CASE;
     end if;
     END PROCESS; --state table
	PROCESS(ST)
	BEGIN 
		CASE ST IS 
			WHEN A => 
					ledR <= "000000001";
			WHEN B => 
					ledR <= "000000010";
			WHEN C => 
					ledR <= "000000100";
			WHEN D => 
					ledR <= "000001000";
			WHEN E => 
					ledR <= "000010000";
			WHEN F => 
					ledR <= "000100000";
			WHEN G => 
					ledR <= "001000000";
			WHEN H => 
					ledR <= "010000000";
			WHEN I => 
					ledR <= "100000000";
			WHEN J => 
					ledR <= "000010001";
			WHEN K => 
					ledR <= "000010010";
			WHEN L => 
					ledR <= "000010011";
		END CASE;
	END PROCESS;	
END Behavior;