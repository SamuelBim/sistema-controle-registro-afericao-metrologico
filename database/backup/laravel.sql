-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jun-2023 às 02:20
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `laravel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-04-25 00:11:36', '2023-04-25 00:11:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'renavam', 'number', 'Renavam', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric\",\"messages\":{\"required\":\"O campo :attribute \\u00e9 obrigatorio.\",\"numeric\":\"O campo :attribute deve possuir apenas numeros.\"}},\"display\":{\"width\":\"4\"}}', 2),
(58, 7, 'placa', 'text', 'Placa', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|formato_placa_de_veiculo\",\"messages\":{\"required\":\"O campo :attribute \\u00e9 obrigatorio.\",\"formato_placa_de_veiculo\":\"O campo :attribute deve estar no formato v\\u00e1lido de uma placa de ve\\u00edculo.\"}},\"display\":{\"width\":\"4\"}}', 3),
(59, 7, 'chassis', 'text', 'Chassis', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:17\",\"messages\":{\"required\":\"O campo :attribute \\u00e9 obrigatorio.\",\"min\":\"O campo :attribute deve possuir no minimo :min caracteres.\"}},\"display\":{\"width\":\"4\"}}', 4),
(60, 7, 'ano', 'text', 'Ano', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"max:4\",\"messages\":{\"max\":\"O campo :attribute deve possuir no maximo :max caracteres.\"}},\"display\":{\"width\":\"4\"}}', 7),
(61, 7, 'marca', 'text', 'Marca', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 5),
(62, 7, 'modelo', 'text', 'Modelo', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 6),
(63, 7, 'pneu', 'text', 'Pneu', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(64, 7, 'aro', 'text', 'Aro', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(65, 7, 'proprietario_id', 'text', 'Proprietario Id', 0, 0, 0, 0, 0, 0, '{}', 10),
(66, 7, 'created_at', 'timestamp', 'Cadastrado em', 0, 0, 1, 0, 0, 0, '{}', 11),
(67, 7, 'updated_at', 'timestamp', 'Ultima atualização', 0, 0, 1, 0, 0, 0, '{}', 12),
(68, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 8, 'cpf_cnpj', 'text', 'CPF/CNPJ', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(70, 8, 'nome', 'text', 'Proprietário', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:5\",\"messages\":{\"required\":\"O campo :attribute \\u00e9 obrigatorio.\",\"min\":\"O campo :attribute deve possuir no minimo :min caracteres.\"}},\"display\":{\"width\":\"6\"}}', 3),
(71, 8, 'cep', 'text', 'CEP', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|formato_cep\",\"messages\":{\"required\":\"O campo :attribute \\u00e9 obrigatorio.\",\"formato_cep\":\"O campo :attribute deve estar no formato(99999-999 ou 99.999-999).\"}},\"display\":{\"width\":\"4\"}}', 4),
(72, 8, 'cidade', 'text', 'Cidade', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 5),
(73, 8, 'estado', 'text', 'Estado', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 6),
(74, 8, 'endereco', 'text', 'Endereço', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(75, 8, 'numero', 'text', 'Numero', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(76, 8, 'bairro', 'text', 'Bairro', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(77, 8, 'telefone', 'text', 'Telefone', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 10),
(78, 8, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 11),
(79, 8, 'pais_origem', 'text', 'Pais de Origem', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 12),
(80, 8, 'complemento', 'text', 'Complemento', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 13),
(81, 8, 'created_at', 'timestamp', 'Cadastrado em', 0, 0, 1, 0, 0, 0, '{}', 14),
(82, 8, 'updated_at', 'timestamp', 'Ultima atualização', 0, 0, 1, 0, 0, 0, '{}', 15),
(83, 8, 'proprietario_hasmany_veiculo_relationship', 'relationship', 'veiculos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Veiculo\",\"table\":\"veiculos\",\"type\":\"hasMany\",\"column\":\"proprietario_id\",\"key\":\"id\",\"label\":\"placa\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(84, 7, 'veiculo_belongsto_proprietario_relationship', 'relationship', 'proprietario', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Proprietario\",\"table\":\"proprietarios\",\"type\":\"belongsTo\",\"column\":\"proprietario_id\",\"key\":\"id\",\"label\":\"nome\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(85, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(86, 9, 'foto_documento', 'image', 'Foto  do Documento', 1, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 2),
(87, 9, 'foto_cronotacografo', 'image', 'Foto do Cronotacógrafo', 1, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 3),
(88, 9, 'veiculo_id', 'text', 'Veiculo Id', 0, 0, 0, 0, 0, 0, '{}', 9),
(89, 9, 'created_at', 'timestamp', 'Cadastrado em', 0, 1, 1, 0, 0, 0, '{}', 7),
(90, 9, 'updated_at', 'timestamp', 'Ultima atualização', 0, 1, 1, 0, 0, 0, '{}', 8),
(91, 9, 'gru', 'text', 'GRU', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(92, 9, 'foto_ensaio', 'image', 'Foto Ensaio', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 4),
(93, 9, 'ensaios_metrologico_belongsto_veiculo_relationship', 'relationship', 'veiculo', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"model\":\"App\\\\Models\\\\Veiculo\",\"table\":\"veiculos\",\"type\":\"belongsTo\",\"column\":\"veiculo_id\",\"key\":\"id\",\"label\":\"placa\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-04-25 00:11:26', '2023-04-25 00:11:26'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-04-25 00:11:27', '2023-04-25 00:11:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-04-25 00:11:27', '2023-04-25 00:11:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(7, 'veiculos', 'veiculos', 'Veiculo', 'Veiculos', 'voyager-truck', 'App\\Models\\Veiculo', NULL, 'App\\Http\\Controllers\\VoyagerController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-04-26 02:28:22', '2023-06-08 02:58:39'),
(8, 'proprietarios', 'proprietarios', 'Proprietario', 'Proprietarios', 'voyager-person', 'App\\Models\\Proprietario', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-04-26 02:52:55', '2023-06-08 02:22:30'),
(9, 'ensaios_metrologicos', 'ensaios-metrologicos', 'Ensaio Metrológico', 'Ensaios Metrológicos', 'voyager-camera', 'App\\Models\\EnsaioMetrologico', NULL, 'App\\Http\\Controllers\\VoyagerController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-19 01:11:19', '2023-06-08 02:24:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ensaios_metrologicos`
--

