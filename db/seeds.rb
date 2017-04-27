# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.create(title: "sample_title", like:3, unlike:2, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Article.create(title: "sample_title", like:5, unlike:1, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Article.create(title: "sample_title", like:12, unlike:30, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Article.create(title: "sample_title", like:44, unlike:5, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Article.create(title: "sample_title", like:100, unlike:3, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Article.create(title: "sample_title", like:33, unlike:21, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Article.create(title: "sample_title", like:1, unlike:2, link:"sample_link", publisher: "publisher_sample", article_date: "date_sample")
Candidate.create(name: "문재인", number:1, image:"moonjaein.jpg", party: "더불어민주당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416205303235_1.pdf&rs=/preview/html/201704/", keyword: "멱살:6650,1번가:9055,천안:5725,성남:5425,유세차량사고:4552,사고:3413,문재수:3325,정책본부:4026,하하하:3089,이명박:4026,차별:5000,일자리:5012,탄핵:3046,정권교체:4022,적폐:500", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "홍준표", number:2, image:"hongjunpye.jpg", party: "자유한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202457827_1.pdf&rs=/preview/html/201704/", keyword: "빅데이터트랜드분석:4190,빅데이터트랜드:3650,방송기자클럽초청회:2883,문재인1번가:2113,홍준표서문시장:2058,유승민학력:1786, 위키리스크:1423,희열:804,청와대:3000,가산점:2012,그리스:300,재판:100, 돼지흥분제:4444,사람:1000,좌파:1011,탄핵:800", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "안철수", number:3, image:"ann.jpg", party: "국민의당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202520641_1.pdf&rs=/preview/html/201704/", keyword: "구글빅데이터:4175,안철수부산유세:2011,mb아바타:1970,안철수딸안설희:1870,안철수가사도우미:1729,hermuhan@naver.com:1661,안철수광화문:1611,미세먼지:500,대기업:1006,육성:2034,4차산업:3000,집권:2066,정치인:2041,책임:300,개헌:1028,안보:1021,일자리:3000 ", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "유승민", number:4, image:"yoosungmin.jpg", party: "바른정당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202627405_1.pdf&rs=/preview/html/201704/", keyword: "문재인학력:2920,안철수고향:1886,안철수학력:1822,손석희:394,유승민종교:100,손석희나이:83,유승민유담:2080,태도:390,계산:400,공격:90,중부담:2520,비정규직:1400,보수:854,승복:644,사드:934", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "심상정", number:5, image:"simsanjum.jpg", party: "정의당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202644667_1.pdf&rs=/preview/html/201704/", keyword: "심상정내각제:4075,안철수고향:2416,손석희:155,심상정종교:166,유승민학력:52,손석희나이:50,안철수학력:50,정직:300,굳세어라:1000,시중노임:1045,포괄임금:2000,존중:2000", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "조원진", number:6, image:"joowangin.jpg", party: "새누리당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416214724938_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "오영국", number:7, image:"ohyunggunk.jpg", party: "경제애국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416210716206_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "장성민", number:8, image:"jangsunmin.jpg", party: "국민대통합당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416210818978_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "이재오", number:9, image:"leejaeoh.jpg", party: "늘푸른한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416215626717_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김선동", number:10, image:"kimsundong.jpg", party: "민중연합당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211016915_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "남재준", number:11, image:"namjaejune.jpg", party: "통일한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211057817_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "이경희", number:12, image:"leekyunghee.jpg", party: "한국국민당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211132932_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김정선", number:13, image:"kimjungsun.jpg", party: "한반도미래연합", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211229747_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "윤홍식", number:14, image:"yoonhongsick.jpg", party: "홍익당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211303694_1.pdf&rs=/preview/html/201704/", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
Candidate.create(name: "김민찬", number:15, image:"kimminchan.jpg", party: "무소속", link: "http://blog.naver.com/new-kimminchan?Redirect=Log&logNo=220967007508", rank: 31, rank1ago: 33, rank2ago: 32, rank3ago: 34)
