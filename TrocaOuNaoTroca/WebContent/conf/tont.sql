-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Gera��o: Nov 21, 2010 as 11:50 AM
-- Vers�o do Servidor: 5.0.51
-- Vers�o do PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `tont`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_area`
--

CREATE TABLE IF NOT EXISTS `tb_area` (
  `id_area` int(11) NOT NULL,
  `descricao` varchar(64) NOT NULL,
  PRIMARY KEY  (`id_area`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_area`
--

INSERT INTO `tb_area` (`id_area`, `descricao`) VALUES
(1, 'Humanas'),
(2, 'Exatas'),
(3, 'Biol?gicas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoria`
--

CREATE TABLE IF NOT EXISTS `tb_categoria` (
  `id_categoria` int(11) NOT NULL,
  `descricao` varchar(32) NOT NULL,
  PRIMARY KEY  (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`id_categoria`, `descricao`) VALUES
(1, 'Livro'),
(2, 'CD'),
(3, 'DVD'),
(4, 'Apostila'),
(5, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_item`
--

CREATE TABLE IF NOT EXISTS `tb_item` (
  `id_item` int(11) NOT NULL auto_increment,
  `data_cadastro` date NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `imagem` varchar(256) default NULL,
  `descricao` text NOT NULL,
  `fk_categoria` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `autor` varchar(80) default NULL,
  `editora` varchar(64) default NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_troca` int(11) default NULL,
  `edicao` varchar(10) default NULL,
  `genero` varchar(64) default NULL,
  PRIMARY KEY  (`id_item`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Extraindo dados da tabela `tb_item`
--

INSERT INTO `tb_item` (`id_item`, `data_cadastro`, `titulo`, `imagem`, `descricao`, `fk_categoria`, `status`, `autor`, `editora`, `fk_usuario`, `fk_troca`, `edicao`, `genero`) VALUES
(1, '2010-09-24', 'Deixados para tr', 'http://files.tyndale.com/thpdata/images--covers/119_w/978-0-8423-2911-8.gif', 'Em um instante catacl?smico, milh?es de pessoas de todas as partes do mundo desapareceram. Simplesmente sumiram, deixando para tr?s tudo o que era material: roupas, ?culos, lentes de contato, cabelos posti?os, aparelhos de surdez, pr?teses, j?ias, sapatos e at? mesmo marca passos e pinos cir?rgicos. Milh?es de pessoas sumiram. Mas outros milh?es ficaram - alguns adultos, por?m n?o crian?as, e apenas alguns adolescentes. Todos os beb?s, inclusive os que estavam para nascer, desapareceram ? alguns durante o parto. Instalou-se o caos no mundo inteiro. Avi?es, trens, ?nibus e carros colidiram, navios afundaram, casas incendiaram, sobreviventes acometidos de ang?stia suicidaram-se. Um congestionamento de transportes e linhas de comunica??o, somado ao desaparecimento de in?meros funcion?rios, deixou a maioria das pessoas lutando sozinhas para sobreviverem at? que a situa??o come?asse a se normalizar.', 1, 0, 'Tim Lahaye', NULL, 1, 923, '1?', NULL),
(2, '2010-09-07', 'O Fim do Jogo', 'http://livrosgratis.net/upload/capas/fim_do_jogo.jpg', 'Frank Peretti e Tedd Dekker - dois dos mais aclamados escritores de thrillers sobrenaturais - uniram-se para escrever FIM DE JOGO. Numa casa assustadora, sete jogadores participam de um jogo mortal. H? apenas 3 regras que n?o fazem sentido algum, exceto para um serial killer. Ao longo do jogo, percebe-se que a ?nica forma de vencer ? perder e a ?nica forma de sair ? entrar...', 1, 1, 'Frank Peretti', NULL, 1, NULL, '1?', NULL),
(3, '2010-09-30', 'Emanuel', 'http://baugospel.com.br/wp-content/uploads/2010/09/nivea-soares-emanuel.jpg', 'O novo CD da Cantora N?vea Soares ? demais. S?o treze can??es totalmente in?ditas de um trabalho que j? esta nas lojas de todo o Brasil. O t?o esperado CD Emanuel de N?vea Soares foi gravado por Gustavo Soares, no est?dio e-music, em Belo Horizonte.', 2, 1, 'N?vea Soares', NULL, 2, NULL, NULL, NULL),
(4, '2010-10-14', 'Inimigos da HP - ao vivo', 'http://www.concamusic.com.br/images/CD%20INIMIGOS%20DA%20HP%20-%20E%20QUEM%20NAO%20GOSTA%20DO%20INIMIGOS.jpg', '1. A Musa da Praia\r\n2. Brilho de Cristal\r\n3. Escondida\r\n4. Bons Momentos\r\n5. Que Situa??o\r\n6. Ca?a e Ca?ador\r\n7. Quer Dizer\r\n8. Morena da Praia\r\n9. Louca Vontade\r\n10. ? Saudade\r\n11. Uma Noite e Meia\r\n12. Com Amor ', 2, 1, 'Inimigos da HP', NULL, 2, NULL, NULL, NULL),
(5, '2010-10-27', 'Bastardos Ingl?rios', 'http://2.bp.blogspot.com/_CWq0wF54ukU/SwREe7U4cEI/AAAAAAAAD1E/ReQ4-ix-LnM/s1600/Bastardos+Ingl%C3%B3rios+-+DVDRip+-+RMVB+-+Legendado', 'Durante a Segunda Guerra Mundial, grupo de soldados americanos judeus ? conhecido como "The Basterds" (os bastardos). S?o eles os respons?veis por espalhar o medo e o terror no Terceiro Reich, escalpelar e assassinar brutalmente os nazistas. ? nesse ambiente que eles cruzam o caminho de uma jovem judia que tem um cinema em Paris e ? alvo dos soldados.', 3, 1, NULL, NULL, 1, 920, NULL, NULL),
(6, '2010-10-03', 'Aqueles c?es malditos de Arquelau', 'http://200.215.177.68/imagem/capas1/939/66939.jpg', 'Neste aclamado romance de estr?ia de Isaias Pessotti, um grupo de pesquisadores descobre na It?lia dos anos 60 um texto sobre Eur?pedes escrito pelo misterioso Bispo Vermelho, um homem, como eles, apaixonado pela arte e pelos livros. ', 1, 0, NULL, NULL, 1, 927, NULL, NULL),
(7, '2010-10-03', 'Depois da Guerra', 'http://2.bp.blogspot.com/_tRyYzw3AhCo/SfZ2_7jSOHI/AAAAAAAAAAc/sCGA1xrStoU/s400/Oficina-G3-CD-Depois-da-Guerra.jpg', '?ltimo cd do Oficina G3', 2, 0, NULL, NULL, 1, 0, NULL, NULL),
(8, '2010-10-24', 'Cidade dos Ossos', 'http://garotait.com.br/wp-content/uploads/2010/10/PROMOCAOCidade.png', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 0, NULL, NULL, 2, 927, NULL, NULL),
(10, '2010-11-02', 'Todo garoto Tem', 'http://imagens.travessa.com.br/livro/DT/9d/9d31521d-0365-4ad5-8d1e-b83479eca82c.jpg', 'Essa era uma viagem que tinha tudo para dar certo: Holly e Mark decidem fugir para se casar numa villa do interior da It?lia, tentando evitar o stress causado pela diferen?a de religi?o entre suas fam?lias. Para acompanh?-los como madrinha, dama de honra e melhor amiga da noiva, a cartunista Jane Harris, uma mulher divertida e engra?ada que mal pode esperar pela sua primeira viagem ao exterior. Mas ? claro que Mark tamb?m convidou o seu melhor amigo, o jornalista internacional Cal Langdon. J? no aeroporto, Jane e Cal sofrem de total ?dio ? primeira vista. Mas o que ningu?m esperava era que somente esses dois pudessem salvar o casamento de seus melhores amigos. E, nessa inesperada uni?o entre opostos, Cal e Jane acabam por descobrir que, mesmo que n?o pare?a, existe algo que todo garoto tem.', 1, 1, NULL, NULL, 2, NULL, NULL, NULL),
(11, '2010-11-21', 'Donnie Darko', 'http://ecx.images-amazon.com/images/I/51VJ0GWFN8L.jpg', 'Quem v� Donnie Darko logo imagina se tratar de um adolescente desajustado. Na verdade, Donnie esta � beira da loucura, devida as vis�es constantes de um coelho monstruoso, que tenta mant�-lo sob a sua sinistra influ�ncia. Incitado pela apari��o, Donnie tem atua��o anti-social, enquanto se submete � terapia, sobrevive das extravag�ncias da vida e do romance no col�gio e, por acaso, escapa a uma estranha morte devido � queda de um avi�o. Donnie luta contra os seus dem�nios, literal e figurativamente, numa intriga de hist�rias entrela�adas que jogam com as viagens no tempo, gurus fundamentalistas, predestina��o e os des�gnios do universo. ', 3, 0, NULL, NULL, 5, NULL, NULL, 'Suspense'),
(12, '2010-11-21', 'Harry Potter ea Pedra Filosofal', 'http://lusalivros.files.wordpress.com/2009/12/311839_1.jpg', 'Em Harry Potter e a Pedra Filosofal, o leitor � apresentado a Harry, filho de Tiago e L�lian Potter, feiticeiros que foram assassinados por um poderos�ssimo bruxo, quando ele ainda era um beb�. Com isso, o menino acaba sendo levado para a casa dos tios que nada tinham a ver com o sobrenatural ? pelo contr�rio. At� os 10 anos, Harry foi uma esp�cie de gata borralheira: maltratado pelos tios, herdava roupas velhas do primo gorducho, tinha �culos remendados e era tratado como um estorvo. No dia de seu anivers�rio de 11 anos, entretanto, ele parece deslizar por um buraco sem fundo, como o de Alice no pa�s das maravilhas, que o conduz a um mundo m�gico. Descobre sua verdadeira hist�ria e seu destino: ser um aprendiz de feiticeiro at� o dia em que ter� que enfrentar a pior for�a do mal, o homem que assassinou seus pais, o terr�vel Lorde das Trevas.', 1, 0, 'J.K.Rowling', 'Rocco', 5, NULL, NULL, NULL),
(13, '2010-11-21', 'Calculo II', 'http://img.americanas.com.br/produtos/01/02/item/5658/9/5658979g1.jpg', 'Este livro da continuidade aoa volume 1, trazendo tamb�m exemplos e exercicios com dados da vida real que esclarerem e demosntram, de forma pr�tica, conceitos, teoremas e regras do c�lculo. As t�cnicas pedag�gicas e os recursos utilizados obedecem ao mesmo crit�rio adotado no volume 1.', 1, 0, 'Bruce H. Edwards', 'McGraw Hill ', 5, NULL, '8', NULL),
(14, '2010-11-21', 'Desenho T�cnico Moderno', 'http://i.s8.com.br/images/books/cover/img5/1706485.jpg', 'Uma obra em portugu�s (de Portugal) que aborda um conjunto de metodologias e procedimentos necess�rios ao desenvolvimento e comunica��o de projetos, conceitos e id�ias referentes � representa��o gr�fica. Trata o Desenho T�cnico cl�ssico em conformidade com as normas internacionais em vigor, integrando as metodologias baseadas no Desenho Assistido por Computador e modelagem 3D, de forma t�o adequada quanto o sucesso das suas primeiras edi��es tem refletido. Explora os conceitos b�sicos come�ando pelo esbo�o a m�o livre, at� a utiliza��o de recursos de inform�tica (CAD) al�m de apresentar detalhadamente os conceitos associados ao Desenho T�cnico, das regras e procedimentos de sua utiliza��o em geral, e tamb�m das particularidades espec�ficas nos diversos dom�nios de aplica��o, conjugando a representa��o tradicional e as t�cnicas de modelagem geom�trica, em 2D e em 3D, no �mbito da utiliza��o de sistemas CAD (Computer-Aided-Design).\r\nNa presente edi��o, o livro foi extensamente revisto na sua parte inicial e aumentado para incluir as especificidades de conte�dos de ensino e projeto de Engenharia Civil e Arquitetura. No final de cada cap�tulo, encontram-se ainda exerc�cios de grande utilidade para docentes. Destinado aos atuais e futuros profissionais de Engenharia, como manual de forma��o ou atualiza��o em Desenho T�cnico, serve como elemento de consulta sobre v�rios assuntos ligados a Projeto (normas, materiais, elementos normalizados, toler�ncias), tornando-se, deste modo, especialmente indicado para as �reas de Engenharia Civil e Arquitetura e de Engenharia Mec�nica, Industrial, Naval, Aeron�utica e Aeroespacial.', 1, 0, 'ARLINDO SILVA & CARLOS TAVARES RIBEIRO & JOAO DIAS', 'LTC', 5, NULL, '4', NULL),
(15, '2010-11-21', 'Greatest Hits', 'http://i.s8.com.br/images/cds/cover/img8/1019478.jpg', 'Esta � a colet�nea fant�stica do The Offspring, uma das maiores bandas de punk rock da atualidade, com sete �lbuns gravados e mais de 32 milh�es de c�pias vendidas, que conta com Dexter Holland nos vocais e guitarra, Noodles na guitarra, Greg K no baixo e Atom Willard na bateria. S�o 15 faixas divididas entre in�ditas e cl�ssicos que pontuaram no Top 10 da Billboard, como "Come Out and Play (Keep �Em Separated)", "Self Esteem", "Gotta Get Away" e "Pretty Fly (For a White Guy)". \r\n\r\nDisco\r\nCan�t Repeat  \r\nCome Out And Play  \r\nSelf Esteem  \r\nGotta Get Away  \r\nAll I Want  \r\nGone Away  \r\nPretty Fly (For a White Guy)  \r\nWhy Don�t You Get a Job?  \r\nThe Kids Aren�t Alright  \r\nOriginal Prankster  \r\nWant You Bad  \r\nDefy You  \r\nHit That  \r\n(Can�t Get My) Head Around You  \r\nThe Kids Aren�t Alright (Full Mix)  ', 2, 0, 'The Offspring', NULL, 5, NULL, NULL, 'Rock'),
(16, '2010-11-21', 'C�digo Civil', 'http://i.s8.com.br/images/books/cover/img5/21784135.jpg', 'Esta obra contempla a �ntegra da Constitui��o Federal e do ADCT, o C�digo Civil, Legisla��o Complementar selecionada contendo diplomas legais necess�rios ao estudo da mat�ria, al�m de S�mulas Vinculantes do STF, S�mulas do STF, TFR e STJ. \r\n', 1, 0, 'AUTORES DIVERSOS', 'Rideel', 6, NULL, '16', NULL),
(17, '2010-11-21', 'Codigo Eleitoral', 'http://i.s8.com.br/images/books/cover/img1/21784141.jpg', 'Esta obra contempla a �ntegra da Constitui��o Federal e do ADCT, o C�digo Eleitoral, Legisla��o Complementar selecionada contendo diplomas legais necess�rios ao estudo da mat�ria, al�m de S�mulas Vinculantes do STF, S�mulas do STF, STJ e TSE. ', 1, 0, 'JOSE NEPOMUCENO SILVA', 'Rideel', 6, NULL, '16', NULL),
(18, '2010-11-21', 'Resident Evil 5', 'http://i.s8.com.br/images/games/cover/img5/21617585.jpg', 'Jogo para PC.\r\nA amea�a biol�gica ainda n�o acabou. Quando parecia que a amea�a de Resident Evil havia sido destru�da, chega um novo terror que ir� dar calafrios aos jogadores. Chris Redfield, o her�i j� conhecido de Resident Evil, seguiu o caminho do mal literalmente ao redor globo. Depois de se juntar a uma nova organiza��o, Chris vai at� a �frica, onde a �ltima amea�a em bioterrorismo est� literalmente transformando as pessoas e animais da cidade em criaturas enlouquecidas. Ele se junta a uma nova parceira, Sheva Alomar, que fornece a sua for�a, intelig�ncia e habilidade em atirar para a sua miss�o.\r\nEste � o mais novo t�tulo na s�rie Resident Evil, que chegou a vender mais de 34 milh�es de unidades desde quando o jogo original foi lan�ado em 1996, e deu in�cio a uma trilogia multi-milion�ria de filmes da Sony Pictures. Resident Evil 5 ir� revolucionar a s�rie Resident Evil, assim como Resident Evil 4 revolucionou. ', 5, 0, NULL, NULL, 6, NULL, NULL, 'Survival Horror'),
(19, '2010-11-21', 'Apostila de Direito da CEC Concursos', 'http://www.comprinhas.com.br/34-111-large/apostila-de-direito-administrativo-trabalhista-processual-civil-e-do-trabalho-trt.jpg', 'Este excelente material possui mais de 400 p�ginas de muita informa��o sobre algumas �reas do Direito (Administrativo, do Trabalho, Processual do Trabalho e Processual Civil). Cont�m tamb�m diversos testes com gabaritos.', 4, 0, NULL, NULL, 6, NULL, NULL, NULL),
(20, '2010-11-21', 'All the Right Reasons', 'http://i.s8.com.br/images/cds/cover/img9/1058149.jpg', 'Faixas:\r\nFollow You Home  \r\nFight for All the Wrong Reasons  \r\nPhotograph  \r\nAnimals  \r\nSavin� Me  \r\nFar Away  \r\nNext Contestant  \r\nSide of a Bullet  \r\nIf Everyone Cared  \r\nSomeone That You�re With  \r\nRockstar \r\n', 2, 0, 'Nickelback', NULL, 6, NULL, NULL, 'Rock'),
(21, '2010-11-21', 'Elements Pt.2', 'http://i.s8.com.br/images/cds/cover/img2/21314762.jpg', 'Elements Pt.2 � mais um �lbum excepcional do Stratovarius, que n�o pode faltar na cole��o dos verdadeiros f�s da banda. S�o nove faixas, incluindo "Season of Faith�s Perfection", "Awaken the Giant", "Know the Difference", "Luminous", "Dreamweaver", alguns dos destaques. \r\n\r\nDisco:\r\nAlpha & Omega  \r\nI Walk to My Own Song  \r\nI�m Still Alive  \r\nSeason of Faith�s Perfection  \r\nAwaken the Giant  \r\nKnow the Difference  \r\nLuminous  \r\nDreamweaver  \r\nLiberty  \r\n', 2, 0, 'Stratovarius', NULL, 7, NULL, NULL, 'Heavy Metal'),
(22, '2010-11-21', 'O Grande Livro do Jornalismo', 'http://i.s8.com.br/images/books/cover/img6/21363516.jpg', 'O grande livro do jornalismo, editado por Jon E. Lewis, re�ne 55 dos mais emblem�ticos textos jornal�sticos de todos os tempos. De ?Um homem � guilhotinado em Roma?, escrito por Charles Dickens em 1845, a ?O rel�gio marcava 7h55 ? precisamente o momento em que o m�ssil explodiu?, de Robert Fisk, sobre a eclos�o da Guerra do Iraque, em 2003, re�ne a elite do jornalismo e exibe uma li��o de seriedade, compet�ncia e talento. O volume traz ainda reportagens assinadas por Mark Twain, Jack London, John Reed, Dorothy Parker, Elliott V. Bell, John Dos Passos, John Steinbeck, George Orwell, Relman Morin, Merriman Smith, Norman Mailer, Hunter S. Thompson, Gore Vidal e Jon Krakauer, entre outros. As reportagens compiladas por Jon E. Lewis abrangem uma variad�ssima gama de assuntos, da queda da bolsa de Nova York ao casamento de Grace Kelly, passando pelo estouro dos Beatles, o assassinato de John Kennedy e a insurrei��o do Talib� no Afeganist�o, mas est�o unidas pela qualidade de seus textos. Nesse sentido, O grande livro do jornalismo funciona como um verdadeiro manual de reda��o e estilo. ', 1, 0, 'JON E. LEWIS', 'Jos� Olympio', 7, NULL, '1', NULL),
(23, '2010-11-21', 'Sociedade do Telejornalismo', 'http://i.s8.com.br/images/books/cover/img4/21323434.jpg', 'O desafio a que os autores se propuseram ao produzirem os cap�tulos desse livro foi o de aproximar a teoria da pr�tica. � indiscut�vel a influ�ncia da TV na constru��o do imagin�rio das pessoas. Pode ter certeza, caro leitor, que a TV n�o entra apenas na sua casa, ela entra na sua vida. O prop�sito em comum dos artigos aqui reunidos foi o de contribuir para os estudos e a pesquisa do telejornalismo, propondo a reflex�o cr�tica sobre o alcance e a influ�ncia do telejornalismo na vida de todos. ', 1, 0, 'ALFREDO VIZEU & AUTORES DIVERSOS ', 'Vozes ', 7, NULL, '1', NULL),
(24, '2010-11-21', 'Dexter: A M�o Esquerda de Deus', 'http://i.s8.com.br/images/books/cover/img4/21392874.jpg', 'Dexter Morgan � um educado lobo vestido em pele de ovelha. Dexter � um serial killer. Na verdade, � um assassino incomum que extermina apenas aqueles que merecem. Ao mesmo tempo, trabalha como perito da pol�cia de Miami... Em Dexter, a M�o Esquerda de Deus, o livro que deu origem � aclamada s�rie de TV, o ador�vel matador depara-se com um concorrente de estilo semelhante ao seu, encanta-se e incomoda-se com ele, prev� seus passos... A escrita requintada de Jeff Lindsay nos faz mergulhar na mente de um dos personagens mais amb�guos da hist�ria da literatura de suspense. Nunca o macabro foi tratado com tanto refinamento e leveza. Dexter Morgan � uma obra-prima. ', 1, 0, 'Jeff Lindsay', 'Planeta do Brasil', 7, NULL, NULL, NULL),
(25, '2010-11-21', 'Guitar Hero: Smash Hits', 'http://i.s8.com.br/images/games/cover/img3/21556153.jpg', 'Game para XBOX360.\r\nGuitar Hero: Smash Hits cont�m faixas dos tr�s primeiros Guitar Hero, al�m do game para todos os que possuem interesse em participar de uma banda... Pelo menos nos games.\r\nAo todo, s�o 48 m�sicas de toda a franquia com a possibilidade de experimentar "velhas conhecidas" dos Guitar Hero mais antigos. No que se diz respeito � jogabilidade, pode-se dizer que a estrutura b�sica de Smash Hits vem diretamente do que � encontrado em Metallica e World Tour. \r\nAinda assim, o jogo conta com um sistema de cria��o de personagens (no caso, estrelas de rock), modos Career (single e multiplayer), um modo Battle of the Bands para at� oito jogadores, modos de dificuldade variados (possivelmente de Beginner a Expert) e um est�dio musical. No entanto, oito novos locais de encontro aparecem no jogo, como salas de concerto na Amaz�nia, nas calotas polares. ', 5, 0, NULL, NULL, 7, NULL, NULL, NULL),
(26, '2010-11-21', 'Qu�mica 1 - Ensino M�dio', 'http://i.s8.com.br/images/software/cover/img2/1705232.jpg', 'Este software aborda a Qu�mica do ensino m�dio de forma inovadora, pr�tica e atual. Possui um ambiente estimulante (telas+�udio), com uma navega��o f�cil e intuitiva, o que facilita a compreens�o do assunto. Al�m disso possui muitos testes ao final de cada assunto, para voc� treinar o que j� foi apresentado! E ainda acompanhe os seus resultados, verificando os erros e acertos. \r\n\r\nConfira a lista completa do conte�do abordado no curso:\r\n\r\n01. Mol e Quantidade da Mat�ria. \r\n02. Leis Ponderais. \r\n03. C�lculo de F�rmulas. \r\n04. C�lculo Estequiom�trico. \r\n05. Solu��es. \r\n06. Termoqu�mica. \r\n07. Regra para NOX. \r\n08. Cin�tica Qu�mica. \r\n09. Equilibrio Qu�mico. ', 5, 0, NULL, NULL, 8, NULL, NULL, NULL),
(27, '2010-11-21', 'Matrix', 'http://i.s8.com.br/images/dvds/cover/img5/74135.jpg', 'Marco na hist�ria do cinema, esta aventura cibern�tica com efeitos especiais fant�sticos narra a luta de um hacker profissional, ao lado de um grupo de revolucion�rios, contra o programa de intelig�ncia artificial que controla a realidade vivida pelos seres humanos. Imperd�vel! \r\nInforma��es especiais: Menu Interativo - Filmografia - Document�rio dos Bastidores Matrix - A Filmagem - Escolha de Cena ', 3, 0, NULL, NULL, 8, NULL, NULL, 'SciFi'),
(28, '2010-11-21', 'Serenity: A Luta pelo Amanh� ', 'http://i.s8.com.br/images/dvds/cover/img6/1478426.jpg', 'Uma guerra devastadora dizimou milh�es de pessoas em toda a gal�xia. De um lado, a poderosa Alian�a, detentora das mais modernas tecnologias do Universo. Do outro, os terr�veis Reavers, selvagens canibais que utilizam t�ticas de guerrilha para combater o inimigo. Oficialmente, a guerra acabou com a vit�ria da Alian�a, mas os Reavers n�o desistem jamais, e continuam lutando. � neste cen�rio de lutas e tens�es que a Alian�a desenvolve uma nova "arma de guerra": a garota paranormal River, aparentemente uma adolescente comum, mas dona de poderes ps�quicos incalcul�veis. Por�m, seu irm�o Simon n�o quer v�-la transformada em armamento b�lico, e rapta a menina dos laborat�rios da alian�a. Em sua fuga desesperada, River e Simon agora s� t�m uma esperan�a: pegar uma carona na Serenity, a nave do veterano Capit�o Malcolm Reynolds, um homem que conhece todos os caminhos na luta pela sobreviv�ncia. Por�m, combatendo ao mesmo tempo a Alian�a e os Reavers, o pre�o da liberdade pode ser alto demais. ', 3, 0, NULL, NULL, 8, NULL, NULL, 'SciFi'),
(29, '2010-11-21', 'Apostila Concurso CETESB', 'http://images.quebarato.com.br/T440x/apostila+cetesb+engenheiro+agronomo+civil+quimico+geologo__121A2F_1.jpg', 'APOSTILA CONCURSO CETESB 2008 TODOS AS �REAS: \r\n\r\nA APOSTILA ABORDA: \r\n\r\nCONHECIMENTO GERAL \r\n\r\nCONHECIMENTO ESPECIFICO \r\n\r\nMAIS DE 30 PROVAS DE CONCURSOS ANTERIORES POR �REA \r\n', 4, 0, NULL, NULL, 8, NULL, NULL, NULL),
(30, '2010-11-21', 'Heathen Chemistry', 'http://i.s8.com.br/images/cds/cover/img0/175490.jpg', 'Album do grupo brit�nico, liderado pelo vocalista Noel Gallagher, que � considerado pelo pr�prio Oasis, "de volta �s origens" com um rock puro, cru, que consagrou o grupo ao trono da m�sica brit�nica. Destaque para as faixas "The Hindu Times", um rock psicod�lico que lembra os anos 60, al�m de "She Is Love" e "Little By Little". \r\n\r\nThe Hindu Times ( Album Version)  \r\nForce Of Nature ( Album Version)  \r\nHung In A Bad Place ( Album Version)  \r\nStop Cryng Your Heart Out ( Album Version)  \r\nSongbird ( Album Version)  \r\nLittle By Little ( Album Version)  \r\nA Quick Peep ( Album Version)  \r\nProbably All In The Mind ( Album Version)  \r\nShes Is Love ( Album Version)  \r\nBorn On A Different Cloud ( Album Version )  \r\nBetter Man ( Album Version)(Hidden Track)  \r\n', 2, 0, 'Oasis', NULL, 8, NULL, NULL, 'Rock'),
(31, '2010-11-21', 'Box Jiraiya: O Incr�vel Ninja', 'http://i.s8.com.br/images/dvds/cover/img2/21545902.jpg', 'Box Jiraiya: O Incr�vel Ninja - 5 DVDs\r\nEntre dezenas de seriados japoneses que vieram para o Brasil de carona no sucesso de Jaspion e Changeman, no final dos anos 80 e come�o dos 90, Jiraiya foi o mais popular. E o motivo disso � o mesmo que fez dele um sucesso tamb�m no Jap�o: a tem�tica ninja. Jiraiya adaptou o tradicional universo dos ninjas reais ao ritmo e cores das t�picas s�ries de super-her�is japonesas, com guerreiros de visual extravagante, espadas laser, monstros, magias, etc. Na hist�ria, esses guerreiros, espalhados pelo mundo, v�o para o Jap�o em busca do tesouro espacial Pako, cuja localiza��o � apontada por uma inscri��o fragmentada entre a fam�lia Yamashi e o maligno cl� dos Feiticeiros. Ele herda a armadura e a Espada Ol�mpica de seu pai adotivo, Tetsuzan Yamashi, para proteger a inscri��o e destruir ninjas mal intencionados. Ao longo das batalhas, Jiraiya conta com a ajuda de seus irm�os, Manabu e Kei Yamashi, e de alguns ninjas que deixam suas ambi��es pessoais de lado para lutar pela paz. A aguardada reedi��o da s�rie em DVD � a chance de rever com imagem e som digitais a vibrante trajet�ria do her�i que, diferente da maioria, n�o tinha super poderes e precisava aprimorar o tempo todo sua arte ninja para vencer os inimigos.', 3, 0, NULL, NULL, 9, NULL, NULL, NULL),
(32, '2010-11-21', 'Como Treinar o seu Drag�o', 'http://i.s8.com.br/images/dvds/cover/img4/21870844_4.jpg', 'Um campe�o de p�blico e cr�tica, Como Treinar o seu Drag�o vem soltando fogo, com aventura �pica e muitas risadas, numa encantadora e original hist�ria.\r\nSolu�o � um jovem viking que desafia a tradi��o, quando fica amigo de um dos mais mortais inimigos - um feroz drag�o que ele chama de Banguela. Juntos, os improv�veis her�is tem que lutar contra tudo para o mundo de ambos, neste maravilhoso e divertido sucesso', 3, 0, NULL, NULL, 9, NULL, NULL, NULL),
(33, '2010-11-21', 'A Pedagogia', 'http://i.s8.com.br/images/books/cover/img5/1026505.jpg', 'Sobre a pedagogia, todos t�m alguma coisa a dizer, mesmo que atrav�s da evoca��o de suas lembran�as de estudantes, de sua experi�ncia de pai e m�e, de sua reflex�o de cidad�os. Os elementos propostos aqui visam fazer eco a essas recorda��es, mas, ao mesmo tempo, dar informa��es acerca de alguns pontos t�cnicas mais complexos ou acentuar que o que parece simples merece muitas vezes um olhar reflexivo. ', 1, 0, 'ANNE-MARIE DROUIN', 'Loyola', 9, NULL, '1', NULL),
(34, '2010-11-21', '�gape', 'http://i.s8.com.br/images/books/cover/img3/21862763.jpg', 'O amor divino, segundo o padre Marcelo Rossi\r\n\r\nEm seu livro �gape, com pref�cio de Gabriel Chalita, o sacerdote cat�lico tece suas reflex�es sobre passagens do Evangelho de s�o Jo�o e convida o leitor a enveredar por inspiradas ora��es\r\n\r\nOs dicion�rios definem a palavra "�gape" como a refei��o promovida pelos primitivos crist�os a fim de celebrar o rito eucar�stico. O rito confraternizava ricos e pobres em torno de ideais como amizade, caridade, amor. Em �gape, livro lan�ado pela Editora Globo, Padre Marcelo Rossi retoma e amplia o sentido original do conceito: "�gape � uma palavra de origem grega que significa o amor divino. O amor de Deus pelos seus filhos. E ainda o amor que as pessoas sentem umas pelas outras inspiradas nesse amor divino", assinala no texto de introdu��o do volume. \r\n\r\nCom sua abordagem de comunica��o moderna, original e leve, padre Marcelo leva conforto espiritual e ensinamentos da Igreja Cat�lica para milh�es de brasileiros por meio de programas de r�dio e TV. O estilo claro, direto e sereno que o transformou em fen�meno midi�tico est� impregnado, agora, em �gape, obra liter�ria em que o autor apresenta trechos selecionados do Evangelho de s�o Jo�o e os reinterpreta � luz do significado do amor divino no mundo contempor�neo. \r\n\r\nMais do que se apresentar como estudo teol�gico sobre os escritos narrados pelo ap�stolo, o livro tem expl�cita inten��o oracional. Nesse sentido, trata-se de um di�logo entre o autor, na condi��o de padre, e seus filhos em busca da boa palavra. Cada cap�tulo do volume se encerra com uma ora��o envolvendo os temas ali examinados pelo autor, como a convidar os leitores para um momento de introspec��o e de acolhimento das mensagens de Jesus segundo s�o Jo�o. \r\n\r\nA escolha do Evangelho de s�o Jo�o entre tantas outras possibilidades dentro da B�blia � justificada por Padre Marcelo pela beleza da estrutura liter�ria e pela impressionante delicadeza com que s�o descritos os momentos da vida de Jesus - como se o ap�stolo n�o se contentasse em apenas narrar os fatos, mas quisesse nos trazer para dentro da situa��o descrita. Compartilhar a beleza das narra��es do evangelista com os leitores � outro dos objetivos declarados do autor, que busca, com �gape, incentivar cada vez mais a leitura da Palavra de Deus. ', 1, 0, 'PADRE MARCELO ROSSI ', 'Globo', 9, NULL, '1', 'Religi�o'),
(35, '2010-11-21', 'Multimetro Digital UT-30B c/Tst p/Transistor', 'http://img.grandeeletro.com.br/img/products/multimetro-digital-ut-30b-c-tst-p-transistor_1_180.jpg', 'Caracter�sticas:\r\nCapacit�ncia: 20nF/200nF/2MF/100MF \r\nCorrente AC: 20mA/200mA/20A \r\nCorrente DC: 2mA/20mA/200mA/20A \r\nDisplay: 1999 - 59x25mm - com ilumina��o traseira \r\nResist�ncia: 200R/2kR/20kR/200kR/2MR/20MR/200MR \r\nTemperatura: -40 ~1000�C \r\nTens�o AC: 2V/20V/200V/750V \r\nTens�o DC: 200mV/2V/20V/200V/1000V \r\nImped�ncia entrada em Volt DC: 10MR ', 5, 0, NULL, NULL, 9, NULL, NULL, NULL),
(36, '2010-11-21', 'Biologia', 'http://i.s8.com.br/images/books/cover/img9/21776179.jpg', 'A Editora �tica � uma editora que est� entre as l�deres no setor de livros escolares no Brasil. A empresa, que contabiliza hoje mais de 2.300 t�tulos em cat�logo e cerca de 1.100 autores diferentes, fez hist�ria com obras e cole��es que marcaram �poca e viraram refer�ncia para professores e estudantes no Brasil. ', 1, 0, 'SIDIO MACHADO', 'Scipione', 10, NULL, '1', NULL),
(37, '2010-11-21', 'Biologia M�dica ', 'http://i.s8.com.br/images/books/cover/img9/100509.jpg', 'Uma obra que condensa em um m�nimo de espa�o um m�ximo de informa��es b�sicas, nascidas de um conhecimento profundo e atualizado da mat�ria, abrindo novos caminhos � compreens�o dos enigmas da Biologia e de suas conseq��ncias para a Medicina. ', 1, 0, 'WERNER BUSELMAIER', 'EPU Editora', 10, NULL, NULL, NULL),
(38, '2010-11-21', 'O Hobbit', 'http://i.s8.com.br/images/books/cover/img0/21564670.jpg', 'Prel�dio de O Senhor dos An�is, O Hobbit conquistou sucesso imediato quando foi publicado em 1937. Vendeu milh�es de c�pias em todo o mundo e estabeleceu-se como um cl�ssico moderno e um dos livros mais influentes de nossa gera��o. \r\n\r\nA est�ria narra o longo e perigoso trajeto de um hobbit chamado Bilbo Bolseiro (tio de Frodo, um dos principais protagonista do cl�ssico O Senhor dos An�is). A viagem � repleta de aventuras das quais ele desgota at� a Montanha Solit�ria em busca do tesouro roubado pelo drag�o Smaug anos atr�s. Tudo come�a num dia inesperado em que Bilbo recebe a visita de Gandalf com 13 an�es, entre eles Thorin Escudo-de-Carvalho - cuja fam�lia teve roubado o tesouro. Alguns dos feitos narrados em O Hobbit influir�o nos acontecimentos posteriores de O Senhor dos An�is). ', 1, 0, 'J.R.R. TOLKIEN', 'WMF', 10, NULL, '1', NULL),
(39, '2010-11-21', 'Star Trek XI', 'http://i.s8.com.br/images/dvds/cover/img1/21787341.jpg', 'Star Trek � uma explos�o de puro espet�culo cinematogr�fico e um irresist�vel convite � divers�o. O impetuoso e renegado James Kirk (Chris Pine) e o igualmente jovem, meio vulcaniano, meio humano, Spock (Zachary Quinto), est�o entre os jovens membros de uma tripula��o principiante da esquadra estelar, prestes a lan�ar a mais avan�ada nave espacial j� criada: a U.S.S. Enterprise. Durante a incr�vel viagem gal�ctica para explorar o espa�o, eles conhecer�o o diab�lico Nero (Eric Bana), cuja miss�o de vingan�a amea�a toda a humanidade. Com esta Edi��o Especial com Dois Discos, contendo, al�m do filme de tremendo sucesso, extras especiais totalmente novos, voc� vai viajar pelos bastidores e mergulhar no empolgante universo cheio de a��o de Star Trek, como nunca experimentou antes.\r\n', 3, 0, NULL, NULL, 10, NULL, NULL, 'SciFi'),
(40, '2010-11-21', 'Um Morto Muito Louco', 'http://i.s8.com.br/images/dvds/cover/img0/1792030.jpg', 'Dois jovens funcion�rios de uma corretora de seguros, Larry Wilson (Andrew McCarthy) e Richard Parker (Jonathan Silverman) descobrem uma fraude milion�ria na empresa. Certos de serem recompensados, levam a informa��o at� o chefe Bernie Lomax (Terry Kiser), sem saber que este � o respons�vel por tal irregularidade. Bernie ent�o convida a dupla para passar um fim de semana em sua casa, onde planeja mat�-los, mas � o pr�prio Bernie que acaba morrendo. Decididos a n�o passar o fim-de-semana com aborrecimentos, os dois amigos acabam curtindo o local enquanto tentam fazer com que todos n�o notem que o chefe est� morto. ', 3, 0, NULL, NULL, 10, NULL, NULL, 'Com�dia'),
(41, '2010-11-21', 'Places For Breathing', 'http://images.uulyrics.com/cover/r/revis/album-places-for-breathing.jpg', '1. Caught in the Rain  \r\n2. Your Wall  \r\n3. Spin  \r\n4. Seven  \r\n5. Straight Jacket Labels  \r\n6. Living Rooms  \r\n7. Re Use  \r\n8. City Beneath  \r\n9. Everything After \r\n10. Places for Breathing   \r\n11. Look Right Through Me \r\n', 2, 0, 'Revis', NULL, 4, NULL, NULL, 'Rock'),
(42, '2010-11-21', 'All Hope Is Gone', 'http://i.s8.com.br/images/cds/cover/img7/21422547.jpg', 'Faixas:\r\n\r\nExecute  \r\nGematria (The Killing Name)  \r\nSulfur  \r\nPsychosocial  \r\nDead Memories  \r\nVendetta  \r\nButcher�s Hook  \r\nGehenna  \r\nThis Cold Black  \r\nWherein Lies Continue  \r\nSnuff  \r\nAll Hope Is Gone  ', 2, 0, 'Slipknot', NULL, 3, NULL, NULL, 'Heavy Metal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_mensagem` (
  `id_mensagem` int(11) NOT NULL auto_increment,
  `remetente` int(11) NOT NULL,
  `destinatario` int(11) NOT NULL,
  `data_envio` date NOT NULL,
  `fk_troca` int(11) NOT NULL,
  `texto` text NOT NULL,
  PRIMARY KEY  (`id_mensagem`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tb_mensagem`
--

INSERT INTO `tb_mensagem` (`id_mensagem`, `remetente`, `destinatario`, `data_envio`, `fk_troca`, `texto`) VALUES
(1, 1, 2, '2010-11-01', 924, 'Era pra ter lan?ado ontem, mas ficou pra hoje! Voc? pode ganhar um exemplar de Cem Toques Cravados, o livro de Edson Rossatto que cont?m cem nanocontos para serem lidos em qualquer lugar.'),
(2, 2, 1, '2010-11-10', 924, 'A Triologia de filmes Deixados para Tr?s, alcan?ou grande sucesso pelo mundo, sendo vendidos mais de 10 milh?es de c?pias. A nova produ??o que ocorrer? em 2011 ser? um "remake" do Deixados para tr?s, e a Cloud Ten Pictures promete um or?amento '),
(3, 1, 2, '2010-11-01', 924, 'Teste de nova mensagem'),
(4, 1, 2, '2010-11-01', 278, 'Mias um teste. Troca com zero mensagens.'),
(5, 1, 2, '2010-11-02', 924, 'Vamos marcar no hall do 6? andar, ok?'),
(6, 1, 2, '2010-11-02', 927, 'Me interessei pelo seu livro Cidade dos Ossos. Est? em bom estado? Ofere?o em troca esse cl?ssico da literatura, semi-novo, comprado em dezembro de 2009. Topa?');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_troca`
--

CREATE TABLE IF NOT EXISTS `tb_troca` (
  `id_troca` int(11) NOT NULL auto_increment,
  `fk_user_1` int(11) NOT NULL,
  `fk_user_2` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `data_fim` date default NULL,
  `fk_status` int(11) NOT NULL,
  `token` int(11) default NULL,
  PRIMARY KEY  (`id_troca`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=928 ;

--
-- Extraindo dados da tabela `tb_troca`
--

INSERT INTO `tb_troca` (`id_troca`, `fk_user_1`, `fk_user_2`, `data_pedido`, `data_fim`, `fk_status`, `token`) VALUES
(460, 1, 2, '2010-10-03', NULL, 3, NULL),
(171, 1, 2, '2010-10-03', NULL, 2, NULL),
(631, 1, 2, '2010-10-02', NULL, 2, NULL),
(103, 1, 2, '2010-10-03', NULL, 2, NULL),
(920, 1, 2, '2010-10-03', NULL, 1, NULL),
(278, 1, 2, '2010-10-05', NULL, 1, NULL),
(921, 2, 1, '2010-11-01', '2010-11-01', 2, 50),
(922, 2, 1, '2010-11-01', '2010-11-01', 3, 8),
(923, 2, 1, '2010-11-01', '2010-11-01', 2, 6),
(924, 1, 2, '2010-11-01', NULL, 1, 80),
(925, 1, 2, '2010-11-01', '2010-11-01', 3, 64),
(926, 1, 2, '2010-11-01', NULL, 1, 60),
(927, 1, 2, '2010-11-02', NULL, 1, 38);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id_usuario` int(11) NOT NULL auto_increment,
  `matricula` varchar(12) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `sobrenome` varchar(128) NOT NULL,
  `data_cadastro` date NOT NULL,
  `email` varchar(64) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `sexo` varchar(32) NOT NULL,
  `fk_area` int(11) NOT NULL,
  PRIMARY KEY  (`id_usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `matricula`, `nome`, `sobrenome`, `data_cadastro`, `email`, `senha`, `sexo`, `fk_area`) VALUES
(1, '111111', 'Felipe', 'Fagundes', '2010-09-08', 'felipefagundes@yahoo.com', 'senha', 'masculino', 2),
(2, '3545436656', 'Camilla', 'Jacinto', '2010-09-08', 'camillajacinto@hotmail.com', 'senha', 'feminino', 3),
(3, '200910008711', 'Francisco', 'Neto', '2010-10-03', 'chico@uerj.com.br', 'senha', 'Masculino', 2),
(4, '200911111111', 'Luiz', 'Manso', '2010-10-07', 'luiz@uerj.com', 'senha', 'Masculino', 1),
(5, '201010010011', 'Ted', 'Mosby', '2010-11-21', 'tedmosby@fake.com', 'ahnes', 'Masculino', 2),
(6, '201010020011', 'Marshall', 'Eriksen', '2010-11-21', 'marshalleriksen@fake.com', 'ahnes', 'Masculino', 1),
(7, '201010030011', 'Robin', 'Scherbatsky', '2010-11-21', 'robinscherbatsky@fake.com', 'ahnes', 'Feminino', 1),
(8, '201010040011', 'Barney', 'Stinson', '2010-11-21', 'barneystinson@fake.com', 'ahnes', 'Masculino', 3),
(9, '201010050011', 'Lily', 'Aldrin', '2010-11-21', 'lilyaldrin@fake.com', 'ahnes', 'Feminino', 1),
(10, '201010060011', 'Sheldon', 'Cooper', '2010-11-21', 'sheldoncooper@fake.com', 'ahnes', 'Masculino', 3);
