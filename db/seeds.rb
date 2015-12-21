# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

 user =  User.create(first_name: 'AIDAR', last_name: 'FARRAHOV', email: 'far@mail.ru', password: '123456', admin: 'true')
	user.save
	 user =  User.create(first_name: 'VLADIMIR', last_name: 'PUTIN', email: 'q@mail.ru', password: '123456')
	user.save
	 user =  User.create(first_name: 'DMITRY', last_name: 'MEDVEDEV', email: 'q2@mail.ru', password: '123456')
	user.save
	 user =  User.create(first_name: 'RUSTAM', last_name: 'LATIPOV', email: 'q3@mail.ru', password: '123456')
	user.save
	 user =  User.create(first_name: 'DMITRY DYABILKIN', last_name: 'FARRAHOV', email: 'q4@mail.ru', password: '123456')
	user.save
	 user =  User.create(first_name: 'DMITRY', last_name: 'TRAGER', email: 'q5@mail.ru', password: '123456')
	user.save
	 user =  User.create(first_name: 'EVGENIY', last_name: 'RAZINKOV', email: 'q6@mail.ru', password: '123456')
	user.save


	product = Product.create(id: 1, name: 'наушники', price: '1200', count: '10')
		product.save

	product = Product.create(id: 2, name: 'мышь', price: '1400', count: '50')
		product.save

	product = Product.create(id: 3, name: 'клавиатура', price: '1900', count: '0')
		product.save

	product = Product.create(id: 4, name: 'колонки', price: '800', count: '1')
		product.save

	product = Product.create(id: 5, name: 'HDD', price: '11200', count: '0')
		product.save