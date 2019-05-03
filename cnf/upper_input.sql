CREATE OR REPLACE PROCEDURE MY_ITEM(ID NUMBER, AMOUNT FLOAT)
IS
  BEGIN
	ASSUME AMOUNT > 0 AND T_PRICE > 0 AND PRICE > 0 ;

      DECLARE
          PRICE FLOAT;
      BEGIN
          SELECT T_PRICE INTO PRICE FROM OLDTABLE WHERE T_ID = ID;
          IF AMOUNT >= 1000 THEN
              PRICE := PRICE - 0.1*AMOUNT;
          ELSIF AMOUNT >= 200 AND PRICE > 5000 THEN
              PRICE := PRICE - 0.2*AMOUNT;
          ELSE
              PRICE := PRICE + 0.05*AMOUNT;
          END IF;
          INSERT INTO NEWTABLE(T_ID, T_PRICE, T_AMOUNT)
                          VALUES (ID, PRICE, AMOUNT);
      END;
  ASSERT PRICE > 0 ;
	END;