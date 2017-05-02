require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'
require 'date'

namespace :db_article do
  desc "TODO"
  task article_task: :environment do


    candi_name = ["문재인", "홍준표", "안철수", "유승민", "심상정", "조원진", "오영국", "장성민", "이재오", "김선동", "남재준", "이경희", "이경희", "윤홍식", "김민찬"]

    #name = 검색할 후보자 이름

    #num = 페이지 수
    num = 0

    #post = 신문사 번호
    #0 : 한겨레, 1 : 조선일보, 2 : 중앙일보, 3 : 동아일보, 4 : 경향신문, 5 : 서울신문, 6 : jtbc
    #post = 6


    for name in candi_name

      desc "start #{name}"
      puts "start #{name}"

      for post in 0..6
        article = Article.new

        cand = Candidate.where(name: name)
        de_name = CGI::escape(name)

        desc "#{name} - #{post}"
        puts "#{name} - #{post}"

        if post == 0
          one = Nokogiri::HTML(open("http://search.hani.co.kr/Search?command=query&keyword=#{de_name}&media=news&sort=d&period=all&pageseq=#{num}"))
          t = one.xpath("//dt//a")
          t.each_with_index do |i, n|
            a = one.xpath("//dd[@class='date']//dl//dd")[n].inner_text + '+09:00'
            article.title =  i.inner_text
            article.publisher = "한겨레"
            article.link = i['href']
            article.candidates = cand
            article.article_date =  DateTime.parse(a)
            article.like = 0
            article.unlike = 0
            article.save
          end

        elsif post == 1
          one = Nokogiri::HTML(open("http://search.chosun.com/search/news.search?query=#{de_name}&pageno=#{num}&orderby=news&categoryname=#{CGI::escape("조선일보")}"))
          t = one.xpath("//section[@class='result news']//dl//dt//a")
          t.each do |i|
            two = Nokogiri::HTML(open(i['href']))
            m = two.xpath("//div[@class='news_date']//div//p").inner_text.split('|')[0].to_s.delete "입력"

            article.title =  i.inner_text
            article.publisher = "조선일보"
            article.link = i['href']
            article.article_date = DateTime.parse(m[9..24]+ '+09:00')
            article.candidates = cand
            article.like = 0
            article.unlike = 0
            article.save
          end
        elsif post == 2
          one = Nokogiri::HTML(open("http://search.joins.com/JoongangNews?page=#{num}&Keyword=#{de_name}&SortType=New&SearchCategoryType=JoongangNews"))
          t = one.xpath("//strong[@class='headline mg']//a")
          t.each_with_index do |i, n|
            article.title =  i.inner_text
            article.publisher = "중앙일보"
            article.link = i['href']
            a = one.xpath("//span[@class='byline']//em")[2 * n + 1].inner_text + '+09:00'
            article.article_date = DateTime.parse(a)
            article.candidates = cand
            article.like = 0
            article.unlike = 0
            article.save
          end
        elsif post == 3
          donga_num = num * 15 + 1
          one = Nokogiri::HTML(open("http://news.donga.com/search?p=#{donga_num}&query=#{de_name}&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"))
          t = one.xpath("//p[@class='tit']//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "동아일보"
            article.link = i['href']
            article.candidates = cand
            article.like = 0
            article.unlike = 0
            article.save
          end
        elsif post == 4
          num = num + 1
          one = Nokogiri::HTML(open("http://search.khan.co.kr/search.html?stb=khan&q=#{de_name}&sort=1&pg=#{num}"))
          t = one.xpath("//dl[@class='phArtc']//dt//a")
          t.each_with_index do |i, n|
            a =  i.xpath("//dl[@class='phArtc']//dt//span[@class='date']")[n].inner_text.split('(')[1].split(')')[0].gsub(/[:.]/, ' ').split(' ')

            m = Array.new
            for p in a
              m << p.delete(' ').to_i
            end

            article.title =  i.inner_text
            article.publisher = "경향신문"
            article.link = i['href']
            article.candidates = cand
            article.article_date = DateTime.new(m[0],m[1],m[2],m[3],m[4],0, '+09:00')
            article.like = 0
            article.unlike = 0
            article.save
          end
        elsif post == 5
          num = num + 1
          one = Nokogiri::HTML(open("http://search.seoul.co.kr/index.php?scope=&sort=desc&cpCode=&period=&sDate=&eDate=&keyword=#{de_name}&iCategory=&pCategory=undefined&pageNum=#{num}"))
          t = one.xpath("//dl[@class='article']//dt//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "서울일보"
            article.link = i['href']
            article.candidates = cand
            article.like = 0
            article.unlike = 0
            article.save
          end
        elsif post == 6
          num = num + 1
          one = Nokogiri::HTML(open("http://jtbc.joins.com/search/news?source=jtbc&field=any&page=#{num}&section=any&sort=latest&term=#{de_name}"))
          t = one.xpath("//h3[@class='prg_ttl']//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "JTBC"
            article.link = i['href']
            article.candidates = cand
            article.like = 0
            article.unlike = 0
            article.save
          end
        end
      end

    end

    desc "finish!"
    puts "finish!"

  end

end
