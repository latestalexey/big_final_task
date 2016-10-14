﻿# encoding: utf-8
# language: ru

@tree

Функционал: поступление товаров
	Как Оператор
	Хочу оформить поступление товаров в организацию
	Чтобы далее эти товары можно было отгружать покупателям
	
Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	

Сценарий: Поступление товаров в организацию
	
	Когда я создаю новый документ поступления
		Когда Я нажимаю кнопку командного интерфейса "Покупка"
		Тогда открылось окно "Покупка"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Покупка (создание)"
		
	И я заполняю шапку документа
		Когда   в поле "Контрагент" я ввожу текст "тестовый поставщик"
		И     из выпадающего списка "Контрагент" я выбираю "Тестовый поставщик (000000001)"
		И     я перехожу к следующему реквизиту
			
	И я заполняю состав товаров
		Тогда открылось окно "Покупка (создание) *"
		И     в ТЧ "Товары" я нажимаю на кнопку "Добавить"
		И     в ТЧ "Товары" в поле "Номенклатура" я ввожу текст "номенклатура для проверки"
		И     в ТЧ "Товары" из выпадающего списка "Номенклатура" я выбираю "Номенклатура для проверки (000000001)"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "10,000"
		И     я перехожу к следующему реквизиту
		И     в ТЧ "Товары" я активизирую поле "Стоимость"
		И     в ТЧ "Товары" в поле "Стоимость" я ввожу текст "1 000,00"
		И     В форме "Покупка (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		
	И я провожу документ
		Тогда открылось окно "Покупка (создание) *"
		Когда я нажимаю на кнопку "Провести"
		И Пауза 2

	Тогда результат проведения корректен
		Когда открылось окно "Покупка * от *"
		И     я нажимаю на кнопку "Партии товаров"
		Тогда таблица формы с именем "Список" стала равной:
		| 'Номенклатура'              | 'Номер строки' | 'Регистратор' 	| 'Партия'| 'Период'              | 'Количество' | 'Стоимость' |
		| 'Номенклатура для проверки' | '1'            | * 			| * | * | '10,000'     | '1 000,00'  |
