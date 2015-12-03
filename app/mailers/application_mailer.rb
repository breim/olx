class ApplicationMailer < ActionMailer::Base
	include SendGrid
	default from: "batman@meudominio.com"
	layout 'mailer'
end
