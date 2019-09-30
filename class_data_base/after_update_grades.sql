CREATE OR REPLACE FUNCTION change_credit() RETURNS TRIGGER AS 
$$ 
  BEGIN 
    if new.grade = 0 then
      if old.grade > 0 then
        UPDATE credits SET credit_hours = credit_hours - 3 WHERE credits.sid = new.sid;
        end if;
      UPDATE credits SET gpa = (select sum(grade) FROM grades WHERE grades.sid = new.sid) / (select count(sid) FROM grades WHERE grades.sid = new.sid) where credits.sid = new.sid;
    elsif new.grade > 0 AND old.grade = 0 then
      if old.grade = 0 then
        UPDATE credits SET credit_hours = credit_hours + 3 WHERE credits.sid = new.sid;
        end if;
      UPDATE credits SET gpa = (select sum(grade) FROM grades WHERE grades.sid = new.sid) / (select count(sid) FROM grades WHERE grades.sid = new.sid) where credits.sid = new.sid;
    else 
      UPDATE credits SET gpa = (select sum(grade) FROM grades WHERE grades.sid = new.sid) / (select count(sid) FROM grades WHERE grades.sid = new.sid) WHERE credits.sid = new.sid;
    end if;
  return new;
  end;
$$ language plpgsql;

