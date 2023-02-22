-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 11:43 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jstore_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Talons femmes'),
(2, 'Robes femmes'),
(3, 'Pantalons femmes'),
(4, 'Chemises femmes'),
(5, 'Bon plan femmes');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `latname` varchar(150) DEFAULT NULL,
  `sexe` int(11) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `pseudo`, `name`, `latname`, `sexe`, `tel`, `email`, `password`) VALUES
(1, ' paul200', NULL, ' paul', NULL, NULL, ' paul20@gmai.com', 'karim15'),
(2, 'Raoul', NULL, NULL, NULL, NULL, 'Raoul10@hotmail.com', '68217bc6782ca4675d2f266e8f65bac885d68e40'),
(6, 'khalid', NULL, NULL, NULL, NULL, 'khalid10@hotmail.com', '70c81ce1d2f6a7e50eaa1114f3f99f4458fbd49f'),
(7, 'khalid', NULL, NULL, NULL, NULL, 'khalid10@hotmail.com', '70c81ce1d2f6a7e50eaa1114f3f99f4458fbd49f'),
(8, 'khalid', NULL, NULL, NULL, NULL, 'khalid10@hotmail.com', '70c81ce1d2f6a7e50eaa1114f3f99f4458fbd49f');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_customers` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created-at` datetime NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created-at`, `stock`, `image`, `category_id`) VALUES
(1, 'talons hauts', 'SARAIRIS 2020 mode été plate-forme talons hauts compensés décontracté confortable lumière loisirs chaussures femme sandales femmes chaussures femme', 78.98, '2020-04-16 00:00:00', 200, 'b4.png', 1),
(2, 'sandales compensées', 'DAHOOD sandales compensées pour femme mi-talon été sans lacet boucle dames chaussures artificiel bout ouvert décontracté pompes de mariage femmes Sandalias', 78.98, '2020-03-20 16:56:47', 200, 'b3.png', 1),
(3, 'chaussures à semelles', 'INS loisirs grande taille 43 femmes confortables chaussures à semelles compensées 2020 en Stock été sandales femme plate-forme talons hauts chaussures femme', 23.98, '2020-03-20 16:57:53', 200, 'b1.png', 1),
(4, 'Sandales femmes', 'Sandales femmes nouvelles chaussures d\'été femme grande taille 46 talons sandales pour chaussures à semelles compensées femme chaussures décontractées gladiateur Sandalias Mujer', 23.98, '2020-03-20 16:57:53', 200, 'b2.png', 1),
(5, 'Direct talons bas', 'Usine Direct talons bas sandales femmes bride à la cheville chaussures d\'été femme grande taille 43 bloc talons femmes chaussures 2019 sandales décontractées', 23.89, '2020-03-22 15:17:02', 0, 'b5.png', 1),
(6, 'sandales plates', 'Femmes 2020 été sandales plates décontractées grande taille tongs femme troupeau métal décoration fermeture éclair cheville Wrap chaussures loisirs chaussures', 67.99, '2020-03-22 15:17:02', 0, 'b6.png', 1),
(7, 'sandales grande taille', 'Usine Direct femmes sandales grande taille 43 gladiateur sandales pour plage plat d\'été Chaussures Femme Zip livraison directe Chaussures Femme', 89.99, '2020-03-22 15:30:57', 200, 'b7.png', 1),
(8, 'femmes Slingback', '2020 été élégant femmes Slingback sandales blanc noir argent bas talons hauts fermé orteil sandales décontracté bureau dame chaussures de fête', 88.99, '2020-03-22 15:30:57', 200, 'b8.png', 1),
(9, 'Sexy mince talons', 'Sarairis 2020 nouvelle mode grande taille 43 Sexy mince talons hauts d\'été sandales femme chaussures bout pointu mélange couleur chaussures femmes', 34.99, '2020-03-22 15:30:57', 500, 'b9.png', 1),
(10, 'femmes sandales', 'Été femmes sandales bride à la cheville treillis dames épais talons hauts chaussures femme croix bout ouvert couverture talons femme sandales 2020', 56.99, '2020-03-22 15:30:57', 200, 'b10.png', 1),
(11, 'Élégant robe longue', 'Élégant robe longue femmes printemps Plaid imprimer robe de soirée irrégulière Vintage robes dames bouton a-ligne 2020 nouvelle robe de mode', 54.99, '2020-03-24 21:15:47', 200, 'c2.png', 2),
(12, 'robe de bureau Sexy', 'Grande taille 2019 mode été Patchwork pli travail robe de bureau Sexy moulante sans manches femmes décontracté tenue de fête robe de fête', 34.99, '2020-03-24 21:15:47', 500, 'c3.png', 2),
(13, 'Bandage moulante à manches', 'Recherché nouveau femmes Bandage moulante à manches courtes robe de soirée Midi', 56.99, '2020-03-24 21:15:47', 200, 'c4.png', 2),
(14, 'mode femmes Sexy dames', 'Marque nouvelle mode femmes Sexy dames o-cou robe noire pansement moulante à manches longues soirée Cocktail courte Mini robe', 165.99, '2020-03-24 21:15:47', 200, 'c5.png', 2),
(15, 'Robe femmes grande', 'Robe femmes grande taille 3XL 11 couleur Sexy col en v solide paillettes couture brillant Club gaine', 29.99, '2020-03-24 21:15:47', 100, 'c7.png', 2),
(16, 'brillant Club gaine', 'Robe femmes grande taille 3XL 11 couleur Sexy col en v solide paillettes couture brillant Club gaine\r\n4.', 23.8, '2020-03-24 21:20:54', 20, 'c8.png', 2),
(17, 'mode femmes Sexy', 'Marque nouvelle mode femmes Sexy dames o-cou robe noire pansement moulante à manches longues soirée Cocktail courte Mini robe', 23.8, '2020-03-24 21:23:24', 0, 'c6.png', 2),
(18, 'Robe femmes bureau', 'Robe de bureau femmes élégantes femmes bureau dame Sexy solide col rabattu à manches longues boutons moulante travail robe formelle', 89.99, '2020-03-26 14:57:08', 100, 'c9.png', 2),
(19, 'Robe élégante femmes', 'Bureau dames robe élégante femmes mode jaune à manches courtes grande taille moulante taille haute grandes tailles travail Sexy robe Midi femme', 99.99, '2020-03-26 14:58:48', 200, 'c10.png', 2),
(20, 'cuir pantalon noir', 'Pantalon femmes taille haute PU cuir pantalon noir Leggings femme brillant Stretch crayon pantalon élastique pantalon femme vêtements', 45.9, '2020-04-01 10:36:57', 150, 'p4.png', 3),
(21, 'pantalon large jambe', 'Toplook Neon pantalon large jambe 2019 été femmes taille haute Streetwear Festival pantalon lâche noir vêtements bureau dames ceinture', 78.9, '2020-04-01 10:36:57', 255, 'p2.png', 3),
(22, 'Flare pantalon femme', 'Taille haute décontracté Flare pantalon femme mode nouveau pantalon femmes cheville-longueur femmes vêtements 2018', 67.89, '2020-04-01 10:36:57', 300, 'p3.png', 3),
(23, 'Skinny Slim pantalon', 'Femmes Stretch taille haute Jegging Denim Jeans Skinny Slim pantalon pantalons Leggings décontracté quotidien vêtements Skinny crayon', 78.99, '2020-04-01 10:36:57', 500, 'p1.png', 3),
(24, 'Rayonne tricoté Sexy', 'couleurs de haute qualité crayon femmes pantalon rayonne tricoté Sexy & Club pantalon de pansement vêtements de fête', 67.99, '2020-04-01 10:36:57', 444, 'p5.png', 3),
(25, 'Pantalon élastique', 'Grande taille femmes pantalon élastique taille haute pantalon femmes pantalon Patchwork Capris pantalons de survêtement Joggers mode décontracté femmes vêtements', 56.99, '2020-04-01 10:36:57', 500, 'p6.png', 3),
(26, 'chauve-souris aile', 'Été chauve-souris aile haut femmes avant lacé Blouse dame dentelle à manches courtes tunique dente chemise femme t-shirt blusas mujer nouveau', 56.99, '2020-04-01 10:50:39', 200, 'f1.png', 4),
(27, 'Rayures irrégulières', 'Automne à manches longues col en V chemise à rayures irrégulières femmes décontracté hauts et chemisiers chemise femme camisas mujer femmes blouses', 76.99, '2020-04-01 10:50:39', 455, 'f2.png', 4),
(28, 'Blouse à manches courtes', 'Femmes 2019 été Blouse à manches courtes à bretelles blusas chemise femme chemise élégante femme moulante hauts ShirtDorp', 89.99, '2020-04-01 10:50:39', 444, 'f3.png', 4),
(29, 'vêtements décontracté', '4xl grande taille femmes vêtements décontracté col en v femmes Blouses à manches courtes imprimé Chemise Femme taille ceinture haut pour Femme Chemise Femme', 56.99, '2020-04-01 10:50:39', 555, 'f4.png', 4),
(30, 'Chemises À Carreaux', '2019 Printemps Chemises À Carreaux Femmes Batwing Manches En Mousseline De Soie Blouses décontracté Nuisette Femme hauts grande taille Tartan Blusas Mujer M-4XL', 65.88, '2020-04-01 10:50:39', 222, 'f5.png', 4),
(31, 'Mode Vintage imprimé', 'Mode Vintage imprimé Floral Blouse Chemise 2019 été sans manches en mousseline de soie Blouse Sexy col en V femmes chemises décontractées amples Chemise', 56.99, '2020-04-01 10:50:39', 444, 'f6.png', 4),
(32, 'baskets maille respirant', 'Femmes baskets maille respirant plate-forme talons compensés chaussures de sport d\'été chaussures plates Zapatillas Deportivas Mujer', 299.99, '2020-04-01 11:13:38', 200, 'm2.png', 5),
(33, 'chaussures de course', 'Nouveau élégant femme chaussures de course augmentant 6CM INS haut talon baskets femmes hauteur plate-forme respirant sport marche filles', 188.99, '2020-04-01 11:13:38', 444, 'm3.png', 5),
(34, 'Doux décontracté', 'Doux décontracté épais Sneaker plate-forme été respirant maille chaussures pour femmes plat décontracté jaune chaussures de sport femme Orange 2020', 499.99, '2020-04-01 11:13:38', 222, 'm4.png', 5),
(35, 'baskets légères', 'Mode femmes baskets légères chaussures de sport femmes chaussures respirant confort plate-forme chaussures pour dames Basket Femme formateurs', 666.99, '2020-04-01 11:13:38', 889, 'm5.png', 5),
(36, 'baskets blanc noir', 'Femmes baskets blanc noir chaussures de créateur femme automne hiver grosses baskets mode lumière papa chaussures dames plate-forme chaussures', 788.99, '2020-04-01 11:13:38', 333, 'm6.png', 5),
(37, 'baskets femmes hauteur', 'nouveau élégant femme chaussures de course augmentant 6CM INS haut talon baskets femmes hauteur plate-forme respirant sport marche filles', 568.99, '2020-04-01 11:13:38', 222, 'm7.png', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customers_index` (`id_customers`),
  ADD KEY `id_product_index` (`id_product`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_index` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_customers`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
