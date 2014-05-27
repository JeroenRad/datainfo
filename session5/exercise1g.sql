CREATE TABLE bestelling(
isbn VARCHAR(255),
aantal INTEGER,
PRIMARY KEY (isbn),
FOREIGN KEY (isbn) REFERENCES Boek(isbn)
);


CREATE FUNCTION add_boek() RETURNS TRIGGER AS $_$
BEGIN
	IF NOT EXISTS (SELECT auteur FROM Boek b WHERE b.auteur = NEW.auteur) then
	INSERT INTO Bestelling (isbn, aantal) VALUES (NEW.isbn, '10');
	END IF;
	RETURN NEW;
END $_$ LANGUAGE 'plpgsql';

CREATE TRIGGER add_to_bestelling
AFTER INSERT
ON Boek
FOR EACH ROW
EXECUTE PROCEDURE add_boek();