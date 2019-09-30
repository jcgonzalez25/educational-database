CREATE OR REPLACE FUNCTION student_add() RETURNS TRIGGER AS
$$ 
  BEGIN
    if new.sid NOT IN (SELECT sid FROM credits) then
      INSERT INTO credits VALUES (new.sid)
  END;
$$ psgsql
