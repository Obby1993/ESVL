class ContactMailer < ApplicationMailer
  def email(nom, email, message)
    @nom = nom
    @message = message

    mail(to: 'olivieri3@hotmail.fr', from: email, subject: 'Nouveau message de contact')
  end
end
