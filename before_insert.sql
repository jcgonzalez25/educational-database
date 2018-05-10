CREATE OR REPLACE FUNCTION ch() RETURNS TRIGGER AS 
$$
  BEGIN
   if new.class in (select class from grades WHERE grades.sid = new.sid) then
     if new.grade >= (select grade from grades where grades.sid = new.sid and class = new.class) then
       DELETE FROM grades WHERE grades.sid = new.sid and grades.class=new.class;
       INSERT INTO grades VALUES (new.sid,new.deptcode,new.class,new.grade);
     else 
       RAISE EXCEPTION 'CAN NOT RECIEVE CREDIT FOR THE SAME CLASS %',new.class;
     end if;
   end if;
   return new;
  END;
$$ language plpgsql;
