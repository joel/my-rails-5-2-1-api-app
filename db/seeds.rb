# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def valid?
  unless yield.valid?
    puts("Errors: [#{yield.class.name}] => #{yield.errors.full_messages}")
    binding.pry
    exit(1)
  end
end

puts("Add Todo")

todo = Todo.create_with({
  owner: 'John Doe'
}).find_or_create_by({
  title: 'Bucket List'
})
valid? { todo }

puts("Add Item")

item = Item.create_with({
  todo: todo
}).find_or_create_by({
  title: 'Tricycle'
})
valid? { item }

puts("End!...")