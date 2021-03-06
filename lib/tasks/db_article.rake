require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'
require 'date'

namespace :db_article do
  desc "TODO"
  task article_task: :environment do

    # candi_name = ["문재인", "홍준표", "안철수", "유승민", "심상정", "조원진", "오영국", "장성민", "이재오", "김선동", "이경희", "이경희", "윤홍식", "김민찬"]
    candi_name = []
    for c in Candidate.all
      candi_name.push(c.name)
    end
    puts candi_name

    #0 : 한겨레, 1 : 조선일보, 2 : 중앙일보, 3 : 동아일보, 4 : 경향신문, 5 : jtbc


    for name in candi_name

      desc "start #{name}"
      puts "start #{name}"

      for post in 0..5
        article = Article.new


        cand = Candidate.where(name: name)
        de_name = CGI::escape(name)

        desc "#{name} - #{post}"
        puts "#{name} - #{post}"

        if post == 0
          num = 0

          one = Nokogiri::HTML(open("http://search.hani.co.kr/Search?command=query&keyword=#{de_name}&media=news&sort=d&period=all&pageseq=#{num}"))
          t = one.xpath("//dt//a")
          t.each_with_index do |i, n|
            if Article.exists?(:link => i['href'])
              at = Article.find_by(link: i['href'])
              puts "중복기사 : #{at.title}, #{at.link}"
              cand_arr = Array.new
              at.candidates.each do |g|
                if g.name == name

                else
                  cand_arr << g.name
                end

              end
              cand_arr << name
              puts cand_arr.to_s
              at.candidates = Candidate.where(name: cand_arr)
              at.save
            else
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



          end

        elsif post == 1
          num = 0

          one = Nokogiri::HTML(open("http://search.chosun.com/search/news.search?query=#{de_name}&pageno=#{num}&orderby=news&categoryname=#{CGI::escape("조선일보")}"))
          t = one.xpath("//section[@class='result news']//dl//dt//a")
          t.each do |i|
            if Article.exists?(:link => i['href'])
              at = Article.find_by(link: i['href'])
              puts "중복기사 : #{at.title}, #{at.link}"
              cand_arr = Array.new
              at.candidates.each do |g|
                if g.name == name

                else
                  cand_arr << g.name
                end

              end
              cand_arr << name
              puts cand_arr.to_s
              at.candidates = Candidate.where(name: cand_arr)
              at.save
            else
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

          end
        elsif post == 2
          num = 0

          one = Nokogiri::HTML(open("http://search.joins.com/JoongangNews?page=#{num}&Keyword=#{de_name}&SortType=New&SearchCategoryType=JoongangNews"))
          t = one.xpath("//strong[@class='headline mg']//a")
          t.each_with_index do |i, n|
            if Article.exists?(:link => i['href'])
              at = Article.find_by(link: i['href'])
              puts "중복기사 : #{at.title}, #{at.link}"
              cand_arr = Array.new
              at.candidates.each do |g|
                if g.name == name

                else
                  cand_arr << g.name
                end

              end
              cand_arr << name
              puts cand_arr.to_s
              at.candidates = Candidate.where(name: cand_arr)
              at.save
            else
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

          end
        elsif post == 3
          num = 0

          donga_num = num * 15 + 1
          one = Nokogiri::HTML(open("http://news.donga.com/search?p=#{donga_num}&query=#{de_name}&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"))
          t = one.xpath("//p[@class='tit']//a[0]")
          t.each_with_index do |i, n|
            if Article.exists?(:link => i['href'])
              at = Article.find_by(link: i['href'])
              puts "중복기사 : #{at.title}, #{at.link}"
              cand_arr = Array.new
              at.candidates.each do |g|
                if g.name == name

                else
                  cand_arr << g.name
                end

              end
              cand_arr << name
              puts cand_arr.to_s
              at.candidates = Candidate.where(name: cand_arr)
              at.save
            else
              a = one.xpath("//p[@class='tit']//span")[n].inner_text + '+09:00'
              article.title =  i.inner_text
              article.publisher = "동아일보"
              article.link = i['href']
              article.candidates = cand
              article.article_date = DateTime.parse(a)
              article.like = 0
              article.unlike = 0
              article.save
            end

          end
        elsif post == 4
          num = 0

          num = num + 1
          one = Nokogiri::HTML(open("http://search.khan.co.kr/search.html?stb=khan&q=#{de_name}&sort=1&pg=#{num}"))
          t = one.xpath("//dl[@class='phArtc']//dt//a")
          t.each_with_index do |i, n|
            if Article.exists?(:link => i['href'])
              at = Article.find_by(link: i['href'])
              puts "중복기사 : #{at.title}, #{at.link}"
              cand_arr = Array.new
              at.candidates.each do |g|
                if g.name == name

                else
                  cand_arr << g.name
                end

              end
              cand_arr << name
              puts cand_arr.to_s
              at.candidates = Candidate.where(name: cand_arr)
              at.save
            else
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

          end
=begin
        elsif post == 5
          num = 0

          num = num + 1
          #http://search.seoul.co.kr/index.php?scope=&sort=desc&cpCode=seoul&period=&sDate=&eDate=&keyword=%EC%8B%AC%EC%83%81%EC%A0%95&iCategory=&pCategory=undefined&pageNum=2
          one = Nokogiri::HTML(open("http://search.seoul.co.kr/index.php?scope=&sort=desc&cpCode=seoul&period=&sDate=&eDate=&keyword=#{de_name}&iCategory=&pCategory=undefined&pageNum=#{num}"))
          t = one.xpath("//dl[@class='article']//dt//a")
          t.each do |i|
            two = Nokogiri::HTML(open(i['href']))
            m = two.xpath("//p[@class='v_days']").inner_text.split('ㅣ')[0].to_s.delete "입력"
            article.title =  i.inner_text
            article.publisher = "서울일보"
            article.link = i['href']
            article.candidates = cand
            puts i.inner_text
            puts i['href']
            article.article_date = DateTime.parse(m[9..24] + '+09:00')
            article.like = 0
            article.unlike = 0
            article.save
          end
=end
        elsif post == 5
          num = 0

          num = num + 1
          one = Nokogiri::HTML(open("http://jtbc.joins.com/search/news?source=jtbc&field=any&page=#{num}&section=any&sort=latest&term=#{de_name}"))
          t = one.xpath("//h3[@class='prg_ttl']//a")
          t.each do |i|
            if Article.exists?(:link => i['href'])
              at = Article.find_by(link: i['href'])
              puts "중복기사 : #{at.title}, #{at.link}"
              cand_arr = Array.new
              at.candidates.each do |g|
                if g.name == name

                else
                  cand_arr << g.name
                end

              end
              cand_arr << name
              puts cand_arr.to_s
              at.candidates = Candidate.where(name: cand_arr)
              at.save
            else
              two = Nokogiri::HTML(open(i['href']))
              m = two.xpath("//span[@class='i_date']").inner_text.to_s.delete "입력"
              article.title =  i.inner_text
              article.publisher = "JTBC"
              article.link = i['href']
              article.candidates = cand
              article.article_date = DateTime.parse(m+ '+09:00')
              article.like = 0
              article.unlike = 0
              article.save
            end

          end
        end
      end

    end

    desc "finish!"
    puts "finish!"

  end

end
