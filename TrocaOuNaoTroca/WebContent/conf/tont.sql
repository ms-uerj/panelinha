-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost:3306
-- Tempo de Gera��o: Out 03, 2010 as 12:30 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Extraindo dados da tabela `tb_item`
-- 

INSERT INTO `tb_item` (`id_item`, `data_cadastro`, `titulo`, `imagem`, `descricao`, `fk_categoria`, `status`, `autor`, `editora`, `fk_usuario`, `fk_troca`, `edicao`, `genero`) VALUES 
(1, '2010-09-24', 'Deixados para tr�s', 'http://files.tyndale.com/thpdata/images--covers/119_w/978-0-8423-2911-8.gif', 'Em um instante catacl�smico, milh�es de pessoas de todas as partes do mundo desapareceram. Simplesmente sumiram, deixando para tr�s tudo o que era material: roupas, �culos, lentes de contato, cabelos posti�os, aparelhos de surdez, pr�teses, j�ias, sapatos e at� mesmo marca passos e pinos cir�rgicos. Milh�es de pessoas sumiram. Mas outros milh�es ficaram - alguns adultos, por�m n�o crian�as, e apenas alguns adolescentes. Todos os beb�s, inclusive os que estavam para nascer, desapareceram � alguns durante o parto. Instalou-se o caos no mundo inteiro. Avi�es, trens, �nibus e carros colidiram, navios afundaram, casas incendiaram, sobreviventes acometidos de ang�stia suicidaram-se. Um congestionamento de transportes e linhas de comunica��o, somado ao desaparecimento de in�meros funcion�rios, deixou a maioria das pessoas lutando sozinhas para sobreviverem at� que a situa��o come�asse a se normalizar.', 1, 1, 'Tim Lahaye', NULL, 1, 631, '1�', NULL),
(2, '2010-09-07', 'O Fim do Jogo', 'http://livrosgratis.net/upload/capas/fim_do_jogo.jpg', 'Frank Peretti e Tedd Dekker - dois dos mais aclamados escritores de thrillers sobrenaturais - uniram-se para escrever FIM DE JOGO. Numa casa assustadora, sete jogadores participam de um jogo mortal. H� apenas 3 regras que n�o fazem sentido algum, exceto para um serial killer. Ao longo do jogo, percebe-se que a �nica forma de vencer � perder e a �nica forma de sair � entrar...', 1, 1, 'Frank Peretti', NULL, 1, 631, '1�', NULL),
(3, '2010-09-30', 'Emanuel', 'http://baugospel.com.br/wp-content/uploads/2010/09/nivea-soares-emanuel.jpg', 'O novo CD da Cantora N�vea Soares � demais. S�o treze can��es totalmente in�ditas de um trabalho que j� esta nas lojas de todo o Brasil. O t�o esperado CD Emanuel de N�vea Soares foi gravado por Gustavo Soares, no est�dio e-music, em Belo Horizonte.', 2, 1, 'N�vea Soares', NULL, 2, 631, NULL, NULL),
(4, '2010-10-14', 'Inimigos da HP - ao vivo', 'http://www.concamusic.com.br/images/CD%20INIMIGOS%20DA%20HP%20-%20E%20QUEM%20NAO%20GOSTA%20DO%20INIMIGOS.jpg', '1. A Musa da Praia\r\n2. Brilho de Cristal\r\n3. Escondida\r\n4. Bons Momentos\r\n5. Que Situa��o\r\n6. Ca�a e Ca�ador\r\n7. Quer Dizer\r\n8. Morena da Praia\r\n9. Louca Vontade\r\n10. � Saudade\r\n11. Uma Noite e Meia\r\n12. Com Amor ', 2, 1, 'Inimigos da HP', NULL, 2, 171, NULL, NULL),
(5, '2010-10-27', 'Bastardos Ingl�rios', 'http://2.bp.blogspot.com/_CWq0wF54ukU/SwREe7U4cEI/AAAAAAAAD1E/ReQ4-ix-LnM/s1600/Bastardos+Ingl%C3%B3rios+-+DVDRip+-+RMVB+-+Legendado', 'Durante a Segunda Guerra Mundial, grupo de soldados americanos judeus � conhecido como "The Basterds" (os bastardos). S�o eles os respons�veis por espalhar o medo e o terror no Terceiro Reich, escalpelar e assassinar brutalmente os nazistas. � nesse ambiente que eles cruzam o caminho de uma jovem judia que tem um cinema em Paris e � alvo dos soldados.', 3, 1, NULL, NULL, 1, 171, NULL, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_mensagem`
-- 


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
  PRIMARY KEY  (`id_troca`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=632 ;

-- 
-- Extraindo dados da tabela `tb_troca`
-- 

INSERT INTO `tb_troca` (`id_troca`, `fk_user_1`, `fk_user_2`, `data_pedido`, `data_fim`, `fk_status`) VALUES 
(460, 1, 2, '2010-10-03', NULL, 1),
(171, 1, 2, '2010-10-03', NULL, 1),
(631, 1, 2, '2010-10-02', NULL, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `tb_usuario`
-- 

INSERT INTO `tb_usuario` (`id_usuario`, `matricula`, `nome`, `sobrenome`, `data_cadastro`, `email`, `senha`, `sexo`, `fk_area`) VALUES 
(1, '111111', 'Felipe', 'Fagundes', '2010-09-08', 'felipefagundes@yahoo.com', 'senha', 'masculino', 2),
(2, '3545436656', 'Camilla', 'Jacinto', '2010-09-08', 'camillajacinto@hotmail.com', 'senha', 'feminino', 3);