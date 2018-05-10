CREATE OR REPLACE FUNCTION update_credits() RETURNS TRIGGER AS 
$$
  BEGIN		
    if new.sid NOT IN (select sid from credits) then
      INSERT INTO credits VALUES(new.sid,0,0,null);
    end if;
    if new.grade = 0 then 
      UPDATE credits SET hours_taken = hours_taken + 3 WHERE credits.sid = new.sid;
      UPDATE credits SET gpa = (SELECT sum(grade) FROM grades WHERE grades.sid = new.sid)  / (SELECT count(sid) FROM grades WHERE grades.sid = new.sid);
    elsif new.grade > 4 then 
      UPDATE credits set honor_pts = new.grade - 4 WHERE credits.sid = new.sid;
      UPDATE credits set credit_hours = credit_hours + 3 WHERE credits.sid = new.sid;
      UPDATE credits set hours_taken = hours_taken + 3 WHERE credits.sid = new.sid;
      UPDATE credits set gpa = (SELECT sum(grade) FROM grades WHERE grades.sid = new.sid) / (SELECT count(sid) FROM grades WHERE grades.sid = new.sid);
    else
      UPDATE credits set credit_hours = credit_hours + 3 WHERE credits.sid = new.sid;
      UPDATE credits set hours_taken  = hours_taken + 3 WHERE credits.sid = new.sid;
      UPDATE credits set gpa = (SELECT sum(grade) FROM grades WHERE grades.sid = new.sid) / (SELECT count(sid) FROM grades WHERE grades.sid = new.sid);
    end if;
    if (select gpa from credits where credits.sid = new.sid) < 2.0 then
      if new.sid NOT IN (select sid from probation) then
        INSERT INTO probation VALUES(new.sid,(select gpa from credits where credits.sid = new.sid));
      end if; 
    end if;
    return new;
  end;
$$ language plpgsql;



