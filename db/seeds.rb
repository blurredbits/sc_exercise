unless User.exists?(email: "admin@sc_exercise.com")
  User.create!(email: "admin@sc_exercise.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@sc_exercise.com")
  User.create!(email: "viewer@sc_exercise.com", password: "password")
end

["Regal Air Parts", "Parker Hannifin"].each do |name|
  unless Company.exists?(name: name)
    Company.create!(name: name, admin: User.find_by_email("admin@sc_exercise.com"))
  end
end
