CREATE TABLE Boek (
isbn VARCHAR(255),
titel VARCHAR(255),
auteur VARCHAR(255),
PRIMARY KEY (isbn)
);

CREATE TABLE Exemplaar (
isbn VARCHAR(255),
volgnummer VARCHAR(255),
gewicht VARCHAR(255),
kast VARCHAR(255),
PRIMARY KEY (isbn, volgnummer),
FOREIGN KEY (isbn) REFERENCES Boek(isbn) ON DELETE cascade ON UPDATE cascade
);
