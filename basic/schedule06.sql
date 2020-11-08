-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 08 2020 г., 18:49
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `schedule06`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classroom`
--

CREATE TABLE `classroom` (
  `classroom_id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `classroom`
--

INSERT INTO `classroom` (`classroom_id`, `name`, `active`) VALUES
(2, '2222', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `day`
--

CREATE TABLE `day` (
  `day_id` tinyint NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `day`
--

INSERT INTO `day` (`day_id`, `name`) VALUES
(1, 'понедельник'),
(2, 'вторник'),
(3, 'среда'),
(4, 'четверг'),
(5, 'пятница'),
(6, 'суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `gender_id` tinyint NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`gender_id`, `name`) VALUES
(1, 'мужской'),
(2, 'женский');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa`
--

CREATE TABLE `gruppa` (
  `gruppa_id` int NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_id` int NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `gruppa`
--

INSERT INTO `gruppa` (`gruppa_id`, `name`, `special_id`, `date_begin`, `date_end`) VALUES
(1, 'П-17-42Б', 5, '2017-09-01', '2021-06-25');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_num`
--

CREATE TABLE `lesson_num` (
  `lesson_num_id` int NOT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_lesson` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lesson_num`
--

INSERT INTO `lesson_num` (`lesson_num_id`, `name`, `time_lesson`) VALUES
(1, '1 пара', '08:30:00'),
(2, '2 пара', '10:10:00'),
(3, '3 пара', '12:20:00'),
(4, '4 пара', '14:00:00'),
(5, '5 пара', '15:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_plan`
--

CREATE TABLE `lesson_plan` (
  `lesson_plan_id` int NOT NULL,
  `gruppa_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lesson_plan`
--

INSERT INTO `lesson_plan` (`lesson_plan_id`, `gruppa_id`, `subject_id`, `user_id`) VALUES
(1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `otdel`
--

CREATE TABLE `otdel` (
  `otdel_id` smallint NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `otdel`
--

INSERT INTO `otdel` (`otdel_id`, `name`, `active`) VALUES
(1, 'программирование', 1),
(2, 'общеобразовательные дисциплины', 1),
(3, 'строительство', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `role_id` tinyint NOT NULL,
  `sys_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`role_id`, `sys_name`, `name`, `active`) VALUES
(1, 'admin', 'Администратор', 1),
(2, 'manager', 'Менеджер', 1),
(3, 'teacher', 'Преподаватель', 1),
(4, 'student', 'Студент', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL,
  `lesson_plan_id` int NOT NULL,
  `day_id` tinyint NOT NULL,
  `lesson_num_id` int NOT NULL,
  `classroom_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `lesson_plan_id`, `day_id`, `lesson_num_id`, `classroom_id`) VALUES
(1, 1, 1, 1, 2),
(2, 1, 2, 2, 2),
(3, 1, 3, 3, 2),
(4, 1, 4, 5, 2),
(5, 1, 5, 4, 2),
(6, 1, 6, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `special`
--

CREATE TABLE `special` (
  `special_id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `special`
--

INSERT INTO `special` (`special_id`, `name`, `otdel_id`, `active`) VALUES
(1, 'информационные системы', 1, 1),
(2, 'нефтегазовое дело', 2, 1),
(3, 'строительство и эксплуатация зданий и сооружений', 3, 1),
(4, 'электроснабжение', 3, 1),
(5, 'вычислительная техника и\r\nпрограммное обеспечение', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `user_id` bigint NOT NULL,
  `gruppa_id` int NOT NULL,
  `num_zach` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`user_id`, `gruppa_id`, `num_zach`) VALUES
(4, 1, '123431'),
(5, 1, '123431');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `subject_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otdel_id` smallint NOT NULL,
  `hours` smallint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`subject_id`, `name`, `otdel_id`, `hours`, `active`) VALUES
(1, 'Веб программирование', 1, 120, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `user_id` bigint NOT NULL,
  `otdel_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`user_id`, `otdel_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` bigint NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender_id` tinyint NOT NULL,
  `birthday` date DEFAULT NULL,
  `role_id` tinyint NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `lastname`, `firstname`, `patronymic`, `login`, `pass`, `gender_id`, `birthday`, `role_id`, `active`) VALUES
(1, 'Смит', 'Джон', 'Тимофеевич', 'admin', '$2y$13$u9hGuhVBf9yCSNeLI4gW8OB8FkdDY7Qc28oiuBEeYsmmJNeTs55ca', 1, '2000-07-10', 1, 1),
(3, 'Моисеенко', 'Дмитрий', 'Юрьевич', 'mois', '$2y$10$crF02A3t3nirMkXF9.kNruIFu1IKb08IkQm3eUDkxTmHkRhw1nrxC', 1, '2001-03-15', 3, 1),
(5, 'Гришин', 'Глеб', 'Александрович', 'gleb', '$2y$10$XnLvtKuQ3wA0nvrI2Jvp8OTRuTMXoASiu5G07V0GND6V2r6DCdgFa', 1, '2002-04-10', 4, 1),
(6, 'Громов', 'Антон', 'Анатольевич', 'addmin', 'root', 1, '2002-04-05', 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `FK_gruppa_special_special_id` (`special_id`);

--
-- Индексы таблицы `lesson_num`
--
ALTER TABLE `lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `lesson_plan`
--
ALTER TABLE `lesson_plan`
  ADD PRIMARY KEY (`lesson_plan_id`),
  ADD KEY `FK_lesson_plan_gruppa_gruppa_id` (`gruppa_id`),
  ADD KEY `FK_lesson_plan_teacher_user_id` (`user_id`),
  ADD KEY `FK_lesson_plan_subject_subject_id` (`subject_id`);

--
-- Индексы таблицы `otdel`
--
ALTER TABLE `otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `FK_schedule_lesson_plan_lesson_plan_id` (`lesson_plan_id`),
  ADD KEY `FK_schedule_classroom_classroom_id` (`classroom_id`),
  ADD KEY `FK_schedule_lesson_num_lesson_num_id` (`lesson_num_id`),
  ADD KEY `FK_schedule_day_day_id` (`day_id`);

--
-- Индексы таблицы `special`
--
ALTER TABLE `special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `FK_special_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_student_gruppa_gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `FK_subject_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_teacher_otdel_otdel_id` (`otdel_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK_user_role_role_id` (`role_id`),
  ADD KEY `FK_user_gender_gender_id` (`gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classroom`
--
ALTER TABLE `classroom`
  MODIFY `classroom_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `day`
--
ALTER TABLE `day`
  MODIFY `day_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gruppa`
--
ALTER TABLE `gruppa`
  MODIFY `gruppa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `lesson_num`
--
ALTER TABLE `lesson_num`
  MODIFY `lesson_num_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `lesson_plan`
--
ALTER TABLE `lesson_plan`
  MODIFY `lesson_plan_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `otdel`
--
ALTER TABLE `otdel`
  MODIFY `otdel_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `role_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `special`
--
ALTER TABLE `special`
  MODIFY `special_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD CONSTRAINT `FK_gruppa_special_special_id` FOREIGN KEY (`special_id`) REFERENCES `special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `lesson_plan`
--
ALTER TABLE `lesson_plan`
  ADD CONSTRAINT `FK_lesson_plan_gruppa_gruppa_id` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa` (`gruppa_id`),
  ADD CONSTRAINT `FK_lesson_plan_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  ADD CONSTRAINT `FK_lesson_plan_teacher_user_id` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `FK_schedule_classroom_classroom_id` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`classroom_id`),
  ADD CONSTRAINT `FK_schedule_day_day_id` FOREIGN KEY (`day_id`) REFERENCES `day` (`day_id`),
  ADD CONSTRAINT `FK_schedule_lesson_num_lesson_num_id` FOREIGN KEY (`lesson_num_id`) REFERENCES `lesson_num` (`lesson_num_id`),
  ADD CONSTRAINT `FK_schedule_lesson_plan_lesson_plan_id` FOREIGN KEY (`lesson_plan_id`) REFERENCES `lesson_plan` (`lesson_plan_id`);

--
-- Ограничения внешнего ключа таблицы `special`
--
ALTER TABLE `special`
  ADD CONSTRAINT `FK_special_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `FK_subject_otdel_otdel_id` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
