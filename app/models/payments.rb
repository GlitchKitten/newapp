def order_email
  UserMailer.order_email(self).deliver
end