
insert into artist (
values (0, 'David Bowie', 'UK'),
(1, 'The Beatles',  'UK'),
(2, 'Iggy Pop',  'USA'),
(3, 'Roxy Music', 'UK'),
(4, 'Kraftwerk', 'Germany'),
(5, 'Black Sabbath', 'UK'),
(6, 'Damian Marley', 'Jamaica'),
(7, 'The Cure', 'UK'),
(8, 'The Doors', 'USA'),
(9, 'Guns N'' Roses', 'USA'),
(10, 'Nirvana', 'USA'),
(11, 'The Faces', 'UK'),
(12, 'Jimi Hendrix', 'USA'),
(13, 'Kate Bush', 'UK'),
(14, 'The Velvet Underground', 'USA'),
(15, 'The Stone Roses', 'UK'),
(16, 'Radiohead', 'UK'),
(17, 'The Rolling Stones', 'UK'),
(18, 'Public Enemy', 'USA'),
(19, 'Led Zeppelin', 'UK'),
(20, 'The Black Crowes', 'USA'),
(21, 'John Lennon', 'UK')
);

insert into genre (
values ('rock', 'rock, metal'), 
('art rock', 'intellectual rock'),
('psychedelic rock', 'rock inspired by psychedelic culture'), 
('alternative', NULL),
('dancehall', 'a form of reggae'),
('electronica', 'music utilising mostly electronic sounds'),
('dance', 'rhythmic music with bpm > 100'),
('rap', 'rhythmic music with rhyming and rhythmic spoken word vocals'),
('art pop', 'intellectual pop')
);


insert into album 
(
values (0, 0, 'Diamond Dogs', 'RCA', '1974', 'rock', 7.99),
(1, 0, 'Station to Station', 'RCA', '1976', 'rock', 6.99),
(2, 1, 'The Beatles', 'Apple', '1968', NULL, 10.99),
(3, 2, 'The Idiot', 'RCA', '1977', 'rock', 5.99),
(4, 3, 'For Your Pleasure', 'Island', '1973', 'art rock', 4.99),
(5, 1, 'Revolver', 'Parlophone', '1966', 'psychedelic rock', 9.99),
(6, 5, 'Sabbath Bloody Sabbath', 'Vertigo', '1973', 'rock', 5.99),
(7, 6, 'Welcome to Jamrock', 'Universal', 2005, 'dancehall', 7.99),
(8, 7, 'The Top', 'Fiction', '1984', NULL, 4.99),
(9, 8, 'Strange Days', 'Elektra', '1967', 'rock', 4.99),
(10, 9, 'Appetite for Destruction', 'Geffen', '1987', 'rock', 5.99),
(11, 4, 'Trans-Europe Express', 'Kling Klang', '1977', 'electronica', 9.99),
(12, 10, 'Bleach', 'Sub Pop', '1989', 'rock', 8.99),
(13, 0, 'The Man Who Sold The World', 'RCA', '1970', 'rock', 5.99),
(14, 1, 'Abbey Road', 'Apple', '1969', NULL, 9.99),
(15, 13, 'Hounds of Love', 'EMI', '1985', 'art pop', 5.99),
(16, 14, 'The Velvet Underground and Nico', 'Verve', '1967', 'art rock', 4.99),
(17, 15, 'The Stone Roses', 'Silvertone', '1989', 'alternative', 4.99),
(18, 16, 'Kid A', 'Parlophone', '2000', 'alternative', 7.99),
(19, 17, 'Exile On Main St', 'Rolling Stones Records', '1972', 'rock', 9.99),
(20, 18, 'It Takes A Nation Of Millions To Hold Us Back', 'Def Jam','1989', 'rap', 7.99),
(21, 19, 'Led Zeppelin', 'Atlantic', '1969', 'rock', 4.99),
(22, 20, 'The Southern Harmony and Musical Companion', 'Def American', '1992', 'rock', 5.99),
(23, 21, 'Imagine', 'Apple', '1971', 'rock', 4.99)
);

insert into customer
(
values (0, 'Terry', 'David', '14', 'N164PT', 1234), 
(1, 'Terry', 'David', '34b', 'NW16HJ', 2343),
(2, 'Constance', 'Wilson', 3, 'MK24UJ', 4354),
(3, 'Helen', 'Babbage', '4', 'B705GH', 6577),
(4, 'Bill', 'Drummond', '40', 'OX15FH', 8877),
(5, 'Ada', 'Partridge', '77', 'LS705DF', 4545),
(6, 'William', 'Stringer', '2202c', 'E172RW', 1231),
(7, 'Rodney', 'Silvers', '2', 'AL18RT', 2846),
(8, 'Jimmy', 'Osmond', '1874', 'M45FT', 7485),
(9, 'Horatio', 'Walters', 14, 'WS19BB', 2332),
(10, 'Paul', 'Cook', '1', 'NW15DP', 8786),
(11, 'Steve', 'Jones', '1', 'NW15DP', 9987),
(12, 'Glen', 'Matlock', '1', 'NW15DP', 2865),
(13, 'John', 'Lydon', '1', 'NW15DP', 2227),
(14, 'Marc', 'Feld', '40', 'N165WE', 7803),
(15, 'Reginald', 'Dwight', '70', 'OX25PL', 5591)
);

