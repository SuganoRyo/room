# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
greenhouses = [
  { name: '東京ホテル', introduction: "立地が良いです", price: 10000, address: "東京都渋谷区", image: "イメージです"  },
  { name: '大阪ホテル', introduction: "立地が良いです", price: 20000, address: "大阪府大阪市", image: "イメージです"  },
  { name: '京都ホテル', introduction: "立地が良いです", price: 30000, address: "京都府京都市", image: "イメージです"  },
  { name: '札幌ホテル', introduction: "立地が良いです", price: 40000, address: "北海道札幌市", image: "イメージです"  },
]
Greenhouse.create(greenhouses)