CREATE TABLE `ensaios_metrologicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `foto_documento` text NOT NULL,
  `foto_cronotacografo` text NOT NULL,
  `veiculo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gru` text DEFAULT NULL,
  `foto_ensaio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ensaios_metrologicos`
--

INSERT INTO `ensaios_metrologicos` (`id`, `foto_documento`, `foto_cronotacografo`, `veiculo_id`, `created_at`, `updated_at`, `gru`, `foto_ensaio`) VALUES
(1, 'ensaios-metrologicos\\June2023\\MV2EjmQSdy1ZarcRx59V.jpg', 'ensaios-metrologicos\\June2023\\4KzF1MzwkGBnLil71PX0.jpg', 1, '2023-05-19 01:50:18', '2023-06-07 23:32:51', '294104136001235698', 'ensaios-metrologicos\\May2023\\LhT2owfU6yjaeCcJfAeZ.jpg'),
(2, 'ensaios-metrologicos\\May2023\\kH0y8CcolDpU9IYAIy0W.jpg', 'ensaios-metrologicos\\May2023\\357k8BSrcI97DFEKbj90.jpg', 2, '2023-05-23 18:57:12', '2023-05-23 18:57:12', '294104136001528956', 'ensaios-metrologicos\\May2023\\J9CisxbUzwPLk9sY95Sm.jpg'),
(3, 'ensaios-metrologicos\\May2023\\qFEk52f98NlXiQ1ea1OG.jpg', 'ensaios-metrologicos\\May2023\\AFrkuZbp36F4j3MDdunf.jpg', 3, '2023-05-23 18:58:18', '2023-05-23 18:58:18', '294104136001417859', 'ensaios-metrologicos\\May2023\\jDYEs5OniNzUt8c0t5ND.jpg'),
(4, 'ensaios-metrologicos\\May2023\\aFiA9ceqyjmGlwNctzr6.png', 'ensaios-metrologicos\\May2023\\gzoViSdQfwKXnIKLP762.jpg', 5, '2023-05-23 20:40:22', '2023-05-23 20:40:22', '294104136000956236', 'ensaios-metrologicos\\May2023\\dF1DkL6oFj8YyEA8DwMX.jpg'),
(5, 'ensaios-metrologicos\\June2023\\JBtqyS1CSMweaigYFL6v.jpg', 'ensaios-metrologicos\\June2023\\MOMhHjs8Tt7B1jSx3M6k.jpg', 6, '2023-06-05 20:01:28', '2023-06-05 20:01:28', NULL, NULL),
(6, 'ensaios-metrologicos\\June2023\\OPiaKX0oQNZ5ZicHkzEz.jpg', 'ensaios-metrologicos\\June2023\\pbWD0dobpN9kGiq8JIhe.jpg', 4, '2023-06-08 01:27:50', '2023-06-08 01:27:50', '2941041360012355698', 'ensaios-metrologicos\\June2023\\OUmgpzZCJgdVW10r4yDp.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-04-25 00:11:29', '2023-04-25 00:11:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-04-25 00:11:29', '2023-04-25 00:11:29', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-04-25 00:11:29', '2023-04-25 00:11:29', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-04-25 00:11:29', '2023-04-25 00:11:29', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-04-25 00:11:29', '2023-04-25 00:11:29', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-04-25 00:11:30', '2023-04-25 00:11:30', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2023-04-25 00:11:30', '2023-04-25 00:11:30', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2023-04-25 00:11:30', '2023-04-25 00:11:30', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-04-25 00:11:30', '2023-04-25 00:11:30', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-04-25 00:11:30', '2023-04-25 00:11:30', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-04-25 00:11:30', '2023-04-25 00:11:30', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2023-04-25 00:11:36', '2023-04-25 00:11:36', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2023-04-25 00:11:38', '2023-04-25 00:11:38', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2023-04-25 00:11:39', '2023-04-25 00:11:39', 'voyager.pages.index', NULL),
(14, 1, 'Veiculos', '', '_self', 'voyager-truck', NULL, NULL, 15, '2023-04-26 02:28:23', '2023-04-26 02:28:23', 'voyager.veiculos.index', NULL),
(15, 1, 'Proprietarios', '', '_self', 'voyager-person', NULL, NULL, 16, '2023-04-26 02:52:55', '2023-04-26 02:52:55', 'voyager.proprietarios.index', NULL),
(16, 1, 'Ensaios Metrológicos', '', '_self', 'voyager-camera', NULL, NULL, 17, '2023-05-19 01:11:20', '2023-05-19 01:11:20', 'voyager.ensaios-metrologicos.index', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-04-25 00:11:39', '2023-04-25 00:11:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(2, 'browse_bread', NULL, '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(3, 'browse_database', NULL, '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(4, 'browse_media', NULL, '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(5, 'browse_compass', NULL, '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(6, 'browse_menus', 'menus', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(7, 'read_menus', 'menus', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(8, 'edit_menus', 'menus', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(9, 'add_menus', 'menus', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(10, 'delete_menus', 'menus', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(11, 'browse_roles', 'roles', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(12, 'read_roles', 'roles', '2023-04-25 00:11:31', '2023-04-25 00:11:31'),
(13, 'edit_roles', 'roles', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(14, 'add_roles', 'roles', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(15, 'delete_roles', 'roles', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(16, 'browse_users', 'users', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(17, 'read_users', 'users', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(18, 'edit_users', 'users', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(19, 'add_users', 'users', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(20, 'delete_users', 'users', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(21, 'browse_settings', 'settings', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(22, 'read_settings', 'settings', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(23, 'edit_settings', 'settings', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(24, 'add_settings', 'settings', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(25, 'delete_settings', 'settings', '2023-04-25 00:11:32', '2023-04-25 00:11:32'),
(26, 'browse_categories', 'categories', '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(27, 'read_categories', 'categories', '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(28, 'edit_categories', 'categories', '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(29, 'add_categories', 'categories', '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(30, 'delete_categories', 'categories', '2023-04-25 00:11:36', '2023-04-25 00:11:36'),
(31, 'browse_posts', 'posts', '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(32, 'read_posts', 'posts', '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(33, 'edit_posts', 'posts', '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(34, 'add_posts', 'posts', '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(35, 'delete_posts', 'posts', '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(36, 'browse_pages', 'pages', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(37, 'read_pages', 'pages', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(38, 'edit_pages', 'pages', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(39, 'add_pages', 'pages', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(40, 'delete_pages', 'pages', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(41, 'browse_veiculos', 'veiculos', '2023-04-26 02:28:23', '2023-04-26 02:28:23'),
(42, 'read_veiculos', 'veiculos', '2023-04-26 02:28:23', '2023-04-26 02:28:23'),
(43, 'edit_veiculos', 'veiculos', '2023-04-26 02:28:23', '2023-04-26 02:28:23'),
(44, 'add_veiculos', 'veiculos', '2023-04-26 02:28:23', '2023-04-26 02:28:23'),
(45, 'delete_veiculos', 'veiculos', '2023-04-26 02:28:23', '2023-04-26 02:28:23'),
(46, 'browse_proprietarios', 'proprietarios', '2023-04-26 02:52:55', '2023-04-26 02:52:55'),
(47, 'read_proprietarios', 'proprietarios', '2023-04-26 02:52:55', '2023-04-26 02:52:55'),
(48, 'edit_proprietarios', 'proprietarios', '2023-04-26 02:52:55', '2023-04-26 02:52:55'),
(49, 'add_proprietarios', 'proprietarios', '2023-04-26 02:52:55', '2023-04-26 02:52:55'),
(50, 'delete_proprietarios', 'proprietarios', '2023-04-26 02:52:55', '2023-04-26 02:52:55'),
(51, 'browse_ensaios_metrologicos', 'ensaios_metrologicos', '2023-05-19 01:11:19', '2023-05-19 01:11:19'),
(52, 'read_ensaios_metrologicos', 'ensaios_metrologicos', '2023-05-19 01:11:19', '2023-05-19 01:11:19'),
(53, 'edit_ensaios_metrologicos', 'ensaios_metrologicos', '2023-05-19 01:11:19', '2023-05-19 01:11:19'),
(54, 'add_ensaios_metrologicos', 'ensaios_metrologicos', '2023-05-19 01:11:19', '2023-05-19 01:11:19'),
(55, 'delete_ensaios_metrologicos', 'ensaios_metrologicos', '2023-05-19 01:11:19', '2023-05-19 01:11:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-04-25 00:11:38', '2023-04-25 00:11:38'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-04-25 00:11:38', '2023-04-25 00:11:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietarios`
--

