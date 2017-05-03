# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.create(name: "문재인", number:1, image:"moonjaein.png",  caricature:"moonjaein_c.png", party: "더불어민주당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416205303235_1.pdf&rs=/preview/html/20170428/", keyword: "멱살:2650,1번가:3055,천안:3725,성남:3425,유세차량사고:4552,사고:3413,문재수:3325,정책본부:4026,하하하:3089,이명박:4026,차별:5000,일자리:5012,탄핵:3046,정권교체:4022,적폐:500, 정치개혁:4500, 적폐청산:3000, 안보/외교:4500, 청년복지:2000, 성평등:1500, 노인복지:2000, 육아/교육:2500, 소상공보호:2800, 안전/건강:2000", rank: 40.2, rank1ago: 36.2, rank2ago: 40.1, rank3ago: 42.0)
Candidate.create(name: "홍준표", number:2, image:"hongjunpyo.png", caricature:"hongjunpyo_c.png", party: "자유한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202457827_1.pdf&rs=/preview/html/20170428/", keyword: "빅데이터트랜드분석:3190,빅데이터트랜드:3650,방송기자클럽초청회:2883,문재인1번가:2113,홍준표서문시장:2058,유승민학력:1786, 위키리스크:1423,희열:804,청와대:3000,가산점:2012,그리스:300,재판:100, 돼지흥분제:2000,사람:1000,좌파:1011,탄핵:800,안보/외교:4000, 기업/일자리:4000, 맞춤형복지:2000, 교육:2200, 사회안전망:1500, 소상공보호:1500, 부패척결:1500, 환경:1200, 4차산업혁명:3800, 저출산/청년:2000", rank: 16.2, rank1ago: 12.6, rank2ago: 12.2, rank3ago: 8.5)
Candidate.create(name: "안철수", number:3, image:"ahnchulsoo.png", caricature:"ahnchulsoo_c.png",party: "국민의당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202520641_1.pdf&rs=/preview/html/20170428/", keyword: "구글빅데이터:4175,안철수부산유세:2011,mb아바타:1970,안철수딸안설희:1870,안철수가사도우미:1729,hermuhan@naver.com:1661,안철수광화문:1611,미세먼지:500,대기업:1006,육성:2034,4차산업:3000,집권:2066,정치인:2041,책임:300,개헌:1028,안보:1021,일자리:3000, 자강안보:3800, 교육/과학:4000, 공정경제:3500, 미래일자리:2000, 정치혁신:3800, 사회안전망:2000, 성평등:1500, 국민안전:1800, 환경/문화:1000, 농어촌:1000 ", rank: 19.7, rank1ago: 24.7, rank2ago: 25.2, rank3ago: 31.8)
Candidate.create(name: "유승민", number:4, image:"yoosungmin.png",  caricature:"yoosungmin_c.png", party: "바른정당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202627405_1.pdf&rs=/preview/html/20170428/", keyword: "문재인학력:2920,안철수고향:1886,안철수학력:1822,손석희:394,유승민종교:100,손석희나이:83,유승민유담:2080,태도:390,계산:400,공격:90,중부담:2520,비정규직:1400,보수:854,승복:644,사드:934, 출산/보육:1000, 노동개혁:1200, 공동체복지:1500, 공정경제:3400, 중소/자영업:2000, 안전/건강:1000, 국방/안보:3400, 미래교육:2300, 주거복지:1200, 정치혁명:3100", rank: 5.1, rank1ago: 5.5, rank2ago: 4.6, rank3ago: 3.9)
Candidate.create(name: "심상정", number:5, image:"simsangjum.png",  caricature:"simsangjum_c.png", party: "정의당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416202644667_1.pdf&rs=/preview/html/20170428/", keyword: "심상정내각제:3100,안철수고향:2416,손석희:155,심상정종교:166,유승민학력:52,손석희나이:50,안철수학력:50,정직:300,굳세어라:1000,시중노임:1045,포괄임금:2000,존중:2000, 정치개혁:3800, 평화/안보:3600, 경제정의:2300, 고용안정:3800, 성평등:2300, 서민복지:2100, 보건/노후:1600, 교육과학:1000, 환경/문화:800, 소수자:600", rank: 8.4, rank1ago: 8.6, rank2ago: 5.5, rank3ago: 3.6)
Candidate.create(name: "조원진", number:6, image:"jowongin.png",  caricature:"jowongin_c.png",party: "새누리당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416214724938_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "오영국", number:7, image:"ohyeonggunk.png",  caricature:"ohyeonggunk_c.png", party: "경제애국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170418142241347_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "장성민", number:8, image:"jangsunmin.png",  caricature:"jangsunmin_c.png",party: "국민대통합당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416210818978_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "이재오", number:9, image:"leejaeoh.png",  caricature:"leejaeoh_c.png",party: "늘푸른한국당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416215626717_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "김선동", number:10, image:"kimsundong.png", caricature:"kimsundong_c.png", party: "민중연합당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211016915_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "이경희", number:12, image:"leekyunghee.png", caricature:"leekyunghee_c.png", party: "한국국민당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211132932_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "윤홍식", number:14, image:"yoonhongsick.png", caricature:"yoonhongsick_c.png", party: "홍익당", link: "http://policy.nec.go.kr/skin/doc.html?fn=20170416211303694_1.pdf&rs=/preview/html/20170428/", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)
Candidate.create(name: "김민찬", number:15, image:"kimminchan.png", caricature:"kimminchan_c.png", party: "무소속", link: "http://blog.naver.com/new-kimminchan?Redirect=Log&logNo=220967007508", keyword: "키워드 없음:3000", rank: 0.01, rank1ago: 0.01, rank2ago: 0.01, rank3ago: 0.01)