-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-08-2024 a las 20:06:36
-- Versión del servidor: 9.0.1
-- Versión de PHP: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectologisticoo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `ID_Comprobante` int NOT NULL,
  `Fecha` date NOT NULL,
  `Pago` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `ID_Contrato` int NOT NULL,
  `ID_PaqueteFinal` int NOT NULL,
  `ID_Comprobante` int NOT NULL,
  `NombContrato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `ID_Destino` int NOT NULL,
  `Destino` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetefinal`
--

CREATE TABLE `paquetefinal` (
  `ID_PaqueteFinal` int NOT NULL,
  `ID_Prototipo` int NOT NULL,
  `Descripcion` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prototipo`
--

CREATE TABLE `prototipo` (
  `ID_Prototipo` int NOT NULL,
  `ID_PrototipoProveedor` int NOT NULL,
  `ID_Destino` int NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prototipo_destino`
--

CREATE TABLE `prototipo_destino` (
  `ID_PrototipoDestino` int NOT NULL,
  `ID_Destino` int NOT NULL,
  `ID_Prototipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prototipo_proveedor`
--

CREATE TABLE `prototipo_proveedor` (
  `ID_PrototipoProveedor` int NOT NULL,
  `ID_Proveedor` int NOT NULL,
  `ID_Prototipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Contacto` varchar(50) NOT NULL,
  `Disponibilidad` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_servicio`
--

CREATE TABLE `proveedor_servicio` (
  `ID_ProveedorServicio` int NOT NULL,
  `ID_Proveedor` int NOT NULL,
  `ID_Servicio` int NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_Servicio` int NOT NULL,
  `Servicio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL,
  `NombreUsu` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `Puesto` varchar(25) NOT NULL,
  `ContraseñaTemp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `NombreUsu`, `Nombre`, `Apellido`, `Contraseña`, `Puesto`, `ContraseñaTemp`) VALUES
(1, 'Eduardo Rumay', 'Eduardo', 'Rumay', 'R1542', 'Administrador', '**********'),
(2, 'Rodrigo Agreda', 'Rodrigo', 'Agreda', 'A2310', 'Coordinador', '**********'),
(3, 'Charlie Benites', 'Charlie', 'Benites', 'B2704', 'Evaluador', '**********');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_prototipo`
--

CREATE TABLE `usuario_prototipo` (
  `ID_UsuarioPrototipo` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `ID_Prototipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`ID_Comprobante`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`ID_Contrato`),
  ADD KEY `ID_PaqueteFinal` (`ID_PaqueteFinal`),
  ADD KEY `ID_Comprobante` (`ID_Comprobante`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`ID_Destino`);

--
-- Indices de la tabla `paquetefinal`
--
ALTER TABLE `paquetefinal`
  ADD PRIMARY KEY (`ID_PaqueteFinal`),
  ADD KEY `ID_PrototipoProveedor` (`ID_Prototipo`),
  ADD KEY `ID_Prototipo` (`ID_Prototipo`);

--
-- Indices de la tabla `prototipo`
--
ALTER TABLE `prototipo`
  ADD PRIMARY KEY (`ID_Prototipo`),
  ADD KEY `ID_PrototipoProveedor` (`ID_PrototipoProveedor`),
  ADD KEY `ID_Destino` (`ID_Destino`);

--
-- Indices de la tabla `prototipo_destino`
--
ALTER TABLE `prototipo_destino`
  ADD PRIMARY KEY (`ID_PrototipoDestino`),
  ADD KEY `ID_Prototipo` (`ID_Prototipo`),
  ADD KEY `ID_Destino` (`ID_Destino`);

--
-- Indices de la tabla `prototipo_proveedor`
--
ALTER TABLE `prototipo_proveedor`
  ADD PRIMARY KEY (`ID_PrototipoProveedor`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Prototipo` (`ID_Prototipo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `proveedor_servicio`
--
ALTER TABLE `proveedor_servicio`
  ADD PRIMARY KEY (`ID_ProveedorServicio`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Servicio` (`ID_Servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_Servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- Indices de la tabla `usuario_prototipo`
--
ALTER TABLE `usuario_prototipo`
  ADD PRIMARY KEY (`ID_UsuarioPrototipo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Prototipo` (`ID_Prototipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `ID_Comprobante` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `ID_Contrato` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `destino`
--
ALTER TABLE `destino`
  MODIFY `ID_Destino` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquetefinal`
--
ALTER TABLE `paquetefinal`
  MODIFY `ID_PaqueteFinal` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prototipo`
--
ALTER TABLE `prototipo`
  MODIFY `ID_Prototipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prototipo_destino`
--
ALTER TABLE `prototipo_destino`
  MODIFY `ID_PrototipoDestino` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prototipo_proveedor`
--
ALTER TABLE `prototipo_proveedor`
  MODIFY `ID_PrototipoProveedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID_Proveedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor_servicio`
--
ALTER TABLE `proveedor_servicio`
  MODIFY `ID_ProveedorServicio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_Servicio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario_prototipo`
--
ALTER TABLE `usuario_prototipo`
  MODIFY `ID_UsuarioPrototipo` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`ID_PaqueteFinal`) REFERENCES `paquetefinal` (`ID_PaqueteFinal`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`ID_Comprobante`) REFERENCES `comprobante` (`ID_Comprobante`);

--
-- Filtros para la tabla `paquetefinal`
--
ALTER TABLE `paquetefinal`
  ADD CONSTRAINT `paquetefinal_ibfk_1` FOREIGN KEY (`ID_Prototipo`) REFERENCES `prototipo` (`ID_Prototipo`);

--
-- Filtros para la tabla `prototipo`
--
ALTER TABLE `prototipo`
  ADD CONSTRAINT `prototipo_ibfk_1` FOREIGN KEY (`ID_PrototipoProveedor`) REFERENCES `prototipo_proveedor` (`ID_PrototipoProveedor`);

--
-- Filtros para la tabla `prototipo_destino`
--
ALTER TABLE `prototipo_destino`
  ADD CONSTRAINT `prototipo_destino_ibfk_1` FOREIGN KEY (`ID_Prototipo`) REFERENCES `prototipo` (`ID_Prototipo`),
  ADD CONSTRAINT `prototipo_destino_ibfk_2` FOREIGN KEY (`ID_Destino`) REFERENCES `destino` (`ID_Destino`);

--
-- Filtros para la tabla `prototipo_proveedor`
--
ALTER TABLE `prototipo_proveedor`
  ADD CONSTRAINT `prototipo_proveedor_ibfk_1` FOREIGN KEY (`ID_Prototipo`) REFERENCES `prototipo` (`ID_Prototipo`);

--
-- Filtros para la tabla `proveedor_servicio`
--
ALTER TABLE `proveedor_servicio`
  ADD CONSTRAINT `proveedor_servicio_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`),
  ADD CONSTRAINT `proveedor_servicio_ibfk_2` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicio` (`ID_Servicio`);

--
-- Filtros para la tabla `usuario_prototipo`
--
ALTER TABLE `usuario_prototipo`
  ADD CONSTRAINT `usuario_prototipo_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`),
  ADD CONSTRAINT `usuario_prototipo_ibfk_2` FOREIGN KEY (`ID_Prototipo`) REFERENCES `prototipo` (`ID_Prototipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
