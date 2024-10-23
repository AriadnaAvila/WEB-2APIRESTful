-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-10-2024 a las 22:27:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tienda_ropa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `imagen_categoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `imagen_categoria`) VALUES
(11, 'Buzos', 'https://tiendaverde.com.co//img/1.%20Buzos.png'),
(12, 'Remeras', 'https://img.freepik.com/foto-gratis/camiseta-azul-simboliza-patriotismo-estadounidense-exito-generado-ia_188544-42177.jpg'),
(13, 'Camperas', 'https://acdn.mitiendanube.com/stores/001/402/728/categories/header-camperas-1683ecee3a9275e08416212624872426-1920-19201-e2633eb01e6635a96916497758013062-1024-1024.jpeg'),
(14, 'Pantalones', 'https://euromodapr.com/a/l/es/cdn/shop/collections/collectionbanners_BRAX.jpg?v=1564161721&width=2794'),
(15, 'Accesorios', 'https://cdn.pixabay.com/photo/2016/06/25/12/50/handbag-1478814_640.jpg'),
(16, 'Zapatillas', 'https://cdn.accentuate.io/237875658911/1691657479266/FW24_Collection_Banner_Template-A_Chacrona_Woman.jpg?v=1723041878044'),
(20, 'Tops', 'https://www.goldietees.com/cdn/shop/files/banner_1f98df94-63df-490a-bc3c-a046aa0b6ca3.jpg?v=1724263882&width=3200'),
(25, 'Gorras', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtU2ef-EzgwhLrqZ0p7HL5T75JAA6vDUJG8g&s');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion`
--

