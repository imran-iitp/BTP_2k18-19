CREATE OR REPLACE PROCEDURE TEST(X IN VARCHAR, Y IN VARCHAR)
IS
  BEGIN
      UPDATE T SET A=A*(X-9), N=Y-9 WHERE NOT A>0;
  END;
