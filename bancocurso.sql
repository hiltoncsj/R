-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Ago-2020 às 01:44
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancocurso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfilme`
--

CREATE TABLE `tbfilme` (
  `idFilme` int(11) NOT NULL,
  `nome` varchar(500) CHARACTER SET utf8 NOT NULL,
  `ano` int(11) NOT NULL,
  `avaliacao` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descricao` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `diretor` varchar(500) CHARACTER SET utf8 NOT NULL,
  `escritor` varchar(500) CHARACTER SET utf8 NOT NULL,
  `estrelas` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbfilme`
--

INSERT INTO `tbfilme` (`idFilme`, `nome`, `ano`, `avaliacao`, `descricao`, `diretor`, `escritor`, `estrelas`) VALUES
(50, 'Um Sonho de Liberdade (1994)', 1994, '9,3', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'Frank Darabont', 'Stephen King (short story \"Rita Hayworth and Shawshank Redemption\"), Frank Darabont (screenplay)', 'Tim Robbins, Morgan Freeman, Bob Gunton | See full cast & crew »'),
(51, 'O Poderoso Chefão (1972)', 1972, '9,2', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'Francis Ford Coppola', 'Mario Puzo (screenplay by), Francis Ford Coppola (screenplay by) | 1 more credit »', 'Marlon Brando, Al Pacino, James Caan | See full cast & crew »'),
(52, 'O Poderoso Chefão II (1974)', 1974, '9,0', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 'Francis Ford Coppola', 'Francis Ford Coppola (screenplay by), Mario Puzo (screenplay by) | 1 more credit »', 'Al Pacino, Robert De Niro, Robert Duvall | See full cast & crew »'),
(53, 'Batman: O Cavaleiro das Trevas (2008)', 2008, '9,0', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'Christopher Nolan', 'Jonathan Nolan (screenplay), Christopher Nolan (screenplay) | 3 more credits »', 'Christian Bale, Heath Ledger, Aaron Eckhart | See full cast & crew »'),
(54, '12 Homens e uma Sentença (1957)', 1957, '8,9', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 'Sidney Lumet', 'Reginald Rose (story), Reginald Rose (screenplay)', 'Henry Fonda, Lee J. Cobb, Martin Balsam | See full cast & crew »'),
(55, 'A Lista de Schindler (1993)', 1993, '8,9', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 'Steven Spielberg', 'Thomas Keneally (book), Steven Zaillian (screenplay)', 'Liam Neeson, Ralph Fiennes, Ben Kingsley | See full cast & crew »'),
(56, 'Pulp Fiction: Tempo de Violência (1994)', 1994, '8,9', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'Quentin Tarantino', 'Quentin Tarantino (stories), Roger Avary (stories) | 1 more credit »', 'John Travolta, Uma Thurman, Samuel L. Jackson | See full cast & crew »'),
(57, 'Três Homens em Conflito (1966)', 1966, '8,8', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 'Sergio Leone', 'Luciano Vincenzoni (story), Sergio Leone (story) | 4 more credits »', 'Clint Eastwood, Eli Wallach, Lee Van Cleef | See full cast & crew »'),
(58, 'O Senhor dos Anéis: A Sociedade do Anel (2001)', 2001, '8,8', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 'Peter Jackson', 'J.R.R. Tolkien (novel), Fran Walsh (screenplay) | 2 more credits »', 'Elijah Wood, Ian McKellen, Orlando Bloom | See full cast & crew »'),
(59, 'Clube da Luta (1999)', 1999, '8,8', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.', 'David Fincher', 'Chuck Palahniuk (novel), Jim Uhls (screenplay)', 'Brad Pitt, Edward Norton, Meat Loaf | See full cast & crew »'),
(60, 'Forrest Gump: O Contador de Histórias (1994)', 1994, '8,8', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 'Robert Zemeckis', 'Winston Groom (novel), Eric Roth (screenplay)', 'Tom Hanks, Robin Wright, Gary Sinise | See full cast & crew »'),
(61, 'A Origem (2010)', 2010, '8,8', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 'Christopher Nolan', 'hristopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page | See full cast & crew »'),
(62, 'Star Wars, Episódio V: O Império Contra-Ataca (1980)', 1980, '8,7', 'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued by Darth Vader and a bounty hunter named Boba Fett all over the galaxy.', 'Irvin Kershner', 'Leigh Brackett (screenplay by), Lawrence Kasdan (screenplay by) | 1 more credit »', 'Mark Hamill, Harrison Ford, Carrie Fisher | See full cast & crew »'),
(63, 'Matrix (1999)', 1999, '8,7', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', ' Lana Wachowski (as The Wachowski Brothers), Lilly Wachowski (as The Wachowski Brothers)', 'Lilly Wachowski (as The Wachowski Brothers), Lana Wachowski (as The Wachowski Brothers)', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss | See full cast & crew »'),
(64, 'Os Bons Companheiros (1990)', 1990, '8,7', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 'Martin Scorsese', 'Nicholas Pileggi (book), Nicholas Pileggi (screenplay) | 1 more credit »', 'Robert De Niro, Ray Liotta, Joe Pesci | See full cast & crew »'),
(65, 'Um Estranho no Ninho (1975)', 1975, '8,7', 'A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.', 'Milos Forman', 'Lawrence Hauben (screenplay), Bo Goldman (screenplay) | 2 more credits »', 'Jack Nicholson, Louise Fletcher, Will Sampson | See full cast & crew »'),
(66, 'Os Sete Samurais (1954)', 1954, '8,6', 'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.', 'Akira Kurosawa', 'Akira Kurosawa (screenplay), Shinobu Hashimoto (screenplay) | 1 more credit »', 'Toshirô Mifune, Takashi Shimura, Keiko Tsushima | See full cast & crew »'),
(67, 'Seven: Os Sete Crimes Capitais (1995)', 1995, '8,6', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', 'David Fincher', 'ndrew Kevin Walker', 'Morgan Freeman, Brad Pitt, Kevin Spacey | See full cast & crew »'),
(68, 'A Vida é Bela (1997)', 1997, '8,6', 'When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.', 'Roberto Benigni', 'Vincenzo Cerami (story and screenplay by), Roberto Benigni (story and screenplay by)', 'Roberto Benigni, Nicoletta Braschi, Giorgio Cantarini | See full cast & crew »'),
(69, 'O Silêncio dos Inocentes (1991)', 1991, '8,6', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 'Jonathan Demme', 'Thomas Harris (novel), Ted Tally (screenplay)', 'Jodie Foster, Anthony Hopkins, Lawrence A. Bonney | See full cast & crew »'),
(70, 'A Felicidade Não se Compra (1946)', 1946, '8,6', 'An angel is sent from Heaven to help a desperately frustrated businessman by showing him what life would have been like if he had never existed.', 'Frank Capra', 'Frances Goodrich (screenplay), Albert Hackett (screenplay) | 3 more credits »', 'James Stewart, Donna Reed, Lionel Barrymore | See full cast & crew »'),
(71, 'O Resgate do Soldado Ryan (1998)', 1998, '8,6', 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.', 'Steven Spielberg', 'obert Rodat', 'Tom Hanks, Matt Damon, Tom Sizemore | See full cast & crew »'),
(72, 'À Espera de um Milagre (1999)', 1999, '8,6', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 'Frank Darabont', 'Stephen King (novel), Frank Darabont (screenplay)', 'Tom Hanks, Michael Clarke Duncan, David Morse | See full cast & crew »'),
(73, 'Parasita (2019)', 2019, '8,6', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', 'Bong Joon Ho', 'Bong Joon Ho (story), Bong Joon Ho (screenplay) | 1 more credit »', 'Kang-ho Song, Sun-kyun Lee, Yeo-jeong Jo | See full cast & crew »'),
(74, 'Os Suspeitos (1995)', 1995, '8,5', 'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.', 'Bryan Singer', 'hristopher McQuarrie', 'Kevin Spacey, Gabriel Byrne, Chazz Palminteri | See full cast & crew »'),
(75, 'O Rei Leão (1994)', 1994, '8,5', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', ' Roger Allers, Rob Minkoff', 'Irene Mecchi (screenplay by), Jonathan Roberts (screenplay by) | 27 more credits »', 'Matthew Broderick, Jeremy Irons, James Earl Jones | See full cast & crew »'),
(76, 'De Volta para o Futuro (1985)', 1985, '8,5', 'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.', 'Robert Zemeckis', 'Robert Zemeckis, Bob Gale', 'Michael J. Fox, Christopher Lloyd, Lea Thompson | See full cast & crew »'),
(77, 'O Pianista (2002)', 2002, '8,5', 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', 'Roman Polanski', 'Ronald Harwood (screenplay by), Wladyslaw Szpilman (based on the book by)', 'Adrien Brody, Thomas Kretschmann, Frank Finlay | See full cast & crew »'),
(78, 'O Exterminador do Futuro 2: O Julgamento Final (1991)', 1991, '8,5', 'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her teenage son, John Connor, from a more advanced and powerful cyborg.', 'James Cameron', 'James Cameron, William Wisher', 'Arnold Schwarzenegger, Linda Hamilton, Edward Furlong | See full cast & crew »'),
(79, 'Tempos Modernos (1936)', 1936, '8,5', 'The Tramp struggles to live in modern industrial society with the help of a young homeless woman.', 'Charles Chaplin (as Charlie Chaplin)', 'harles Chaplin (as Charlie Chaplin)', 'Charles Chaplin, Paulette Goddard, Henry Bergman | See full cast & crew »'),
(80, 'Gladiador (2000)', 2000, '8,5', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 'Ridley Scott', 'David Franzoni (story), David Franzoni (screenplay) | 2 more credits »', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen | See full cast & crew »'),
(81, 'Luzes da Cidade (1931)', 1931, '8,5', 'With the aid of a wealthy erratic tippler, a dewy-eyed tramp who has fallen in love with a sightless flower girl accumulates money to be able to help her medically.', 'Charles Chaplin', 'harles Chaplin', 'Charles Chaplin, Virginia Cherrill, Florence Lee | See full cast & crew »'),
(82, 'Os Infiltrados (2006)', 2006, '8,5', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', 'Martin Scorsese', 'William Monahan (screenplay), Alan Mak | 1 more credit »', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson | See full cast & crew »'),
(83, 'Intocáveis (2011)', 2011, '8,5', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.', ' Olivier Nakache, Éric Toledano', 'Olivier Nakache, Philippe Pozzo di Borgo (adapted from his autobiographical tale Le Second Souffle) | 1 more credit »', 'François Cluzet, Omar Sy, Anne Le Ny | See full cast & crew »'),
(84, 'O Grande Truque (2006)', 2006, '8,5', 'After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.', 'Christopher Nolan', 'Jonathan Nolan (screenplay), Christopher Nolan (screenplay) | 1 more credit »', 'Christian Bale, Hugh Jackman, Scarlett Johansson | See full cast & crew »'),
(85, 'Túmulo dos Vagalumes (1988)', 1988, '8,5', 'A young boy and his little sister struggle to survive in Japan during World War II.', 'Isao Takahata', 'Akiyuki Nosaka (novel), Isao Takahata', 'Tsutomu Tatsumi, Ayano Shiraishi, Akemi Yamaguchi | See full cast & crew »'),
(86, 'Era uma Vez no Oeste (1968)', 1968, '8,5', 'A mysterious stranger with a harmonica joins forces with a notorious desperado to protect a beautiful widow from a ruthless assassin working for the railroad.', 'Sergio Leone', 'Sergio Donati (screenplay by), Sergio Leone (screenplay by) | 3 more credits »', 'Henry Fonda, Charles Bronson, Claudia Cardinale | See full cast & crew »'),
(87, 'Casablanca (1942)', 1942, '8,5', 'A cynical American expatriate struggles to decide whether or not he should help his former lover and her fugitive husband escape French Morocco.', 'Michael Curtiz', 'Julius J. Epstein (screenplay), Philip G. Epstein (screenplay) | 3 more credits »', 'Humphrey Bogart, Ingrid Bergman, Paul Henreid | See full cast & crew »'),
(88, 'Janela Indiscreta (1954)', 1954, '8,4', 'A wheelchair-bound photographer spies on his neighbors from his apartment window and becomes convinced one of them has committed murder.', 'Alfred Hitchcock', 'John Michael Hayes (screenplay), Cornell Woolrich (based on the short story by)', 'James Stewart, Grace Kelly, Wendell Corey | See full cast & crew »'),
(89, 'Apocalypse Now (1979)', 1979, '8,4', 'A U.S. Army officer serving in Vietnam is tasked with assassinating a renegade Special Forces Colonel who sees himself as a god.', 'Francis Ford Coppola (as Francis Coppola)', 'John Milius, Francis Ford Coppola (as Francis Coppola) | 1 more credit »', 'Martin Sheen, Marlon Brando, Robert Duvall | See full cast & crew »');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  ADD PRIMARY KEY (`idFilme`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbfilme`
--
ALTER TABLE `tbfilme`
  MODIFY `idFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
