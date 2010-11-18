-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost:3306
-- Tempo de Gera��o: Nov 02, 2010 as 02:44 PM
-- Vers�o do Servidor: 5.0.41
-- Vers�o do PHP: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Banco de Dados: `tont`
-- 

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_area`
-- 

CREATE TABLE `tb_area` (
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
(3, 'Biol�gicas');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_categoria`
-- 

CREATE TABLE `tb_categoria` (
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

CREATE TABLE `tb_item` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- 
-- Extraindo dados da tabela `tb_item`
-- 

INSERT INTO `tb_item` (`id_item`, `data_cadastro`, `titulo`, `imagem`, `descricao`, `fk_categoria`, `status`, `autor`, `editora`, `fk_usuario`, `fk_troca`, `edicao`, `genero`) VALUES 
(1, '2010-09-24', 'Deixados para tr�s', 'http://files.tyndale.com/thpdata/images--covers/119_w/978-0-8423-2911-8.gif', 'Em um instante catacl�smico, milh�es de pessoas de todas as partes do mundo desapareceram. Simplesmente sumiram, deixando para tr�s tudo o que era material: roupas, �culos, lentes de contato, cabelos posti�os, aparelhos de surdez, pr�teses, j�ias, sapatos e at� mesmo marca passos e pinos cir�rgicos. Milh�es de pessoas sumiram. Mas outros milh�es ficaram - alguns adultos, por�m n�o crian�as, e apenas alguns adolescentes. Todos os beb�s, inclusive os que estavam para nascer, desapareceram � alguns durante o parto. Instalou-se o caos no mundo inteiro. Avi�es, trens, �nibus e carros colidiram, navios afundaram, casas incendiaram, sobreviventes acometidos de ang�stia suicidaram-se. Um congestionamento de transportes e linhas de comunica��o, somado ao desaparecimento de in�meros funcion�rios, deixou a maioria das pessoas lutando sozinhas para sobreviverem at� que a situa��o come�asse a se normalizar.', 1, 0, 'Tim Lahaye', NULL, 1, 923, '1�', NULL),
(2, '2010-09-07', 'O Fim do Jogo', 'http://livrosgratis.net/upload/capas/fim_do_jogo.jpg', 'Frank Peretti e Tedd Dekker - dois dos mais aclamados escritores de thrillers sobrenaturais - uniram-se para escrever FIM DE JOGO. Numa casa assustadora, sete jogadores participam de um jogo mortal. H� apenas 3 regras que n�o fazem sentido algum, exceto para um serial killer. Ao longo do jogo, percebe-se que a �nica forma de vencer � perder e a �nica forma de sair � entrar...', 1, 1, 'Frank Peretti', NULL, 1, NULL, '1�', NULL),
(3, '2010-09-30', 'Emanuel', 'http://baugospel.com.br/wp-content/uploads/2010/09/nivea-soares-emanuel.jpg', 'O novo CD da Cantora N�vea Soares � demais. S�o treze can��es totalmente in�ditas de um trabalho que j� esta nas lojas de todo o Brasil. O t�o esperado CD Emanuel de N�vea Soares foi gravado por Gustavo Soares, no est�dio e-music, em Belo Horizonte.', 2, 1, 'N�vea Soares', NULL, 2, NULL, NULL, NULL),
(4, '2010-10-14', 'Inimigos da HP - ao vivo', 'http://www.concamusic.com.br/images/CD%20INIMIGOS%20DA%20HP%20-%20E%20QUEM%20NAO%20GOSTA%20DO%20INIMIGOS.jpg', '1. A Musa da Praia\r\n2. Brilho de Cristal\r\n3. Escondida\r\n4. Bons Momentos\r\n5. Que Situa��o\r\n6. Ca�a e Ca�ador\r\n7. Quer Dizer\r\n8. Morena da Praia\r\n9. Louca Vontade\r\n10. � Saudade\r\n11. Uma Noite e Meia\r\n12. Com Amor ', 2, 1, 'Inimigos da HP', NULL, 2, NULL, NULL, NULL),
(5, '2010-10-27', 'Bastardos Ingl�rios', 'http://2.bp.blogspot.com/_CWq0wF54ukU/SwREe7U4cEI/AAAAAAAAD1E/ReQ4-ix-LnM/s1600/Bastardos+Ingl%C3%B3rios+-+DVDRip+-+RMVB+-+Legendado', 'Durante a Segunda Guerra Mundial, grupo de soldados americanos judeus � conhecido como "The Basterds" (os bastardos). S�o eles os respons�veis por espalhar o medo e o terror no Terceiro Reich, escalpelar e assassinar brutalmente os nazistas. � nesse ambiente que eles cruzam o caminho de uma jovem judia que tem um cinema em Paris e � alvo dos soldados.', 3, 1, NULL, NULL, 1, 920, NULL, NULL),
(6, '2010-10-03', 'Aqueles c�es malditos de Arquelau', 'http://200.215.177.68/imagem/capas1/939/66939.jpg', 'Neste aclamado romance de estr�ia de Isaias Pessotti, um grupo de pesquisadores descobre na It�lia dos anos 60 um texto sobre Eur�pedes escrito pelo misterioso Bispo Vermelho, um homem, como eles, apaixonado pela arte e pelos livros. ', 1, 0, NULL, NULL, 1, 927, NULL, NULL),
(7, '2010-10-03', 'Depois da Guerra', 'http://2.bp.blogspot.com/_tRyYzw3AhCo/SfZ2_7jSOHI/AAAAAAAAAAc/sCGA1xrStoU/s400/Oficina-G3-CD-Depois-da-Guerra.jpg', '�ltimo cd do Oficina G3', 2, 0, NULL, NULL, 1, 0, NULL, NULL),
(8, '2010-10-24', 'Cidade dos Ossos', 'http://garotait.com.br/wp-content/uploads/2010/10/PROMOCAOCidade.png', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, 0, NULL, NULL, 2, 927, NULL, NULL),
(10, '2010-11-02', 'Todo garoto Tem', 'http://imagens.travessa.com.br/livro/DT/9d/9d31521d-0365-4ad5-8d1e-b83479eca82c.jpg', 'Essa era uma viagem que tinha tudo para dar certo: Holly e Mark decidem fugir para se casar numa villa do interior da It�lia, tentando evitar o stress causado pela diferen�a de religi�o entre suas fam�lias. Para acompanh�-los como madrinha, dama de honra e melhor amiga da noiva, a cartunista Jane Harris, uma mulher divertida e engra�ada que mal pode esperar pela sua primeira viagem ao exterior. Mas � claro que Mark tamb�m convidou o seu melhor amigo, o jornalista internacional Cal Langdon. J� no aeroporto, Jane e Cal sofrem de total �dio � primeira vista. Mas o que ningu�m esperava era que somente esses dois pudessem salvar o casamento de seus melhores amigos. E, nessa inesperada uni�o entre opostos, Cal e Jane acabam por descobrir que, mesmo que n�o pare�a, existe algo que todo garoto tem.', 1, 1, NULL, NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_mensagem`
-- 

CREATE TABLE `tb_mensagem` (
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
(1, 1, 2, '2010-11-01', 924, 'Era pra ter lan�ado ontem, mas ficou pra hoje! Voc� pode ganhar um exemplar de Cem Toques Cravados, o livro de Edson Rossatto que cont�m cem nanocontos para serem lidos em qualquer lugar.'),
(2, 2, 1, '2010-11-10', 924, 'A Triologia de filmes Deixados para Tr�s, alcan�ou grande sucesso pelo mundo, sendo vendidos mais de 10 milh�es de c�pias. A nova produ��o que ocorrer� em 2011 ser� um "remake" do Deixados para tr�s, e a Cloud Ten Pictures promete um or�amento '),
(3, 1, 2, '2010-11-01', 924, 'Teste de nova mensagem'),
(4, 1, 2, '2010-11-01', 278, 'Mias um teste. Troca com zero mensagens.'),
(5, 1, 2, '2010-11-02', 924, 'Vamos marcar no hall do 6� andar, ok?'),
(6, 1, 2, '2010-11-02', 927, 'Me interessei pelo seu livro Cidade dos Ossos. Est� em bom estado? Ofere�o em troca esse cl�ssico da literatura, semi-novo, comprado em dezembro de 2009. Topa?');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_troca`
-- 

CREATE TABLE `tb_troca` (
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

CREATE TABLE `tb_usuario` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Extraindo dados da tabela `tb_usuario`
-- 

INSERT INTO `tb_usuario` (`id_usuario`, `matricula`, `nome`, `sobrenome`, `data_cadastro`, `email`, `senha`, `sexo`, `fk_area`) VALUES 
(1, '111111', 'Felipe', 'Fagundes', '2010-09-08', 'felipefagundes@yahoo.com', 'senha', 'masculino', 2),
(2, '3545436656', 'Camilla', 'Jacinto', '2010-09-08', 'camillajacinto@hotmail.com', 'senha', 'feminino', 3),
(3, '200910008711', 'Francisco', 'Neto', '2010-10-03', 'chico@uerj.com.br', 'senha', 'Masculino', 2),
(4, '200912345611', 'mmm', 'jjj', '2010-10-07', 'mmm', 'nbnbnb', 'Masculino', 1);
