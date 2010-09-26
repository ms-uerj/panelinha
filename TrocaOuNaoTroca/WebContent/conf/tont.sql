--- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost:3306
-- Tempo de Geração: Set 25, 2010 as 10:56 PM
-- Versão do Servidor: 5.0.41
-- Versão do PHP: 5.2.3

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
(3, 'Biológicas');

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
  `id_item` int(11) NOT NULL,
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
  PRIMARY KEY  (`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `tb_item`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_troca`
-- 

CREATE TABLE `tb_troca` (
  `id_troca` int(11) NOT NULL,
  `fk_user_1` int(11) NOT NULL,
  `fk_user_2` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `data_fim` date default NULL,
  `fk_status` int(11) NOT NULL,
  PRIMARY KEY  (`id_troca`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `tb_troca`
-- 


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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `tb_usuario`
-- 

INSERT INTO `tb_usuario` (`id_usuario`, `matricula`, `nome`, `sobrenome`, `data_cadastro`, `email`, `senha`, `sexo`, `fk_area`) VALUES 
(1, '32143434', 'Felipe', 'Fagundes', '2010-09-08', 'felipefagundes@yahoo.com', 'senha', 'masculino', 2);