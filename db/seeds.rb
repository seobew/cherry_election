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
Candidate.create(name: "문재인", party: "더불어민주당", link: "http://moonjaein.com/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "안철수", party: "국민의당", link: "http://ahncs.kr/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "손학규", party: "국민의당", link: "http://www.hq.or.kr/main/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "박주선", party: "국민의당", link: "http://www.parkjoosun.pe.kr/system/index_2017.php", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "유승민", party: "바른정당", link: "http://www.ysm21.com/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "심상정", party: "정의당", link: "http://www.minsim.or.kr/xe/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "이재오", party: "늘푸른한국당", link: "http://blog.naver.com/joywa", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김선동", party: "민중연합당", link: "https://twitter.com/sundongv", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김정선", party: "한반도미래연합", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김기천", party: "무소속", link: "http://blog.naver.com/PostView.nhn?blogId=drinventor&logNo=220954081049", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김환생", party: "무소속", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "장성민", party: "무소속", link: "http://blog.naver.com/lovesungmin10/220913675254", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "권정수", party: "무소속", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김민찬", party: "무소속", link: "http://blog.naver.com/new-kimminchan?Redirect=Log&logNo=220967007508", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "남재준", party: "무소속", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "안광희", party: "무소속", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김순권", party: "무소속", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "노남수", party: "무소속", link: "/", keyword: "국민:100,복지:80,변화:70,문화:60,성장:50,공존:10,경제민주화:10,안보:5", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
