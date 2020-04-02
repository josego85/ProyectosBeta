-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-07-2016 a las 12:58:16
-- Versión del servidor: 5.5.49-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `puntos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenadas`
--

CREATE TABLE IF NOT EXISTS `coordenadas` (
  `id` smallint(5) unsigned NOT NULL,
  `longitud` char(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `latitud` char(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  UNIQUE KEY `category_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `coordenadas`
--

INSERT INTO `coordenadas` (`id`, `longitud`, `latitud`) VALUES
(1, '-57.1209129', '-25.9961407'),
(2, '-57.8977', '-25.34556'),
(3, '-57.458977', '-25.3456556');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
