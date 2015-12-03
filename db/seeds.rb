@user = User.create(email: 'manoel@maria.com', password: '123abc@')

100.times do |i|
	Product.create(title: 'Produto de teste', price: rand(99), user_id: @user.id)
end