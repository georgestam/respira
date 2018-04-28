# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Article.destroy_all
Story.destroy_all

admin = User.new({

    email: "jordi@respira.io",
    password: "password",
    name: "jordi",
    admin: true
    })

admin.save!

url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"

articles = []
5.times do
  title = Faker::ChuckNorris.fact
  articles << Article.create!({
    title: title,
    description: Faker::Lorem.paragraphs,
    locale: "en"
    })
end

article = Article.first
article.photo = url
article.save!

stories = []
5.times do
  title = Faker::ChuckNorris.fact
  stories << Story.create!({
    title: title,
    description: Faker::Lorem.paragraphs,
    locale: "en"
    })
end

stories = Story.first
stories.photo = url
stories.save!
