User.create!(
        email: 'admin@example.com',
        password: '12345678',
        name: '阿明',
        description: '管理員帳號',
        role: 'admin'
        )
puts "Admin generated!"

Category.destroy_all
5.times do 
  Category.create!(
    name: FFaker::Food.fruit
    )
end
