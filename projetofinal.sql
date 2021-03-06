-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 04-Jan-2020 às 15:51
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projetofinal`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `img_area` varchar(255) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `area`
--

INSERT INTO `area` (`id_area`, `nome`, `descricao`, `data`, `img_area`) VALUES
(5, 'Design Gráfico', 'Design Gráfico', '2019-12-26 17:50:19', 'computer.png'),
(6, 'Vídeo ', 'Vídeo ', '2019-12-26 17:50:50', 'video.png'),
(7, 'Programação', 'Programação', '2019-12-26 17:50:51', 'html-coding.png'),
(8, 'Áudio', 'Serviços de Áudio', '2020-01-03 13:39:06', 'speaker.png'),
(9, 'Fotografia', 'Serviços de Fotografia', '2020-01-03 13:57:49', 'camera.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero_utilizador`
--

DROP TABLE IF EXISTS `genero_utilizador`;
CREATE TABLE IF NOT EXISTS `genero_utilizador` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(255) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `genero_utilizador`
--

INSERT INTO `genero_utilizador` (`id_genero`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Feminino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `img_service`
--

DROP TABLE IF EXISTS `img_service`;
CREATE TABLE IF NOT EXISTS `img_service` (
  `id_img_serv` int(11) NOT NULL AUTO_INCREMENT,
  `img_serv` varchar(255) NOT NULL DEFAULT 'http://localhost/projetofinal/img/uploads/exemplo.jpg',
  `id_servico` int(11) NOT NULL,
  PRIMARY KEY (`id_img_serv`),
  KEY `fk_id_servico_img_service` (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `img_service`
--

INSERT INTO `img_service` (`id_img_serv`, `img_serv`, `id_servico`) VALUES
(2, 'http://localhost/projetofinal/img/uploads/logodesign.jpg', 19),
(10, 'http://localhost/projetofinal/img/uploads/videoinstiticional.jpg', 18),
(15, 'http://localhost/projetofinal/img/uploads/logodesign3.png', 45),
(16, 'http://localhost/projetofinal/img/uploads/logodesign2.jpg', 19),
(17, 'http://localhost/projetofinal/img/uploads/motiongraphics.jpg', 21),
(18, 'http://localhost/projetofinal/img/uploads/flyer.jpg', 17),
(19, 'http://localhost/projetofinal/img/uploads/webdesing_img.jpg', 46),
(20, 'http://localhost/projetofinal/img/uploads/fotodeproduto.jpg', 48),
(21, 'http://localhost/projetofinal/img/uploads/timeline.jpg', 49),
(24, 'http://localhost/projetofinal/img/uploads/party-flyer.png', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `preco_servico`
--

DROP TABLE IF EXISTS `preco_servico`;
CREATE TABLE IF NOT EXISTS `preco_servico` (
  `id_preco_servico` int(11) NOT NULL AUTO_INCREMENT,
  `base` int(11) NOT NULL,
  `padrao` int(11) NOT NULL,
  `premium` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  PRIMARY KEY (`id_preco_servico`),
  KEY `fk_id_servico_servico` (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `preco_servico`
--

INSERT INTO `preco_servico` (`id_preco_servico`, `base`, `padrao`, `premium`, `id_servico`) VALUES
(6, 25, 50, 75, 17),
(7, 200, 350, 500, 18),
(8, 50, 125, 200, 19),
(9, 75, 125, 200, 21),
(11, 40, 50, 60, 30),
(12, 100, 175, 250, 45),
(13, 500, 700, 1000, 46),
(15, 100, 175, 250, 48),
(16, 75, 110, 150, 49);

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisicao`
--

DROP TABLE IF EXISTS `requisicao`;
CREATE TABLE IF NOT EXISTS `requisicao` (
  `id_requisicao` int(11) NOT NULL AUTO_INCREMENT,
  `id_subarea` int(11) NOT NULL,
  `nome_projeto` varchar(50) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_utilizador` int(11) NOT NULL,
  `preco` int(11) NOT NULL,
  `img_req` varchar(255) NOT NULL DEFAULT 'http://localhost/projetofinal/img/uploads/exemplo.jpg',
  PRIMARY KEY (`id_requisicao`),
  KEY `fk_id_utilizador_req_utilizador_req` (`id_utilizador`),
  KEY `fk_id_subarea_req_subarea_req` (`id_subarea`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `requisicao`
--

INSERT INTO `requisicao` (`id_requisicao`, `id_subarea`, `nome_projeto`, `descricao`, `data`, `id_utilizador`, `preco`, `img_req`) VALUES
(1, 6, 'Auto Carlos Stand 2019', 'Criação de um logótipo para um stand de automóveis com o nome Auto Carlos.', '2020-01-04 15:45:30', 8, 200, 'http://localhost/projetofinal/img/uploads/logotipostand.png'),
(2, 7, 'Evento de Natal ', 'Criação de um flyer para um evento de natal onde  irão decorrer concertos etc.', '2020-01-04 13:16:18', 8, 100, 'http://localhost/projetofinal/img/uploads/christmasevent.jpg'),
(6, 10, 'Marca XPTO', 'Animação de Logótipo da Marca XPTO para intro do canal do Youtube.', '2020-01-04 15:49:12', 11, 100, 'http://localhost/projetofinal/img/uploads/xpto_logo.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `id_utilizador` int(11) NOT NULL,
  `id_subarea` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_servico`),
  KEY `fk_id_utilizador_utilizador` (`id_utilizador`),
  KEY `fk_id_subarea_subarea` (`id_subarea`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id_utilizador`, `id_subarea`, `data`, `id_servico`, `descricao`) VALUES
(2, 7, '2020-01-03 22:32:34', 17, 'Realização de flyers para todo o tipo de eventos.'),
(1, 9, '2020-01-03 22:33:17', 18, 'Melhore a comunicação da sua empresa através dos ví­deos instituicionais.'),
(1, 6, '2020-01-03 22:33:50', 19, 'Criação de Logótipos para vários tipos de empresas ou indivíduos.'),
(2, 12, '2020-01-03 21:13:18', 21, 'Desenvolvimento de grafismos animados.'),
(11, 7, '2020-01-04 15:40:45', 30, 'Desenvolvimento de flyers para eventos...'),
(4, 6, '2020-01-03 22:34:28', 45, 'Criação de logótipos para todos os tipos de marcas.'),
(4, 13, '2020-01-03 21:15:45', 46, 'Desenvolvimento de Websites em PHP'),
(2, 18, '2020-01-03 21:26:32', 48, 'Fotografias de Produto / Publicidade para o seu evento ou empresa. '),
(1, 11, '2020-01-04 13:05:50', 49, 'Serviço em Edição de Vídeo ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `subarea`
--

DROP TABLE IF EXISTS `subarea`;
CREATE TABLE IF NOT EXISTS `subarea` (
  `id_subarea` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_area` int(11) NOT NULL,
  `img_subarea` varchar(255) NOT NULL,
  PRIMARY KEY (`id_subarea`),
  KEY `fk_id_area_area` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `subarea`
--

INSERT INTO `subarea` (`id_subarea`, `nome`, `data`, `id_area`, `img_subarea`) VALUES
(6, 'Logotipo', '2019-12-26 18:16:48', 5, 'logo-design.png'),
(7, 'Flyer', '2019-12-26 18:16:48', 5, 'flyer-for-promotion.png'),
(8, 'Ilustração', '2019-12-26 18:16:48', 5, 'illustration.png'),
(9, 'Video Institucional', '2019-12-26 18:28:32', 6, 'video_institucional.png'),
(10, 'Animação de Logotipo', '2019-12-26 18:28:32', 6, 'logo-design.png'),
(11, 'Edição de Vídeo', '2019-12-26 18:28:32', 6, 'videoediting.png'),
(12, 'Motion Graphics', '2019-12-26 18:28:32', 6, 'motion-graphics.png'),
(13, 'Web Design', '2019-12-26 18:31:59', 7, 'web_design.png'),
(14, 'Mobile Apps', '2019-12-26 18:32:13', 7, 'mobile-app.png'),
(15, 'Produção', '2020-01-03 13:45:51', 8, 'sound-frecuency.png'),
(16, 'Mixagem e Masterização', '2020-01-03 13:45:51', 8, 'sound-faders.png'),
(17, 'Foley / Sonoplastia', '2020-01-03 13:47:08', 8, 'dubbing.png'),
(18, 'Publicidade', '2020-01-03 14:00:52', 9, 'picture.png'),
(19, 'Eventos', '2020-01-03 14:03:16', 9, 'calendar.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_utilizador`
--

DROP TABLE IF EXISTS `tipo_utilizador`;
CREATE TABLE IF NOT EXISTS `tipo_utilizador` (
  `id_tipo` int(11) NOT NULL,
  `nome_tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_utilizador`
--

INSERT INTO `tipo_utilizador` (`id_tipo`, `nome_tipo`) VALUES
(1, 'Cliente'),
(2, 'Trabalhador'),
(3, 'Cliente e Trabalhador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

DROP TABLE IF EXISTS `utilizador`;
CREATE TABLE IF NOT EXISTS `utilizador` (
  `id_utilizador` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pass` varchar(255) NOT NULL,
  `tipo_utilizador` int(11) NOT NULL,
  `biografia` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `repor_pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_utilizador`),
  UNIQUE KEY `id_area` (`id_utilizador`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_id_tipo_tipo_utilizador` (`tipo_utilizador`),
  KEY `fk_id_genero_genero_utilizador` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id_utilizador`, `username`, `nome`, `id_genero`, `email`, `data_nascimento`, `data`, `pass`, `tipo_utilizador`, `biografia`, `imagem`, `repor_pass`) VALUES
(1, 'rafaelhenriques', 'Rafael Henriques', 1, 'rafaelhenriques1993@gmail.com', '1993-10-16', '2020-01-04 15:28:42', '$2y$10$91mgWy.jEcoph.YuY7/ckerywZYyX13IFFGEp/NfYEqMWlgkQWUcC', 2, 'Estudante de Multimédia no ISMT...', 'http://localhost/projetofinal/img/uploads/rafaelhenriques.jpg', 'a38a1d64322708af4d3a07e72bad391a'),
(2, 'andreferreira', 'André Ferreira', 1, 'falcon.oficialyt@gmail.com', '1999-12-18', '2020-01-03 13:51:51', '$2y$10$wRJO8vl0haOv7SjY29dwRutPjBX9QArF3OeYIar5QEqI7OAYo1nCe', 2, 'Estudante de Multimédia no Instituto Superior Miguel Torga.', 'http://localhost/projetofinal/img/uploads/andreferreira.jpg', 'ad394df9cbcaeeb677f1648d8483fdd4'),
(4, 'sofiabarreira', 'Sofia Barreira', 2, 'sofiasbarreira@gmail.com', '1992-08-09', '2020-01-04 15:38:09', '$2y$10$QrmSsaCxzibpYURl/BjkvuUI1pN/UO3KNgCXny4VBNfZfqu38J./y', 2, 'Designer Gráfica e Web Designer...', 'http://localhost/projetofinal/img/uploads/sofiabarreira.jpg', ''),
(8, 'Carlos1999', 'Carlos Xavier', 1, 'carlos@gmail.com', '1981-07-04', '2020-01-04 15:46:23', '$2y$10$Gvbzh5a1Ifez.MAoY6xe3OnYmECs2AGyPCavtsG/dhVBwCO5p3.7e', 1, 'Negociante de Automóveis.', 'http://localhost/projetofinal/img/uploads/carlos.jpg', ''),
(11, 'sheila', 'Sheila Margarida', 2, 'sheila@gmail.com', '1987-05-15', '2020-01-04 15:46:58', '$2y$10$TAtC0Ue/Ts0pmqqq5N7LjusWdGfo4PV0Fqz.Nkl4a3.Q/UYNOsnBi', 3, 'Designer Gráfica em Part-Time...', 'http://localhost/projetofinal/img/uploads/sheila.jpg', '');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `img_service`
--
ALTER TABLE `img_service`
  ADD CONSTRAINT `fk_id_servico_img_service` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`);

--
-- Limitadores para a tabela `preco_servico`
--
ALTER TABLE `preco_servico`
  ADD CONSTRAINT `fk_id_servico_servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `requisicao`
--
ALTER TABLE `requisicao`
  ADD CONSTRAINT `fk_id_subarea_req_subarea_req` FOREIGN KEY (`id_subarea`) REFERENCES `subarea` (`id_subarea`),
  ADD CONSTRAINT `fk_id_utilizador_req_utilizador_req` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`);

--
-- Limitadores para a tabela `servico`
--
ALTER TABLE `servico`
  ADD CONSTRAINT `fk_id_subarea_subarea` FOREIGN KEY (`id_subarea`) REFERENCES `subarea` (`id_subarea`),
  ADD CONSTRAINT `fk_id_utilizador_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`);

--
-- Limitadores para a tabela `subarea`
--
ALTER TABLE `subarea`
  ADD CONSTRAINT `fk_id_area_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);

--
-- Limitadores para a tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD CONSTRAINT `fk_id_genero_genero_utilizador` FOREIGN KEY (`id_genero`) REFERENCES `genero_utilizador` (`id_genero`),
  ADD CONSTRAINT `fk_id_tipo_tipo_utilizador` FOREIGN KEY (`tipo_utilizador`) REFERENCES `tipo_utilizador` (`id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