insert into sale (
values (1, 0, 1, to_date('2015-03-10', 'YYYY-MM-DD')),
(2, 2, 0, to_date('2015-10-03', 'YYYY-MM-DD')),
(5, 1, 8, to_date('2015-09-09', 'YYYY-MM-DD')),
(7, 7, 1, to_date('2015-07-20', 'YYYY-MM-DD')),
(9, 8, 6, to_date('2015-03-06', 'YYYY-MM-DD')),
(11, 9, 0, to_date('2015-04-04', 'YYYY-MM-DD')),
(12, 11, 5, to_date('2015-09-12', 'YYYY-MM-DD')),
(16, 14, 5, to_date('2015-01-19', 'YYYY-MM-DD')),
(17, 12, 2, to_date('2015-04-22', 'YYYY-MM-DD')),
(18, 0, 0, to_date('2016-11-02', 'YYYY-MM-DD')),
(19, 3, 4, to_date('2016-08-17', 'YYYY-MM-DD')),
(20, 5, 5, to_date('2016-10-01', 'YYYY-MM-DD')),
(21, 1, 12, to_date('2016-12-23', 'YYYY-MM-DD')),
(22, 7, 2, to_date('2016-07-23', 'YYYY-MM-DD')),
(23, 0, 5, to_date('2016-02-27', 'YYYY-MM-DD')),
(24, 3, 12, to_date('2016-11-11', 'YYYY-MM-DD')),
(25, 4, 10, to_date('2016-12-07', 'YYYY-MM-DD')),
(26, 8, 9, to_date('2016-12-19', 'YYYY-MM-DD')),
(27, 14, 14, to_date('2016-06-22', 'YYYY-MM-DD')),
(28, 11, 18, to_date('2016-04-01', 'YYYY-MM-DD')),
(29, 8, 8, to_date('2016-09-22', 'YYYY-MM-DD')),
(30, 11, 0, to_date('2016-09-22', 'YYYY-MM-DD'))
);


insert into review (
values (1, 2, 3, 'Not as good as the last one'),
(2, 4, 2, 'terrible'),
(8, 9, 4, 'a classic'),
(2, 2, 3, NULL),
(0, 0, 5, 'the best album EVER!'),
(8, 8, 1, 'don''t hear much about them now'),
(7, 2, 1, 'can u tell me when my other album will arrive pls???'),
(2, 8, 4, NULL),
(5, 9, 5, NULL),
(22, 12, 5, 'greatest rock album ever.'),
(15, 14, 2, 'ok'),
(0, 14, 4, 'great album'),
(8, 6, 4, NULL)
);


insert into label (
values ('RCA', 'New York', 'USA'),
('Apple', 'London', 'UK'),
('Island', 'London', 'UK'),
('Parlophone', 'London', 'UK'),
('Vertigo', 'London', 'UK'),
('Universal', 'Santa Monica', 'USA'),
('Fiction', 'London', 'UK'),
('Elektra', 'New York', 'USA'),
('Geffen', 'Santa Monica', 'USA'),
('Klink Klang', 'Dusseldorf', 'Germany'),
('Sub Pop', 'Seattle', 'USA'),
('EMI', 'London', 'UK'),
('Sony', 'New York', 'USA'),
('Verve', 'Santa Monica', 'USA'),
('Silvertone', 'London', 'UK'),
('Silvertone', 'Illinois', 'USA'),
('Rolling Stones Records', 'London','UK'),
('Def Jam', 'New York', 'USA'),
('Atlantic', 'Los Angeles', 'USA'),
('Def American', 'Los Angeles', 'USA')
);


insert into composer(
values(0, 'John Lennon'),
(1, 'Paul McCartney'),
(2, 'David Bowie'),
(3, 'Iggy Pop')
);

insert into credit (
values
(0, 2, 50),
(0,5, 50), 
(0, 14, 50),
(1, 2, 50),
(1,5, 50), 
(1, 14, 50),
(2, 3, 50),
(3, 3, 50),
(0, 23, 100)
);

insert into favourite(
values(0, 'David Bowie'),
(12, 'Iggy Pop'),
(8, 'Damian Marley')
);
