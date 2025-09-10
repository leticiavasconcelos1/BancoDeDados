-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/09/2025 às 23:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atividade_estacionamento`
--
CREATE DATABASE IF NOT EXISTS `atividade_estacionamento` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `atividade_estacionamento`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `andar`
--

CREATE TABLE `andar` (
  `codLugar` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `andar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `andar`
--

INSERT INTO `andar` (`codLugar`, `capacidade`, `andar`) VALUES
(1, 50, 'Subsolo 1'),
(2, 30, 'Subsolo 2'),
(3, 40, 'Térreo'),
(4, 35, 'Subsolo 3'),
(5, 25, 'Cobertura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `dtnasc` datetime DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `cpf`, `dtnasc`, `nome`) VALUES
(1, '123.456.789-00', '1985-03-15 00:00:00', 'João'),
(2, '987.654.321-00', '1990-07-22 00:00:00', 'Maria'),
(3, '456.789.123-00', '1975-12-05 00:00:00', 'Carlos'),
(4, '123.456.789-00', '1985-03-15 00:00:00', 'João'),
(5, '987.654.321-00', '1990-07-22 00:00:00', 'Maria'),
(6, '456.789.123-00', '1975-12-05 00:00:00', 'Carlos'),
(7, '321.654.987-11', '1992-11-30 00:00:00', 'Fernanda'),
(8, '741.852.963-22', '1988-04-10 00:00:00', 'Rafael');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estaciona`
--

CREATE TABLE `estaciona` (
  `cod` int(11) NOT NULL,
  `horsaida` datetime DEFAULT NULL,
  `dtentrada` date DEFAULT NULL,
  `horentrada` datetime DEFAULT NULL,
  `dtsaida` date DEFAULT NULL,
  `cod_veiculo` int(11) DEFAULT NULL,
  `codlugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estaciona`
--

INSERT INTO `estaciona` (`cod`, `horsaida`, `dtentrada`, `horentrada`, `dtsaida`, `cod_veiculo`, `codlugar`) VALUES
(4, '2025-09-01 18:00:00', '2025-09-01', '2025-09-01 08:00:00', '2025-09-01', 14, 1),
(5, '2025-09-02 19:00:00', '2025-09-02', '2025-09-02 09:00:00', '2025-09-02', 15, 2),
(6, '2025-09-02 20:00:00', '2025-09-02', '2025-09-02 10:00:00', '2025-09-02', 16, 3),
(7, '2025-09-02 17:30:00', '2025-09-02', '2025-09-02 08:15:00', '2025-09-02', 17, 4),
(8, '2025-09-02 18:45:00', '2025-09-02', '2025-09-02 09:30:00', '2025-09-02', 18, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `codmodelo` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `modelo`
--

INSERT INTO `modelo` (`codmodelo`, `modelo`, `ano`) VALUES
(1, 'Fiat Uno', 2006),
(2, 'Chevrolet Onix', 1998),
(3, 'Volkswagen Gol', 2010),
(4, 'Fiat Uno', 2006),
(5, 'Chevrolet Onix', 1998),
(6, 'Volkswagen Gol', 2010),
(7, 'Toyota Corolla', 2000),
(8, 'Fiat Uno', 2006);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `cod_veiculo` int(11) NOT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `cod_cliente` int(11) DEFAULT NULL,
  `codmodelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`cod_veiculo`, `placa`, `cor`, `cod_cliente`, `codmodelo`) VALUES
(14, 'ABC-1234', 'Preto', 1, 1),
(15, 'DEF-5678', 'rosa', 2, 2),
(16, 'GHI-9012', 'Prata', 3, 3),
(17, 'JKL-3456', 'Vermelho', 4, 4),
(18, 'MNO-7890', 'Azul', 5, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`codLugar`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices de tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `cod_veiculo` (`cod_veiculo`),
  ADD KEY `codlugar` (`codlugar`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codmodelo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`cod_veiculo`),
  ADD KEY `cod_cliente` (`cod_cliente`),
  ADD KEY `codmodelo` (`codmodelo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andar`
--
ALTER TABLE `andar`
  MODIFY `codLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `estaciona`
--
ALTER TABLE `estaciona`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `codmodelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `cod_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`cod_veiculo`) REFERENCES `veiculo` (`cod_veiculo`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`codlugar`) REFERENCES `andar` (`codLugar`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`codmodelo`) REFERENCES `modelo` (`codmodelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
