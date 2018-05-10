CREATE OR REPLACE FUNCTION addteams() RETURNS TRIGGER AS
$$ 
  BEGIN
    IF new.team1 NOT IN (select team from standings) THEN
      INSERT INTO standings(team) VALUES (new.team1);
    END IF;
    IF new.team2 NOT IN (select team from standings) THEN
      INSERT INTO standings(team) VALUES (new.team2);
    END IF;
    RETURN new;
  END;
$$ language plpgsql;
    
