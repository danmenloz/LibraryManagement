# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

libraries = Library.create(name: "Hunt", university: "NC State University", location: "Centennial Campus", max_days: 7, overdue_fines: 0.75)

users = User.create(level: "admin", email: "admin@ncsu.edu", name: "Test Admin", password: "admin123")
users = User.create(level: "librarian", email: "librarian@ncsu.edu", name: "Test Librarian", password: "librarian", library_id: 1)
users = User.create(level: "student", email: "student@ncsu.edu", name: "Test Student", password: "student1", ed_level: "Masters", university: "NC State University")