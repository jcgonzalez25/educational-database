CREATE OR REPLACE FUNCTION addgame() RETURNS TRIGGER AS
$$ 
  BEGIN
    IF new.team1 = new.team2 THEN
      RAISE EXCEPTION '% CAN NOT PLAY THE SAME TEAM', new.team1;
    ELSIF new.pts1 > new.pts2 THEN
      UPDATE standings SET wins = wins + 1 WHERE standings.team = new.team1;
      UPDATE standings SET losses = losses + 1 WHERE standings.team = new.team2;
    ELSIF new.pts1 < new.pts2 THEN
      UPDATE standings SET wins = wins + 1 WHERE standings.team = new.team2;
      UPDATE standings SET losses = losses + 1 WHERE standings.team = new.team1;
    ELSE
      UPDATE standings SET ties = ties + 1 WHERE standings.team = new.team1;
      UPDATE standings SET ties = ties + 1 WHERE standings.team = new.team2;
    END IF;
    RETURN new;
  END;
$$ language plpgsql;