CREATE TABLE `informacion` (
  `id_informacion` int(11) NOT NULL,
  `talle` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion`
--

INSERT INTO `informacion` (`id_informacion`, `talle`, `color`, `stock`, `id_producto`) VALUES
(1, 'L', 'Negro', 34, 1),
(2, '44', 'Verde', 42, 2),
(3, 'L', 'Negro', 34, 1),
(4, 'L', 'Negro', 15, 2),
(5, 'XL', 'Gris', 10, 3),
(6, 'M', 'Rojo', 25, 4),
(7, 'S', 'Verde', 30, 5),
(8, 'M', 'Blanco', 18, 6),
(9, 'L', 'Azul claro', 12, 7),
(10, 'S', 'Amarillo', 22, 8),
(11, 'M', 'Verde oscuro', 16, 9),
(12, 'L', 'Rosa', 14, 10),
(13, '32', 'Indigo', 20, 11),
(14, '34', 'Caqui', 12, 12),
(15, '36', 'Negro', 10, 13),
(16, '38', 'Gris claro', 15, 14),
(17, '40', 'Verde militar', 20, 15),
(18, 'M', 'Marrón', 25, 16),
(19, 'M', 'Negro', 18, 17),
(20, 'L', 'Azul', 22, 18),
(21, 'L', 'Verde', 14, 19),
(22, 'M', 'Naranja', 20, 20),
(23, 'S', 'Gris', 30, 21),
(24, 'M', 'Rojo', 25, 22),
(25, 'M', 'Negro', 15, 23),
(26, '38', 'Beige', 10, 24),
(27, '36', 'Verde claro', 12, 25),
(29, '32', 'Gris claro', 10, 27),
(30, '40', 'Rojo', 20, 28),
(31, '42', 'Verde oscuro', 14, 29),
(32, '44', 'Negro', 22, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(50) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `fecha_pedido`, `estado`, `total`) VALUES
(1, '2024-10-23 20:26:54', 'Pendiente', 2500),
(2, '2024-10-23 20:26:54', 'Completado', 3200),
(3, '2024-10-23 20:26:54', 'Enviado', 1200),
(4, '2024-10-23 20:26:54', 'Cancelado', 1500),
(5, '2024-10-23 20:26:54', 'Pendiente', 2700),
(6, '2024-10-23 20:26:54', 'Completado', 3500),
(7, '2024-10-23 20:26:54', 'Enviado', 2200),
(8, '2024-10-23 20:26:54', 'Cancelado', 1800),
(9, '2024-10-23 20:26:54', 'Pendiente', 1300),
(10, '2024-10-23 20:26:54', 'Completado', 4000),
(11, '2024-10-23 20:26:54', 'Pendiente', 2400),
(12, '2024-10-23 20:26:54', 'Enviado', 2100),
(13, '2024-10-23 20:26:54', 'Completado', 3300),
(14, '2024-10-23 20:26:54', 'Cancelado', 500),
(15, '2024-10-23 20:26:54', 'Pendiente', 2900),
(16, '2024-10-23 20:26:54', 'Enviado', 1600),
(17, '2024-10-23 20:26:54', 'Completado', 2800),
(18, '2024-10-23 20:26:54', 'Cancelado', 1000),
(19, '2024-10-23 20:26:54', 'Pendiente', 3400),
(20, '2024-10-23 20:26:54', 'Enviado', 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `precio` int(12) NOT NULL,
  `imagen_producto` varchar(255) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `tipo`, `precio`, `imagen_producto`, `id_categoria`) VALUES
(1, 'Buzo oversize estampado', 45999, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwW2vOoYnZQTEWi0PxkVECzDprXdhSN_G5Vw&s', 11),
(2, 'Pantalon cargo gabardina', 39500, 'https://www.devre.la/media/catalog/product/d/e/devre-pantalon_16d000083-008_002_1.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=1350&width=900&canvas=900:1350', 14),
(3, 'Buzo de algodón', 43999, 'https://acdn.mitiendanube.com/stores/001/268/672/products/buzo-algodon-friza-gris-talle-xl1-8858aaca4312c509cc16142657542023-640-0.jpg', 11),
(4, 'Buzo con capucha', 52499, 'https://dcdn.mitiendanube.com/stores/002/140/898/products/whatsapp-image-2022-04-28-at-6-26-47-pm-21-89cfd3ed2d28a7f9af16513443631448-640-0.jpeg', 11),
(5, 'Buzo oversize', 59999, 'https://http2.mlstatic.com/D_NQ_NP_860292-MLA74970373988_032024-O.webp', 11),
(6, 'Buzo de rayas', 49499, 'https://rivercaves.com/wp-content/uploads/2022/04/Buzo-Rayas-Blanca-Negra-River-Caves-600x600.jpg', 11),
(7, 'Buzo estampado', 56999, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx4IRvXZfinPYUgaPubn1vfIPjI_sHAlcIdg&s', 11),
(8, 'Remera básica', 29999, 'https://acdn.mitiendanube.com/stores/805/809/products/1024-remera-67547b302e9478512717049836415864-640-0.png', 12),
(9, 'Remera de manga corta', 37499, 'https://www.cottonclub.com.ar/media/catalog/product/cache/65e2670acbf1788249a95924f3789a80/0/2/025ar_verde_colegial_8.jpg', 12),
(10, 'Remera de manga larga', 40499, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPYkOM-FmSavSY4bdYtWE9RKk6Vvy86m7gsw&s', 12),
(11, 'Remera gráfica', 43499, 'https://indigografica.com.ar/wp-content/uploads/2022/12/Diseno-sin-titulo-6-600x600.jpg', 12),
(12, 'Remera de algodón orgánico', 47999, 'https://f.fcdn.app/imgs/2a5287/aventureros.com.uy/avenuy/7e90/original/catalogo/RE002_Caqui_1/2000-2000/remera-de-algodon-caqui.jpg', 12),
(13, 'Pantalón de jean', 59999, 'https://acdn.mitiendanube.com/stores/001/343/531/products/whatsapp_image_2023-10-03_at_11-26-43_3-279e03d05aba9eaf1416966189928988-640-0.jpeg', 14),
(14, 'Pantalón chino', 52499, 'https://acdn.mitiendanube.com/stores/001/218/661/products/16129-37-21-8130c646bb4fc8156016460098573939-1024-1024.jpg', 14),
(15, 'Pantalón deportivo', 41999, 'https://background.com.ar/wp-content/uploads/2020/02/jogging_jogger_pantalon_verde_militar.png', 14),
(16, 'Pantalón de lino', 49499, 'https://acdn.mitiendanube.com/stores/001/294/644/products/7ac4afb4-f2e9-47fb-bd58-4a985a9deea01-156bb06141af4147d416713165312906-1024-1024.jpeg', 14),
(17, 'Pantalón cargo', 59999, 'https://acdn.mitiendanube.com/stores/001/122/213/products/3aed032c-e251-405f-acad-9dde3e9a58ab-11e5d1e83e75645a7717171022894980-1024-1024.jpeg', 14),
(18, 'Campera de cuero', 119999, 'https://http2.mlstatic.com/D_793939-MLA54244919675_032023-O.jpg', 13),
(19, 'Campera de abrigo', 127499, 'https://www.moha.com.ar/producto/1-65-204-35/md/MOH_0602.jpg', 13),
(20, 'Campera bomber', 74999, 'https://acdn.mitiendanube.com/stores/001/007/739/products/815938a4-5db5-49c2-8752-a91dd11712f41-1d0db85593053cd8af16804672287735-240-0.jpeg', 13),
(21, 'Campera impermeable', 86999, 'https://d368r8jqz0fwvm.cloudfront.net/49779-product_lg/campera-impermeable-nanotech-h.jpg', 13),
(22, 'Campera de mezclilla', 59999, 'https://dcdn.mitiendanube.com/stores/076/400/products/campera-jean-roja-flecos-11-2c925d7e5e658e5c1115957714656713-480-0.jpg', 13),
(23, 'Bufanda de lana', 13499, 'https://alcatraz.com.ar/2825-thickbox_default/bufanda-de-abrigo-negra-lana-bifaz-lisa-viscosa-alcatraz.jpg', 15),
(24, 'Gorra de béisbol', 7499, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI5-1X5RC6FRqvhF3VcIsVBs3AxsbIHKyFg&s', 15),
(25, 'Cinturón de cuero', 19499, 'https://i.etsystatic.com/22538142/r/il/3e00f5/5487705050/il_570xN.5487705050_dd71.jpg', 15),
(27, 'Mochila de tela', 19490, 'https://http2.mlstatic.com/D_NQ_NP_869630-MLU78770730933_082024-O.webp', 15),
(28, 'Zapatillas deportivas', 7499, 'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-running-under-armour-charged-slight-se-unisex-roja-700013026930600-1.jpg', 16),
(29, 'Zapatillas casuales', 5999, 'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-47-street-move-mujer-verde-21401702316ogc0-1.jpg', 16),
(30, 'Zapatillas de running', 8999, 'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-running-adidas-coreracer-negra-91317080-100010fx3593001-1.jpg', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`) VALUES
(1, 'webadmin', '$2y$10$.q4AujMaTZEnN.cTwAafRuusXf3o85OQTb8oBmume/dngyqH7X7IS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD PRIMARY KEY (`id_informacion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `informacion`
--
ALTER TABLE `informacion`
  MODIFY `id_informacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD CONSTRAINT `informacion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
