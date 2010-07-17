Factory.define :user do |u|
  u.login "user"
  u.password "user"
  u.password_confirmation "user"
  u.email "user@gmail.com"
end

Factory.define :flyerhzm, :parent => :user do |u|
  u.login "flyerhzm"
  u.password "flyerhzm"
  u.password_confirmation "flyerhzm"
  u.email "flyerhzm@gmail.com"
end

Factory.define :richard, :parent => :user do |u|
  u.login "richard"
  u.email "richard@ekohe.com"
  u.password "richard"
  u.password_confirmation "richard"
end

Factory.define :invalid_user, :class => User do |u|
end
