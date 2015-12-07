@user = User.create(name: 'Manoel', phone: '22 8993-1323', email: 'manoel@maria.com', password: '123abc@')

100.times do |i|
	Product.create(title: 'Produto de teste', price: rand(99), user_id: 1)
end