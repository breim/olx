class UserMailer < ApplicationMailer
	def send_comment(comment)
		#- Informações do comprador
		@buyer_name = comment.user.try(:name)
		@buyer_email = comment.user.email
		@buyer_phone = comment.user.try(:phone)

        #- Informações do vendedor
        @salesman_name = comment.product.user.try(:name)
        @salesman_email = comment.product.user.email

        #- Informações do produto
        @product = Product.find(comment.product_id)
        @comment = Comment.find(comment)

        mail(to: @salesman_email, subject: 'Novo comentário em um de seus produtos')
  end
end