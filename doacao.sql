-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 17/05/2014 às 14:18
-- Versão do servidor: 5.5.37-0ubuntu0.13.10.1
-- Versão do PHP: 5.5.3-1ubuntu2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `doacao`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `brinquedo`
--

CREATE TABLE IF NOT EXISTS `brinquedo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) DEFAULT NULL,
  `material` varchar(256) DEFAULT NULL,
  `idade_min` int(11) DEFAULT NULL,
  `idade_max` int(11) DEFAULT NULL,
  `para_sexo` char(1) DEFAULT NULL,
  `id_doador` int(11) DEFAULT NULL,
  `id_organizador` int(11) DEFAULT NULL,
  `estado_conservacao` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_doador` (`id_doador`),
  KEY `id_organizador` (`id_organizador`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Fazendo dump de dados para tabela `brinquedo`
--

INSERT INTO `brinquedo` (`id`, `nome`, `material`, `idade_min`, `idade_max`, `para_sexo`, `id_doador`, `id_organizador`, `estado_conservacao`) VALUES
(1, 'Boneca Barbie', NULL, 3, NULL, 'F', 1, NULL, 'ó'),
(2, 'Boneca Barbie', NULL, 3, NULL, 'F', 1, NULL, 'b');

-- --------------------------------------------------------

--
-- Estrutura para tabela `crianca`
--

CREATE TABLE IF NOT EXISTS `crianca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `id_responsavel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `doacao`
--

CREATE TABLE IF NOT EXISTS `doacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_responsavel` int(11) DEFAULT NULL,
  `id_crianca` int(11) DEFAULT NULL,
  `id_brinquedo` int(11) DEFAULT NULL,
  `id_organizador` int(11) DEFAULT NULL,
  `data_hora_reserva` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_hora_entrega` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_responsavel` (`id_responsavel`),
  KEY `id_crianca` (`id_crianca`),
  KEY `id_brinquedo` (`id_brinquedo`),
  KEY `id_organizador` (`id_organizador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `doador`
--

CREATE TABLE IF NOT EXISTS `doador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` char(14) DEFAULT NULL,
  `nome` varchar(256) DEFAULT NULL,
  `endereco` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `doador`
--

INSERT INTO `doador` (`id`, `cpf`, `nome`, `endereco`, `email`, `telefone`) VALUES
(1, '096.753.468-­1', 'Charlote Silva', 'R. Rio Branco 111, apto 123', 'charlote@silva.com.br', '(21) 5627­-8765');

-- --------------------------------------------------------

--
-- Estrutura para tabela `organizador`
--

CREATE TABLE IF NOT EXISTS `organizador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `login` varchar(64) DEFAULT NULL,
  `senha` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `responsavel`
--

CREATE TABLE IF NOT EXISTS `responsavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) DEFAULT NULL,
  `nome` varchar(256) DEFAULT NULL,
  `endereco` varchar(256) DEFAULT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `brinquedo`
--
ALTER TABLE `brinquedo`
  ADD CONSTRAINT `brinquedo_ibfk_1` FOREIGN KEY (`id_doador`) REFERENCES `doador` (`id`),
  ADD CONSTRAINT `brinquedo_ibfk_2` FOREIGN KEY (`id_organizador`) REFERENCES `organizador` (`id`);

--
-- Restrições para tabelas `crianca`
--
ALTER TABLE `crianca`
  ADD CONSTRAINT `crianca_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id`);

--
-- Restrições para tabelas `doacao`
--
ALTER TABLE `doacao`
  ADD CONSTRAINT `doacao_ibfk_1` FOREIGN KEY (`id_responsavel`) REFERENCES `responsavel` (`id`),
  ADD CONSTRAINT `doacao_ibfk_2` FOREIGN KEY (`id_crianca`) REFERENCES `crianca` (`id`),
  ADD CONSTRAINT `doacao_ibfk_3` FOREIGN KEY (`id_brinquedo`) REFERENCES `brinquedo` (`id`),
  ADD CONSTRAINT `doacao_ibfk_4` FOREIGN KEY (`id_organizador`) REFERENCES `organizador` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
