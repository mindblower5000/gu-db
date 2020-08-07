
Ѕаза данны cтраны и города мира:

1. —делать запрос, в котором мы выберем все данные о городе Ц регион, страна.
SELECT `_cities`.`title_city` AS `Город` , ` _regions`.`title` AS `Область`, ` _countries`.`title` AS `Страна`
FROM `_cities`
INNER JOIN ` _regions` ON ` _regions`.`id` = `_cities`.`region_id`
INNER JOIN ` _countries` ON ` _countries`.`id` = `_cities`.`country_id`

2. Выбрать все города из Московской области.
SELECT `_cities`.`title_city` AS `Город` , ` _regions`.`title` AS `Область`
FROM `_cities`
INNER JOIN ` _regions` ON ` _regions`.`id` = `_cities`.`region_id`
WHERE ` _regions`.`title` = 'Московская';

Ѕаза данных Сотрудникиї:
1. Выбрать среднюю зарплату по отделам.
SELECT `depart`.`name` AS `Название отдела`, AVG(`salary`) AS `Средняя з/п в отделе` 
FROM `shtat` 
RIGHT JOIN `depart` ON `shtat`.`dept` = `depart`.`id`
GROUP BY `depart`.`name`;

2. Выбрать сотрудника с максимальной зарплатой.
SELECT `name`, `lastname`, `salary` FROM `shtat` ORDER BY `salary` DESC LIMIT 1;

3. Удалить одного сотрудника, у которого максимальная зарплата.
DELETE FROM `shtat` ORDER BY `salary` DESC LIMIT 1;


4. Посчитать количество сотрудников во всех отделах.
SELECT `depart`.`name` AS `Название отдела`, COUNT(`dept`) AS `Количество сотрудников` 
FROM `shtat` 
RIGHT JOIN `depart` ON `shtat`.`dept` = `depart`.`id`
GROUP BY `depart`.`name`;

5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
SELECT `depart`.`name` AS `Название отдела`, 
COUNT(`dept`) AS `Количество сотрудников`,

SUM(`salary`) AS `Всего денег в отделе` 

FROM `shtat` 
RIGHT JOIN `depart` ON `shtat`.`dept` = `depart`.`id`

GROUP BY `depart`.`name`;