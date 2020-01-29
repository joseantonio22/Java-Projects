-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2018 at 05:52 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apartamentos`
--

-- --------------------------------------------------------

--
-- Table structure for table `chalet`
--

CREATE TABLE `chalet` (
  `idTipoVivienda` int(11) NOT NULL,
  `jardin` tinyint(1) NOT NULL,
  `plantas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chalet`
--

INSERT INTO `chalet` (`idTipoVivienda`, `jardin`, `plantas`) VALUES
(2, 0, 0),
(4, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `dni`, `direccion`, `ciudad`, `activo`) VALUES
(1, 'Yelim', '1234', 'Madrid', 'Madrid', 1),
(2, 'Adrián', '5678', 'Madrid', 'Madrid', 1),
(3, 'Jose', '9101', 'Madrid', 'Madrid', 1),
(4, 'Eduardo', '1112', 'Madrid', 'Madrid', 1),
(5, 'Pache', '1314', 'Madrid', 'Madrid', 1),
(6, 'Irene', '1516', 'Madrid', 'Madrid', 1);

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compra`
--

INSERT INTO `compra` (`idCompra`, `idCliente`, `fecha`, `activo`) VALUES
(1, 1, '2018-10-15', 1),
(2, 6, '2018-10-18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lineacompra`
--

CREATE TABLE `lineacompra` (
  `idCompra` int(11) NOT NULL,
  `idTipoVivienda` int(11) NOT NULL,
  `cantidadComprada` int(11) NOT NULL,
  `precioTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lineacompra`
--

INSERT INTO `lineacompra` (`idCompra`, `idTipoVivienda`, `cantidadComprada`, `precioTotal`) VALUES
(1, 4, 30, 15000),
(2, 4, 60, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `piso`
--

CREATE TABLE `piso` (
  `idTipoVivienda` int(11) NOT NULL,
  `portero` tinyint(1) NOT NULL,
  `numAscensores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `piso`
--

INSERT INTO `piso` (`idTipoVivienda`, `portero`, `numAscensores`) VALUES
(1, 0, 0),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipovivienda`
--

CREATE TABLE `tipovivienda` (
  `idTipoVivienda` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipovivienda`
--

INSERT INTO `tipovivienda` (`idTipoVivienda`, `direccion`, `ciudad`, `cantidad`, `precio`, `activo`) VALUES
(1, 'Atocha', 'Madrid', 200, 250, 1),
(2, 'Moncloa', 'Madrid', 300, 301, 1),
(3, 'La Latina', 'Madrid', 450, 42, 1),
(4, 'RIVAS', 'Madrid', 800, 500, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chalet`
--
ALTER TABLE `chalet`
  ADD PRIMARY KEY (`idTipoVivienda`),
  ADD UNIQUE KEY `idTipoVivienda` (`idTipoVivienda`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`,`nombre`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`,`idCliente`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indexes for table `lineacompra`
--
ALTER TABLE `lineacompra`
  ADD PRIMARY KEY (`idCompra`,`idTipoVivienda`),
  ADD KEY `idTipoVivienda` (`idTipoVivienda`);

--
-- Indexes for table `piso`
--
ALTER TABLE `piso`
  ADD PRIMARY KEY (`idTipoVivienda`),
  ADD UNIQUE KEY `idTipoVivienda` (`idTipoVivienda`);

--
-- Indexes for table `tipovivienda`
--
ALTER TABLE `tipovivienda`
  ADD PRIMARY KEY (`idTipoVivienda`),
  ADD UNIQUE KEY `direccion` (`direccion`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipovivienda`
--
ALTER TABLE `tipovivienda`
  MODIFY `idTipoVivienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chalet`
--
ALTER TABLE `chalet`
  ADD CONSTRAINT `chalet_ibfk_1` FOREIGN KEY (`idTipoVivienda`) REFERENCES `tipovivienda` (`idTipoVivienda`);

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Constraints for table `lineacompra`
--
ALTER TABLE `lineacompra`
  ADD CONSTRAINT `lineacompra_ibfk_1` FOREIGN KEY (`idTipoVivienda`) REFERENCES `tipovivienda` (`idTipoVivienda`),
  ADD CONSTRAINT `lineacompra_ibfk_2` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`);

--
-- Constraints for table `piso`
--
ALTER TABLE `piso`
  ADD CONSTRAINT `piso_ibfk_1` FOREIGN KEY (`idTipoVivienda`) REFERENCES `tipovivienda` (`idTipoVivienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
