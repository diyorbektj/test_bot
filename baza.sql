-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 19 2022 г., 07:43
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tester002_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--
-- Создание: Мар 27 2022 г., 10:13
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
                            `id` int(11) NOT NULL,
                            `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
                                          (1, 'Biologiya'),
                                          (2, 'Geografiya');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--
-- Создание: Мар 29 2022 г., 10:36
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
                         `id` int(11) NOT NULL,
                         `title` text COLLATE utf8mb4_unicode_ci,
                         `A` text COLLATE utf8mb4_unicode_ci,
                         `B` text COLLATE utf8mb4_unicode_ci,
                         `C` text COLLATE utf8mb4_unicode_ci,
                         `D` text COLLATE utf8mb4_unicode_ci,
                         `cat_id` int(11) DEFAULT NULL,
                         `answer` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id`, `title`, `A`, `B`, `C`, `D`, `cat_id`, `answer`, `image`) VALUES
                                                                                         (1, 'Niderlandlar poytaxti qayer?', 'Amsterdam', 'Belgrad', 'Bern', 'London', 2, 'A', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/480px-Flag_of_the_Netherlands.svg.png'),
                                                                                         (2, 'Andorra poytaxti qayer?', 'Afina', 'Andorra-la-Velya', 'Berlin', 'Budapesht', 2, 'B', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Andorra.svg/480px-Flag_of_Andorra.svg.png'),
                                                                                         (5, 'Jahon iqtisodiy   ijtimoiy  geografiyasi  nimani o’rgatadi? ', 'Dunyo  mamlakatlari  iqtisodiy  va  ijtimoiy  hayotini ', 'Dunyo  aholisi  hayotini', 'Dunyo mamlakatlari  davlat  tizimini.', ' Yashashtarzini ', 2, 'A', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (6, 'Jahon  iqtisodiy  ijtimoiy  geografiyasi  necha  qismdan  iborat?', '2 qismdan', '4 qismdan', '3 qismdan', '5 qismdan', 2, 'C', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (7, 'Siyosiy xarita  qanday  xaritalar sirasiga  kiradi?', 'Mavuli', 'Umumgeografi', 'Topografi', 'Siyosi', 2, 'A', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (8, 'Hozir dunyo siyosiy xaritasida nechta  davlat  bor?', '240 dan ortiq', '220 dan ortiq', '250 dan ortiq', '230 dan ortiq', 2, 'D', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (9, 'Siyosiy  xarita  qanday  vaqtda  o’zgaradi?', 'Тabiiy  resurslar', 'Тabiiy ofatlar natijasida', 'Jahon urushlari natijasida    ', 'Ob havo natijasida', 2, 'C', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (10, 'Iqtisodiy rivojlangan  davlatlar  nechta ?', '8 ta', '7 ta', '10 ta', '9 ta', 2, 'A', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (11, 'O’zbekiston  qachon  mustaqil  davlat  sifatida  siyosiy  xaritadan  joy  oldi?', '1995 yil', '1992 yil', '1989 yil', '1991 yil', 2, 'D', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (12, '“Federativ” so’zi  qanday  ma’no  anglatadi .', 'Birlik', 'Ittifoq', 'Guruh', 'Yagona', 2, 'B', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (13, 'Monarxiya  nima ?', 'Yakka xokimlik', 'To\'da', 'Ittifoq', 'Birlik', 2, 'A', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (14, 'Тabiiy  resurs  nima ?', 'Oltin  nomi', 'Тabiat  yaratgan  boyliklar', 'O’rmon', 'Cho\'l', 2, 'B', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (25, 'Germaniya poytaxti qayer?', 'Bern', 'Berlin', 'Amsterdan', 'London', 2, 'B', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/480px-Flag_of_Germany.svg.png'),
                                                                                         (26, 'Тugaydigan  tabiiy  resurslarni  ko’rsating ?', 'Suv,tuproq', 'Oltin kumush', 'Oltin qo’rg’oshin', 'o’rmon, suv', 2, 'A', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (27, 'Zaxirasi eng katta  bo’lgan  foydali  qazilmani  toping ?', 'Oltin', 'Neft', 'Ko’mir', 'Temir', 2, 'C', 'https://previews.123rf.com/images/arcady31/arcady311712/arcady31171200101/92337605-m%C3%A4nnliches-logisches-denkprozesspiktogramm.jpg'),
                                                                                         (28, 'Ruminiya poytaxti qayer?', 'Afina', 'Dublin', 'Dehli', 'Buxarest', 2, 'D', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flag_of_Romania.svg/480px-Flag_of_Romania.svg.png'),
                                                                                         (29, 'Tojikiston poytaxti qayer?', 'Ashxobod', 'Anqara', 'Toshkent', 'Dushanbe', 2, 'D', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Flag_of_Tajikistan.svg/1920px-Flag_of_Tajikistan.svg.png');

-- --------------------------------------------------------

--
-- Структура таблицы `test_answer`
--
-- Создание: Мар 30 2022 г., 04:51
--

DROP TABLE IF EXISTS `test_answer`;
CREATE TABLE `test_answer` (
                               `id` int(11) NOT NULL,
                               `user_id` bigint(19) NOT NULL,
                               `answer` varchar(10) NOT NULL,
                               `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `test_answer`
--

INSERT INTO `test_answer` (`id`, `user_id`, `answer`, `test_id`) VALUES
                                                                     (1, 333458329, 'B', 14),
                                                                     (2, 333458329, 'A', 5),
                                                                     (3, 333458329, 'C', 9),
                                                                     (4, 333458329, 'D', 28),
                                                                     (5, 333458329, 'A', 13),
                                                                     (6, 333458329, 'A', 13),
                                                                     (7, 333458329, 'B', 2),
                                                                     (8, 333458329, 'B', 25),
                                                                     (9, 333458329, 'C', 6),
                                                                     (10, 333458329, 'A', 5),
                                                                     (11, 333458329, 'B', 12),
                                                                     (12, 333458329, 'A', 13),
                                                                     (13, 333458329, 'A', 26),
                                                                     (14, 333458329, 'B', 14),
                                                                     (15, 333458329, 'D', 8),
                                                                     (16, 333458329, 'C', 27),
                                                                     (17, 333458329, 'D', 11),
                                                                     (18, 333458329, 'A', 10),
                                                                     (19, 333458329, 'B', 2),
                                                                     (20, 333458329, 'A', 7),
                                                                     (21, 333458329, 'D', 28),
                                                                     (22, 333458329, 'A', 10),
                                                                     (23, 333458329, 'D', 29),
                                                                     (24, 333458329, 'A', 10),
                                                                     (25, 333458329, 'A', 13),
                                                                     (26, 333458329, 'A', 13),
                                                                     (27, 333458329, 'D', 8),
                                                                     (28, 333458329, 'D', 11),
                                                                     (29, 333458329, 'D', 11),
                                                                     (30, 333458329, 'D', 11),
                                                                     (31, 333458329, 'B', 12),
                                                                     (32, 333458329, 'A', 1),
                                                                     (33, 333458329, 'A', 26),
                                                                     (34, 333458329, 'C', 9),
                                                                     (35, 333458329, 'A', 10),
                                                                     (36, 333458329, 'A', 26),
                                                                     (37, 333458329, 'D', 8),
                                                                     (38, 333458329, 'B', 2),
                                                                     (39, 333458329, 'D', 28),
                                                                     (40, 333458329, 'D', 29);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--
-- Создание: Мар 30 2022 г., 04:50
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `username` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `user_id` bigint(19) DEFAULT NULL,
                         `date` timestamp NULL DEFAULT NULL,
                         `balance` int(11) DEFAULT '0',
                         `correct_answers` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `user_id`, `date`, `balance`, `correct_answers`) VALUES
                                                                                                    (1, 'DIYORBEK', 'Diyorbek_Tj', 333458329, '2022-03-30 10:53:27', 750, 50),
                                                                                                    (2, 'coder', 'icodertj', 1315491145, '2022-03-30 11:08:29', 0, 0),
                                                                                                    (3, 'Biznesmin', NULL, 2135106113, '2022-03-31 11:37:26', 0, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
    ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
    ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Индексы таблицы `test_answer`
--
ALTER TABLE `test_answer`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `test_answer`
--
ALTER TABLE `test_answer`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;