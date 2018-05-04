# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "anil_silverboyy@hotmail.com"
  layout 'mailer'
end

