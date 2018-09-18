# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Quinn", email: "qdizon@email.com", password: "123", authorization: 0)
User.create(name: "Betsy", email: "bdizon@email.com", password: "123", authorization: 1)
User.create(name: "Rafe", email: "rdizon@email.com", password: "123", authorization: 2)
