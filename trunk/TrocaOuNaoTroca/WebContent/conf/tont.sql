-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Nov 21, 2010 as 11:50 AM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.6

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
(11, '2010-11-21', 'Donnie Darko', 'http://ecx.images-amazon.com/images/I/51VJ0GWFN8L.jpg', 'Quem vê Donnie Darko logo imagina se tratar de um adolescente desajustado. Na verdade, Donnie esta à beira da loucura, devida as visões constantes de um coelho monstruoso, que tenta mantê-lo sob a sua sinistra influência. Incitado pela aparição, Donnie tem atuação anti-social, enquanto se submete à terapia, sobrevive das extravagâncias da vida e do romance no colégio e, por acaso, escapa a uma estranha morte devido à queda de um avião. Donnie luta contra os seus demônios, literal e figurativamente, numa intriga de histórias entrelaçadas que jogam com as viagens no tempo, gurus fundamentalistas, predestinação e os desígnios do universo. ', 3, 0, NULL, NULL, 5, NULL, NULL, 'Suspense'),
(12, '2010-11-21', 'Harry Potter ea Pedra Filosofal', 'http://lusalivros.files.wordpress.com/2009/12/311839_1.jpg', 'Em Harry Potter e a Pedra Filosofal, o leitor é apresentado a Harry, filho de Tiago e Lílian Potter, feiticeiros que foram assassinados por um poderosíssimo bruxo, quando ele ainda era um bebê. Com isso, o menino acaba sendo levado para a casa dos tios que nada tinham a ver com o sobrenatural ? pelo contrário. Até os 10 anos, Harry foi uma espécie de gata borralheira: maltratado pelos tios, herdava roupas velhas do primo gorducho, tinha óculos remendados e era tratado como um estorvo. No dia de seu aniversário de 11 anos, entretanto, ele parece deslizar por um buraco sem fundo, como o de Alice no país das maravilhas, que o conduz a um mundo mágico. Descobre sua verdadeira história e seu destino: ser um aprendiz de feiticeiro até o dia em que terá que enfrentar a pior força do mal, o homem que assassinou seus pais, o terrível Lorde das Trevas.', 1, 0, 'J.K.Rowling', 'Rocco', 5, NULL, NULL, NULL),
(13, '2010-11-21', 'Calculo II', 'http://img.americanas.com.br/produtos/01/02/item/5658/9/5658979g1.jpg', 'Este livro da continuidade aoa volume 1, trazendo também exemplos e exercicios com dados da vida real que esclarerem e demosntram, de forma prática, conceitos, teoremas e regras do cálculo. As técnicas pedagógicas e os recursos utilizados obedecem ao mesmo critério adotado no volume 1.', 1, 0, 'Bruce H. Edwards', 'McGraw Hill ', 5, NULL, '8', NULL),
(14, '2010-11-21', 'Desenho Técnico Moderno', 'http://i.s8.com.br/images/books/cover/img5/1706485.jpg', 'Uma obra em português (de Portugal) que aborda um conjunto de metodologias e procedimentos necessários ao desenvolvimento e comunicação de projetos, conceitos e idéias referentes à representação gráfica. Trata o Desenho Técnico clássico em conformidade com as normas internacionais em vigor, integrando as metodologias baseadas no Desenho Assistido por Computador e modelagem 3D, de forma tão adequada quanto o sucesso das suas primeiras edições tem refletido. Explora os conceitos básicos começando pelo esboço a mão livre, até a utilização de recursos de informática (CAD) além de apresentar detalhadamente os conceitos associados ao Desenho Técnico, das regras e procedimentos de sua utilização em geral, e também das particularidades específicas nos diversos domínios de aplicação, conjugando a representação tradicional e as técnicas de modelagem geométrica, em 2D e em 3D, no âmbito da utilização de sistemas CAD (Computer-Aided-Design).\r\nNa presente edição, o livro foi extensamente revisto na sua parte inicial e aumentado para incluir as especificidades de conteúdos de ensino e projeto de Engenharia Civil e Arquitetura. No final de cada capítulo, encontram-se ainda exercícios de grande utilidade para docentes. Destinado aos atuais e futuros profissionais de Engenharia, como manual de formação ou atualização em Desenho Técnico, serve como elemento de consulta sobre vários assuntos ligados a Projeto (normas, materiais, elementos normalizados, tolerâncias), tornando-se, deste modo, especialmente indicado para as áreas de Engenharia Civil e Arquitetura e de Engenharia Mecânica, Industrial, Naval, Aeronáutica e Aeroespacial.', 1, 0, 'ARLINDO SILVA & CARLOS TAVARES RIBEIRO & JOAO DIAS', 'LTC', 5, NULL, '4', NULL),
(15, '2010-11-21', 'Greatest Hits', 'http://i.s8.com.br/images/cds/cover/img8/1019478.jpg', 'Esta é a coletânea fantástica do The Offspring, uma das maiores bandas de punk rock da atualidade, com sete álbuns gravados e mais de 32 milhões de cópias vendidas, que conta com Dexter Holland nos vocais e guitarra, Noodles na guitarra, Greg K no baixo e Atom Willard na bateria. São 15 faixas divididas entre inéditas e clássicos que pontuaram no Top 10 da Billboard, como "Come Out and Play (Keep ´Em Separated)", "Self Esteem", "Gotta Get Away" e "Pretty Fly (For a White Guy)". \r\n\r\nDisco\r\nCan´t Repeat  \r\nCome Out And Play  \r\nSelf Esteem  \r\nGotta Get Away  \r\nAll I Want  \r\nGone Away  \r\nPretty Fly (For a White Guy)  \r\nWhy Don´t You Get a Job?  \r\nThe Kids Aren´t Alright  \r\nOriginal Prankster  \r\nWant You Bad  \r\nDefy You  \r\nHit That  \r\n(Can´t Get My) Head Around You  \r\nThe Kids Aren´t Alright (Full Mix)  ', 2, 0, 'The Offspring', NULL, 5, NULL, NULL, 'Rock'),
(16, '2010-11-21', 'Código Civil', 'http://i.s8.com.br/images/books/cover/img5/21784135.jpg', 'Esta obra contempla a íntegra da Constituição Federal e do ADCT, o Código Civil, Legislação Complementar selecionada contendo diplomas legais necessários ao estudo da matéria, além de Súmulas Vinculantes do STF, Súmulas do STF, TFR e STJ. \r\n', 1, 0, 'AUTORES DIVERSOS', 'Rideel', 6, NULL, '16', NULL),
(17, '2010-11-21', 'Codigo Eleitoral', 'http://i.s8.com.br/images/books/cover/img1/21784141.jpg', 'Esta obra contempla a íntegra da Constituição Federal e do ADCT, o Código Eleitoral, Legislação Complementar selecionada contendo diplomas legais necessários ao estudo da matéria, além de Súmulas Vinculantes do STF, Súmulas do STF, STJ e TSE. ', 1, 0, 'JOSE NEPOMUCENO SILVA', 'Rideel', 6, NULL, '16', NULL),
(18, '2010-11-21', 'Resident Evil 5', 'http://i.s8.com.br/images/games/cover/img5/21617585.jpg', 'Jogo para PC.\r\nA ameaça biológica ainda não acabou. Quando parecia que a ameaça de Resident Evil havia sido destruída, chega um novo terror que irá dar calafrios aos jogadores. Chris Redfield, o herói já conhecido de Resident Evil, seguiu o caminho do mal literalmente ao redor globo. Depois de se juntar a uma nova organização, Chris vai até a África, onde a última ameaça em bioterrorismo está literalmente transformando as pessoas e animais da cidade em criaturas enlouquecidas. Ele se junta a uma nova parceira, Sheva Alomar, que fornece a sua força, inteligência e habilidade em atirar para a sua missão.\r\nEste é o mais novo título na série Resident Evil, que chegou a vender mais de 34 milhões de unidades desde quando o jogo original foi lançado em 1996, e deu início a uma trilogia multi-milionária de filmes da Sony Pictures. Resident Evil 5 irá revolucionar a série Resident Evil, assim como Resident Evil 4 revolucionou. ', 5, 0, NULL, NULL, 6, NULL, NULL, 'Survival Horror'),
(19, '2010-11-21', 'Apostila de Direito da CEC Concursos', 'http://www.comprinhas.com.br/34-111-large/apostila-de-direito-administrativo-trabalhista-processual-civil-e-do-trabalho-trt.jpg', 'Este excelente material possui mais de 400 páginas de muita informação sobre algumas áreas do Direito (Administrativo, do Trabalho, Processual do Trabalho e Processual Civil). Contém também diversos testes com gabaritos.', 4, 0, NULL, NULL, 6, NULL, NULL, NULL),
(20, '2010-11-21', 'All the Right Reasons', 'http://i.s8.com.br/images/cds/cover/img9/1058149.jpg', 'Faixas:\r\nFollow You Home  \r\nFight for All the Wrong Reasons  \r\nPhotograph  \r\nAnimals  \r\nSavin´ Me  \r\nFar Away  \r\nNext Contestant  \r\nSide of a Bullet  \r\nIf Everyone Cared  \r\nSomeone That You´re With  \r\nRockstar \r\n', 2, 0, 'Nickelback', NULL, 6, NULL, NULL, 'Rock'),
(21, '2010-11-21', 'Elements Pt.2', 'http://i.s8.com.br/images/cds/cover/img2/21314762.jpg', 'Elements Pt.2 é mais um álbum excepcional do Stratovarius, que não pode faltar na coleção dos verdadeiros fãs da banda. São nove faixas, incluindo "Season of Faith´s Perfection", "Awaken the Giant", "Know the Difference", "Luminous", "Dreamweaver", alguns dos destaques. \r\n\r\nDisco:\r\nAlpha & Omega  \r\nI Walk to My Own Song  \r\nI´m Still Alive  \r\nSeason of Faith´s Perfection  \r\nAwaken the Giant  \r\nKnow the Difference  \r\nLuminous  \r\nDreamweaver  \r\nLiberty  \r\n', 2, 0, 'Stratovarius', NULL, 7, NULL, NULL, 'Heavy Metal'),
(22, '2010-11-21', 'O Grande Livro do Jornalismo', 'http://i.s8.com.br/images/books/cover/img6/21363516.jpg', 'O grande livro do jornalismo, editado por Jon E. Lewis, reúne 55 dos mais emblemáticos textos jornalísticos de todos os tempos. De ?Um homem é guilhotinado em Roma?, escrito por Charles Dickens em 1845, a ?O relógio marcava 7h55 ? precisamente o momento em que o míssil explodiu?, de Robert Fisk, sobre a eclosão da Guerra do Iraque, em 2003, reúne a elite do jornalismo e exibe uma lição de seriedade, competência e talento. O volume traz ainda reportagens assinadas por Mark Twain, Jack London, John Reed, Dorothy Parker, Elliott V. Bell, John Dos Passos, John Steinbeck, George Orwell, Relman Morin, Merriman Smith, Norman Mailer, Hunter S. Thompson, Gore Vidal e Jon Krakauer, entre outros. As reportagens compiladas por Jon E. Lewis abrangem uma variadíssima gama de assuntos, da queda da bolsa de Nova York ao casamento de Grace Kelly, passando pelo estouro dos Beatles, o assassinato de John Kennedy e a insurreição do Talibã no Afeganistão, mas estão unidas pela qualidade de seus textos. Nesse sentido, O grande livro do jornalismo funciona como um verdadeiro manual de redação e estilo. ', 1, 0, 'JON E. LEWIS', 'José Olympio', 7, NULL, '1', NULL),
(23, '2010-11-21', 'Sociedade do Telejornalismo', 'http://i.s8.com.br/images/books/cover/img4/21323434.jpg', 'O desafio a que os autores se propuseram ao produzirem os capítulos desse livro foi o de aproximar a teoria da prática. É indiscutível a influência da TV na construção do imaginário das pessoas. Pode ter certeza, caro leitor, que a TV não entra apenas na sua casa, ela entra na sua vida. O propósito em comum dos artigos aqui reunidos foi o de contribuir para os estudos e a pesquisa do telejornalismo, propondo a reflexão crítica sobre o alcance e a influência do telejornalismo na vida de todos. ', 1, 0, 'ALFREDO VIZEU & AUTORES DIVERSOS ', 'Vozes ', 7, NULL, '1', NULL),
(24, '2010-11-21', 'Dexter: A Mão Esquerda de Deus', 'http://i.s8.com.br/images/books/cover/img4/21392874.jpg', 'Dexter Morgan é um educado lobo vestido em pele de ovelha. Dexter é um serial killer. Na verdade, é um assassino incomum que extermina apenas aqueles que merecem. Ao mesmo tempo, trabalha como perito da polícia de Miami... Em Dexter, a Mão Esquerda de Deus, o livro que deu origem à aclamada série de TV, o adorável matador depara-se com um concorrente de estilo semelhante ao seu, encanta-se e incomoda-se com ele, prevê seus passos... A escrita requintada de Jeff Lindsay nos faz mergulhar na mente de um dos personagens mais ambíguos da história da literatura de suspense. Nunca o macabro foi tratado com tanto refinamento e leveza. Dexter Morgan é uma obra-prima. ', 1, 0, 'Jeff Lindsay', 'Planeta do Brasil', 7, NULL, NULL, NULL),
(25, '2010-11-21', 'Guitar Hero: Smash Hits', 'http://i.s8.com.br/images/games/cover/img3/21556153.jpg', 'Game para XBOX360.\r\nGuitar Hero: Smash Hits contém faixas dos três primeiros Guitar Hero, além do game para todos os que possuem interesse em participar de uma banda... Pelo menos nos games.\r\nAo todo, são 48 músicas de toda a franquia com a possibilidade de experimentar "velhas conhecidas" dos Guitar Hero mais antigos. No que se diz respeito à jogabilidade, pode-se dizer que a estrutura básica de Smash Hits vem diretamente do que é encontrado em Metallica e World Tour. \r\nAinda assim, o jogo conta com um sistema de criação de personagens (no caso, estrelas de rock), modos Career (single e multiplayer), um modo Battle of the Bands para até oito jogadores, modos de dificuldade variados (possivelmente de Beginner a Expert) e um estúdio musical. No entanto, oito novos locais de encontro aparecem no jogo, como salas de concerto na Amazônia, nas calotas polares. ', 5, 0, NULL, NULL, 7, NULL, NULL, NULL),
(26, '2010-11-21', 'Química 1 - Ensino Médio', 'http://i.s8.com.br/images/software/cover/img2/1705232.jpg', 'Este software aborda a Química do ensino médio de forma inovadora, prática e atual. Possui um ambiente estimulante (telas+áudio), com uma navegação fácil e intuitiva, o que facilita a compreensão do assunto. Além disso possui muitos testes ao final de cada assunto, para você treinar o que já foi apresentado! E ainda acompanhe os seus resultados, verificando os erros e acertos. \r\n\r\nConfira a lista completa do conteúdo abordado no curso:\r\n\r\n01. Mol e Quantidade da Matéria. \r\n02. Leis Ponderais. \r\n03. Cálculo de Fórmulas. \r\n04. Cálculo Estequiométrico. \r\n05. Soluções. \r\n06. Termoquímica. \r\n07. Regra para NOX. \r\n08. Cinética Química. \r\n09. Equilibrio Químico. ', 5, 0, NULL, NULL, 8, NULL, NULL, NULL),
(27, '2010-11-21', 'Matrix', 'http://i.s8.com.br/images/dvds/cover/img5/74135.jpg', 'Marco na história do cinema, esta aventura cibernética com efeitos especiais fantásticos narra a luta de um hacker profissional, ao lado de um grupo de revolucionários, contra o programa de inteligência artificial que controla a realidade vivida pelos seres humanos. Imperdível! \r\nInformações especiais: Menu Interativo - Filmografia - Documentário dos Bastidores Matrix - A Filmagem - Escolha de Cena ', 3, 0, NULL, NULL, 8, NULL, NULL, 'SciFi'),
(28, '2010-11-21', 'Serenity: A Luta pelo Amanhã ', 'http://i.s8.com.br/images/dvds/cover/img6/1478426.jpg', 'Uma guerra devastadora dizimou milhões de pessoas em toda a galáxia. De um lado, a poderosa Aliança, detentora das mais modernas tecnologias do Universo. Do outro, os terríveis Reavers, selvagens canibais que utilizam táticas de guerrilha para combater o inimigo. Oficialmente, a guerra acabou com a vitória da Aliança, mas os Reavers não desistem jamais, e continuam lutando. É neste cenário de lutas e tensões que a Aliança desenvolve uma nova "arma de guerra": a garota paranormal River, aparentemente uma adolescente comum, mas dona de poderes psíquicos incalculáveis. Porém, seu irmão Simon não quer vê-la transformada em armamento bélico, e rapta a menina dos laboratórios da aliança. Em sua fuga desesperada, River e Simon agora só têm uma esperança: pegar uma carona na Serenity, a nave do veterano Capitão Malcolm Reynolds, um homem que conhece todos os caminhos na luta pela sobrevivência. Porém, combatendo ao mesmo tempo a Aliança e os Reavers, o preço da liberdade pode ser alto demais. ', 3, 0, NULL, NULL, 8, NULL, NULL, 'SciFi'),
(29, '2010-11-21', 'Apostila Concurso CETESB', 'http://images.quebarato.com.br/T440x/apostila+cetesb+engenheiro+agronomo+civil+quimico+geologo__121A2F_1.jpg', 'APOSTILA CONCURSO CETESB 2008 TODOS AS ÁREAS: \r\n\r\nA APOSTILA ABORDA: \r\n\r\nCONHECIMENTO GERAL \r\n\r\nCONHECIMENTO ESPECIFICO \r\n\r\nMAIS DE 30 PROVAS DE CONCURSOS ANTERIORES POR ÁREA \r\n', 4, 0, NULL, NULL, 8, NULL, NULL, NULL),
(30, '2010-11-21', 'Heathen Chemistry', 'http://i.s8.com.br/images/cds/cover/img0/175490.jpg', 'Album do grupo britânico, liderado pelo vocalista Noel Gallagher, que é considerado pelo próprio Oasis, "de volta às origens" com um rock puro, cru, que consagrou o grupo ao trono da música britânica. Destaque para as faixas "The Hindu Times", um rock psicodélico que lembra os anos 60, além de "She Is Love" e "Little By Little". \r\n\r\nThe Hindu Times ( Album Version)  \r\nForce Of Nature ( Album Version)  \r\nHung In A Bad Place ( Album Version)  \r\nStop Cryng Your Heart Out ( Album Version)  \r\nSongbird ( Album Version)  \r\nLittle By Little ( Album Version)  \r\nA Quick Peep ( Album Version)  \r\nProbably All In The Mind ( Album Version)  \r\nShes Is Love ( Album Version)  \r\nBorn On A Different Cloud ( Album Version )  \r\nBetter Man ( Album Version)(Hidden Track)  \r\n', 2, 0, 'Oasis', NULL, 8, NULL, NULL, 'Rock'),
(31, '2010-11-21', 'Box Jiraiya: O Incrível Ninja', 'http://i.s8.com.br/images/dvds/cover/img2/21545902.jpg', 'Box Jiraiya: O Incrível Ninja - 5 DVDs\r\nEntre dezenas de seriados japoneses que vieram para o Brasil de carona no sucesso de Jaspion e Changeman, no final dos anos 80 e começo dos 90, Jiraiya foi o mais popular. E o motivo disso é o mesmo que fez dele um sucesso também no Japão: a temática ninja. Jiraiya adaptou o tradicional universo dos ninjas reais ao ritmo e cores das típicas séries de super-heróis japonesas, com guerreiros de visual extravagante, espadas laser, monstros, magias, etc. Na história, esses guerreiros, espalhados pelo mundo, vão para o Japão em busca do tesouro espacial Pako, cuja localização é apontada por uma inscrição fragmentada entre a família Yamashi e o maligno clã dos Feiticeiros. Ele herda a armadura e a Espada Olímpica de seu pai adotivo, Tetsuzan Yamashi, para proteger a inscrição e destruir ninjas mal intencionados. Ao longo das batalhas, Jiraiya conta com a ajuda de seus irmãos, Manabu e Kei Yamashi, e de alguns ninjas que deixam suas ambições pessoais de lado para lutar pela paz. A aguardada reedição da série em DVD é a chance de rever com imagem e som digitais a vibrante trajetória do herói que, diferente da maioria, não tinha super poderes e precisava aprimorar o tempo todo sua arte ninja para vencer os inimigos.', 3, 0, NULL, NULL, 9, NULL, NULL, NULL),
(32, '2010-11-21', 'Como Treinar o seu Dragão', 'http://i.s8.com.br/images/dvds/cover/img4/21870844_4.jpg', 'Um campeão de público e crítica, Como Treinar o seu Dragão vem soltando fogo, com aventura épica e muitas risadas, numa encantadora e original história.\r\nSoluço é um jovem viking que desafia a tradição, quando fica amigo de um dos mais mortais inimigos - um feroz dragão que ele chama de Banguela. Juntos, os improváveis heróis tem que lutar contra tudo para o mundo de ambos, neste maravilhoso e divertido sucesso', 3, 0, NULL, NULL, 9, NULL, NULL, NULL),
(33, '2010-11-21', 'A Pedagogia', 'http://i.s8.com.br/images/books/cover/img5/1026505.jpg', 'Sobre a pedagogia, todos têm alguma coisa a dizer, mesmo que através da evocação de suas lembranças de estudantes, de sua experiência de pai e mãe, de sua reflexão de cidadãos. Os elementos propostos aqui visam fazer eco a essas recordações, mas, ao mesmo tempo, dar informações acerca de alguns pontos técnicas mais complexos ou acentuar que o que parece simples merece muitas vezes um olhar reflexivo. ', 1, 0, 'ANNE-MARIE DROUIN', 'Loyola', 9, NULL, '1', NULL),
(34, '2010-11-21', 'Ágape', 'http://i.s8.com.br/images/books/cover/img3/21862763.jpg', 'O amor divino, segundo o padre Marcelo Rossi\r\n\r\nEm seu livro Ágape, com prefácio de Gabriel Chalita, o sacerdote católico tece suas reflexões sobre passagens do Evangelho de são João e convida o leitor a enveredar por inspiradas orações\r\n\r\nOs dicionários definem a palavra "ágape" como a refeição promovida pelos primitivos cristãos a fim de celebrar o rito eucarístico. O rito confraternizava ricos e pobres em torno de ideais como amizade, caridade, amor. Em Ágape, livro lançado pela Editora Globo, Padre Marcelo Rossi retoma e amplia o sentido original do conceito: "Ágape é uma palavra de origem grega que significa o amor divino. O amor de Deus pelos seus filhos. E ainda o amor que as pessoas sentem umas pelas outras inspiradas nesse amor divino", assinala no texto de introdução do volume. \r\n\r\nCom sua abordagem de comunicação moderna, original e leve, padre Marcelo leva conforto espiritual e ensinamentos da Igreja Católica para milhões de brasileiros por meio de programas de rádio e TV. O estilo claro, direto e sereno que o transformou em fenômeno midiático está impregnado, agora, em Ágape, obra literária em que o autor apresenta trechos selecionados do Evangelho de são João e os reinterpreta à luz do significado do amor divino no mundo contemporâneo. \r\n\r\nMais do que se apresentar como estudo teológico sobre os escritos narrados pelo apóstolo, o livro tem explícita intenção oracional. Nesse sentido, trata-se de um diálogo entre o autor, na condição de padre, e seus filhos em busca da boa palavra. Cada capítulo do volume se encerra com uma oração envolvendo os temas ali examinados pelo autor, como a convidar os leitores para um momento de introspecção e de acolhimento das mensagens de Jesus segundo são João. \r\n\r\nA escolha do Evangelho de são João entre tantas outras possibilidades dentro da Bíblia é justificada por Padre Marcelo pela beleza da estrutura literária e pela impressionante delicadeza com que são descritos os momentos da vida de Jesus - como se o apóstolo não se contentasse em apenas narrar os fatos, mas quisesse nos trazer para dentro da situação descrita. Compartilhar a beleza das narrações do evangelista com os leitores é outro dos objetivos declarados do autor, que busca, com Ágape, incentivar cada vez mais a leitura da Palavra de Deus. ', 1, 0, 'PADRE MARCELO ROSSI ', 'Globo', 9, NULL, '1', 'Religião'),
(35, '2010-11-21', 'Multimetro Digital UT-30B c/Tst p/Transistor', 'http://img.grandeeletro.com.br/img/products/multimetro-digital-ut-30b-c-tst-p-transistor_1_180.jpg', 'Características:\r\nCapacitância: 20nF/200nF/2MF/100MF \r\nCorrente AC: 20mA/200mA/20A \r\nCorrente DC: 2mA/20mA/200mA/20A \r\nDisplay: 1999 - 59x25mm - com iluminação traseira \r\nResistência: 200R/2kR/20kR/200kR/2MR/20MR/200MR \r\nTemperatura: -40 ~1000ºC \r\nTensão AC: 2V/20V/200V/750V \r\nTensão DC: 200mV/2V/20V/200V/1000V \r\nImpedância entrada em Volt DC: 10MR ', 5, 0, NULL, NULL, 9, NULL, NULL, NULL),
(36, '2010-11-21', 'Biologia', 'http://i.s8.com.br/images/books/cover/img9/21776179.jpg', 'A Editora Ática é uma editora que está entre as líderes no setor de livros escolares no Brasil. A empresa, que contabiliza hoje mais de 2.300 títulos em catálogo e cerca de 1.100 autores diferentes, fez história com obras e coleções que marcaram época e viraram referência para professores e estudantes no Brasil. ', 1, 0, 'SIDIO MACHADO', 'Scipione', 10, NULL, '1', NULL),
(37, '2010-11-21', 'Biologia Médica ', 'http://i.s8.com.br/images/books/cover/img9/100509.jpg', 'Uma obra que condensa em um mínimo de espaço um máximo de informações básicas, nascidas de um conhecimento profundo e atualizado da matéria, abrindo novos caminhos à compreensão dos enigmas da Biologia e de suas conseqüências para a Medicina. ', 1, 0, 'WERNER BUSELMAIER', 'EPU Editora', 10, NULL, NULL, NULL),
(38, '2010-11-21', 'O Hobbit', 'http://i.s8.com.br/images/books/cover/img0/21564670.jpg', 'Prelúdio de O Senhor dos Anéis, O Hobbit conquistou sucesso imediato quando foi publicado em 1937. Vendeu milhões de cópias em todo o mundo e estabeleceu-se como um clássico moderno e um dos livros mais influentes de nossa geração. \r\n\r\nA estória narra o longo e perigoso trajeto de um hobbit chamado Bilbo Bolseiro (tio de Frodo, um dos principais protagonista do clássico O Senhor dos Anéis). A viagem é repleta de aventuras das quais ele desgota até a Montanha Solitária em busca do tesouro roubado pelo dragão Smaug anos atrás. Tudo começa num dia inesperado em que Bilbo recebe a visita de Gandalf com 13 anões, entre eles Thorin Escudo-de-Carvalho - cuja família teve roubado o tesouro. Alguns dos feitos narrados em O Hobbit influirão nos acontecimentos posteriores de O Senhor dos Anéis). ', 1, 0, 'J.R.R. TOLKIEN', 'WMF', 10, NULL, '1', NULL),
(39, '2010-11-21', 'Star Trek XI', 'http://i.s8.com.br/images/dvds/cover/img1/21787341.jpg', 'Star Trek é uma explosão de puro espetáculo cinematográfico e um irresistível convite à diversão. O impetuoso e renegado James Kirk (Chris Pine) e o igualmente jovem, meio vulcaniano, meio humano, Spock (Zachary Quinto), estão entre os jovens membros de uma tripulação principiante da esquadra estelar, prestes a lançar a mais avançada nave espacial já criada: a U.S.S. Enterprise. Durante a incrível viagem galáctica para explorar o espaço, eles conhecerão o diabólico Nero (Eric Bana), cuja missão de vingança ameaça toda a humanidade. Com esta Edição Especial com Dois Discos, contendo, além do filme de tremendo sucesso, extras especiais totalmente novos, você vai viajar pelos bastidores e mergulhar no empolgante universo cheio de ação de Star Trek, como nunca experimentou antes.\r\n', 3, 0, NULL, NULL, 10, NULL, NULL, 'SciFi'),
(40, '2010-11-21', 'Um Morto Muito Louco', 'http://i.s8.com.br/images/dvds/cover/img0/1792030.jpg', 'Dois jovens funcionários de uma corretora de seguros, Larry Wilson (Andrew McCarthy) e Richard Parker (Jonathan Silverman) descobrem uma fraude milionária na empresa. Certos de serem recompensados, levam a informação até o chefe Bernie Lomax (Terry Kiser), sem saber que este é o responsável por tal irregularidade. Bernie então convida a dupla para passar um fim de semana em sua casa, onde planeja matá-los, mas é o próprio Bernie que acaba morrendo. Decididos a não passar o fim-de-semana com aborrecimentos, os dois amigos acabam curtindo o local enquanto tentam fazer com que todos não notem que o chefe está morto. ', 3, 0, NULL, NULL, 10, NULL, NULL, 'Comédia'),
(41, '2010-11-21', 'Places For Breathing', 'http://images.uulyrics.com/cover/r/revis/album-places-for-breathing.jpg', '1. Caught in the Rain  \r\n2. Your Wall  \r\n3. Spin  \r\n4. Seven  \r\n5. Straight Jacket Labels  \r\n6. Living Rooms  \r\n7. Re Use  \r\n8. City Beneath  \r\n9. Everything After \r\n10. Places for Breathing   \r\n11. Look Right Through Me \r\n', 2, 0, 'Revis', NULL, 4, NULL, NULL, 'Rock'),
(42, '2010-11-21', 'All Hope Is Gone', 'http://i.s8.com.br/images/cds/cover/img7/21422547.jpg', 'Faixas:\r\n\r\nExecute  \r\nGematria (The Killing Name)  \r\nSulfur  \r\nPsychosocial  \r\nDead Memories  \r\nVendetta  \r\nButcher´s Hook  \r\nGehenna  \r\nThis Cold Black  \r\nWherein Lies Continue  \r\nSnuff  \r\nAll Hope Is Gone  ', 2, 0, 'Slipknot', NULL, 3, NULL, NULL, 'Heavy Metal');

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
