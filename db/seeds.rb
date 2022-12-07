# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user1 = User.create(username: "Steven", password: "steven")
user2 = User.create(username: "Cristal", password: "cristal")
user3 = User.create(username: "Mother", password: "mother")
user4 = User.create(username: "Father", password: "father")

Friendship.create(user_id: 2, friend_id: 1)
# Friendship.create(user_id: 2, friend_id: 3)
# Friendship.create(user_id: 2, friend_id: 4)