CREATE TABLE `proprietarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `cpf_cnpj` text NOT NULL,
  `nome` text NOT NULL,
  `cep` text DEFAULT NULL,
  `cidade` text DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `numero` text DEFAULT NULL,
  `bairro` text DEFAULT NULL,
  `telefone` text NOT NULL,
  `email` text NOT NULL,
  `pais_origem` text DEFAULT NULL,
  `complemento` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `proprietarios`
--

INSERT INTO `proprietarios` (`id`, `cpf_cnpj`, `nome`, `cep`, `cidade`, `estado`, `endereco`, `numero`, `bairro`, `telefone`, `email`, `pais_origem`, `complemento`, `created_at`, `updated_at`) VALUES
(1, '521625325000122', 'Juniorzao Coelho', '79240000', 'Jardim', 'MS', 'Av. paralelepipedo', '521', 'Casa do Karai', '6798159678', 'junio012@gmail.com', 'Brasil', NULL, '2023-04-26 02:59:40', '2023-04-26 02:59:40'),
(2, '04168935215', 'Janvivaldo Soares', '79240-000', 'Jardim', 'MS', 'Avenida Santo Afonso', '852', 'Vila Cogumelo', '67956328756', 'janvaldo123@gmail.com', 'Brasil', NULL, '2023-05-22 18:10:18', '2023-05-22 18:10:18'),
(3, '65896572000126', 'Daniel Orivaldo da Silva', '79220000', 'Nioaque', 'MS', 'Rua Dom Pedro II', '123', 'Congresso', '67985682587', 'Danizinorivaldo@gmail.com', 'Brasil', NULL, '2023-05-23 18:42:49', '2023-05-23 18:42:49'),
(4, '05268958712', 'Marcos Coelho Piveta', '79270000', 'Caracol', 'MS', 'Rua Caracolandia', '666', 'Quinto dos inferno', '67958256321', 'pivetacoelho157@gmail.com', 'Brasil', NULL, '2023-05-23 18:44:57', '2023-05-23 18:44:57'),
(5, '63295687144', 'Josoares Mcqueen Pluto', '79290000', 'Bonito', 'MS', 'Rua Orlando', '1001', 'Disney', '67981345589', 'plutomcqueen@bol.com.br', 'Brasil', NULL, '2023-05-23 18:46:42', '2023-05-23 18:46:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-04-25 00:11:30', '2023-04-25 00:11:30'),
(2, 'user', 'Normal User', '2023-04-25 00:11:30', '2023-04-25 00:11:30'),
(3, 'responsavel-tecnico', 'Responsável Técnico', '2023-04-26 02:31:37', '2023-04-26 02:31:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\June2023\\EsJG2WqdFAmeW8mcPvlw.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Cronotacógrafo', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Sistema de Controle e Registro de Aferição Metrológica', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-04-25 00:11:39', '2023-04-25 00:11:39'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-04-25 00:11:40', '2023-04-25 00:11:40'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-04-25 00:11:40', '2023-04-25 00:11:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$zNmoxWKsWJ1A0IJ37EC54ugFpTsNnsCgtKJemayVBVc7L0Kew8Pwu', 'SaxFCQvvokNYWLtsOCwZXpLcKqipvDCJ6eJeEmzrvauZgnOp2Rqef2wWBoZ6', NULL, '2023-04-25 00:11:37', '2023-04-25 00:11:37'),
(2, 3, 'Samuel Bim', 'samuelcbim@hotmail.com', 'users/default.png', NULL, '$2y$10$zAy9biAez5dmcWtJ8.kZDunM7vChrwAf0P.pIIS0vNpa0aLa8meUC', NULL, '{\"locale\":\"pt_br\"}', '2023-04-26 02:35:37', '2023-04-26 02:35:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(10) UNSIGNED NOT NULL,
  `renavam` text NOT NULL,
  `placa` text NOT NULL,
  `chassis` text NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `marca` text DEFAULT NULL,
  `modelo` text DEFAULT NULL,
  `pneu` text DEFAULT NULL,
  `aro` float DEFAULT NULL,
  `proprietario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `renavam`, `placa`, `chassis`, `ano`, `marca`, `modelo`, `pneu`, `aro`, `proprietario_id`, `created_at`, `updated_at`) VALUES
