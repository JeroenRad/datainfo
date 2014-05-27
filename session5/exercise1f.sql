CREATE FUNCTION delete_exemplaren() RETURNS TRIGGER AS $_$
BEGIN
	DELETE FROM Exemplaar WHERE Exemplaar.isbn = OLD.isbn;
	RETURN OLD;
END $_$ LANGUAGE 'plpgsql';

CREATE TRIGGER delete_boek
BEFORE DELETE
ON Boek
FOR EACH ROW
EXECUTE PROCEDURE delete_exemplaren();
    