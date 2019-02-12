CREATE OR REPLACE PROCEDURE TEST(X IN VARCHAR, Y IN VARCHAR)
IS
  BEGIN
      ASSUME Z+Y > 10;
      CURSOR Y IS
              SELECT A
              FROM T
              WHERE B = 50;
      CURSOR ID IS
              SELECT B
              FROM T;
      BEGIN
          OPEN ID;
          FETCH ID INTO X;
          CLOSE ID;
          INSERT INTO T(A, B, C) VALUES (X+5, X-5, Y*(Z-2));
          IF X>Y THEN
              X := X-50;
              X := X*9;
              DELETE FROM T WHERE A=X+8 AND B=Y-8;
          ELSIF X<Y THEN
              Y := X-5;
              SELECT A, B INTO X, Y FROM T WHERE A=X+3 AND B=X-3;
          ELSE
              X := X+40;
              UPDATE T SET A=A*(X-9*(Y-3)), B=Y-9 WHERE (A>10 AND B<=(X+Y)-50);
          END IF;
      END;
      ASSERT A-B+C>0;
  END;
