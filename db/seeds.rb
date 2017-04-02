# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.create(title: "sample_title", like:3, unlike:2, link:"sample_link")
Candidate.create(name: "문재인", party: "더불어민주당", link: "http://moonjaein.com/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)