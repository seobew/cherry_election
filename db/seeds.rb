# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.create(title: "sample_title", like:3, unlike:2, link:"sample_link")
Article.create(title: "sample_title", like:5, unlike:1, link:"sample_link")
Article.create(title: "sample_title", like:12, unlike:30, link:"sample_link")
Article.create(title: "sample_title", like:44, unlike:5, link:"sample_link")
Article.create(title: "sample_title", like:100, unlike:3, link:"sample_link")
Article.create(title: "sample_title", like:33, unlike:21, link:"sample_link")
Article.create(title: "sample_title", like:1, unlike:2, link:"sample_link")
Candidate.create(name: "문재인", number:1, image:"moonjaein.jpg", party: "더불어민주당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416205303235_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "홍준표", number:2, image:"hongjunpye.jpg", party: "자유한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202457827_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "안철수", number:3, image:"ann.jpg", party: "국민의당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202520641_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "유승민", number:4, image:"yoosungmin.jpg", party: "바른정당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202627405_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "심상정", number:5, image:"simsanjum.jpg", party: "정의당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202644667_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "조원진", number:6, image:"joowangin.jpg", party: "새누리당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416214724938_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "오영국", number:7, image:"ohyunggunk.jpg", party: "경제애국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416210716206_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "장성민", number:8, image:"jangsunmin.jpg", party: "국민대통합당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416210818978_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "이재오", number:9, image:"leejaeoh.jpg", party: "늘푸른한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416215626717_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김선동", number:10, image:"kimsundong.jpg", party: "민중연합당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211016915_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "남재준", number:11, image:"namjaejune.jpg", party: "통일한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211057817_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "이경희", number:12, image:"leekyunghee.jpg", party: "한국국민당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211132932_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김정선", number:13, image:"kimjungsun.jpg", party: "한반도미래연합", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211229747_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "윤홍식", number:14, image:"yoonhongsick.jpg", party: "홍익당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211303694_1.pdf&rs=/preview/html/201704/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김민찬", number:15, image:"kimminchan.jpg", party: "무소속", link: "http://blog.naver.com/new-kimminchan?Redirect=Log&logNo=220967007508", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