(1, '536981561', 'HRO5F98', '6597859BFD021LK20', 2013, 'VOLVO', 'VOLARE 1516', '295/80', 22.5, 1, '2023-04-26 02:40:35', '2023-05-19 01:45:44'),
(2, '265986952', 'NRZ3658', '65329756LKH2512532', 2005, 'MERCEDES-BENZ', 'L 1516', '275/80', 22.5, 1, '2023-05-19 02:14:38', '2023-05-19 02:14:38'),
(3, '526898157', 'HRF2869', '95BM562358FGD852000', 2014, 'FIAT', '360 LHP 4X', '275/80', 22.5, 2, '2023-05-22 19:20:32', '2023-05-22 19:20:32'),
(4, '00125632885', 'RWF2L65', '652639FDGR25CV256315', 2019, 'VOLKSWAGEM', 'RXS TITAN 360', '295/80', 22.5, 5, '2023-05-23 20:34:02', '2023-05-23 20:34:02'),
(5, '023597146263', 'BWS1235', '562358LKJH852VC632512', 2003, 'MACLAREN', 'SPORT 2.0 4X4', '275/80', 22.5, 4, '2023-05-23 20:38:30', '2023-05-23 20:38:30'),
(6, '05126975685', 'HRT0856', '95632DFEJ58FR52632', 1980, 'M.BENZ', 'LX 220 AUEO', '295/80', 22.5, 3, '2023-06-05 20:00:29', '2023-06-05 20:00:29');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Índices para tabela `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Índices para tabela `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Índices para tabela `ensaios_metrologicos`
--
ALTER TABLE `ensaios_metrologicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Índices para tabela `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Índices para tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Índices para tabela `proprietarios`
--
ALTER TABLE `proprietarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Índices para tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Índices para tabela `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Índices para tabela `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `ensaios_metrologicos`
--
ALTER TABLE `ensaios_metrologicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `proprietarios`
--
ALTER TABLE `proprietarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Limitadores para a tabela `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
