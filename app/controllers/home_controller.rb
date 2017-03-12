class HomeController < ApplicationController
  def index
    @candidates = Candidate.all
    @articles = Article.all
  end
  
  def like
    article=Article.find(params[:article])
    article.like= article.like + 1
    article.save
    puts 'here like called!'
    redirect_to "/"
  
  end
  
  def unlike
    article=Article.find(params[:article])
    puts article
    article.unlike=article.unlike + 1
    article.save
    puts 'unlike called!'
    redirect_to "/"
  end
  
  def candidate
    @candidate=Candidate.find(params[:candidate_id])
  end

  def search
    article = Article.new

    #name = 검색할 후보자 이름
    name = "이재명"

    cand = Candidate.where(name: name)

    #num = 페이지 수
    num = 0

    #post = 신문사 번호
    #0 : 한겨레, 1 : 조선일보, 2 : 중앙일보, 3 : 동아일보, 4 : 경향신문, 5 : 서울신문, 6 : jtbc
    post = 6

    de_name = CGI::escape(name)

    if post == 0
      one = Nokogiri::HTML(open("http://search.hani.co.kr/Search?command=query&keyword=#{de_name}&media=news&sort=d&period=all&datefrom=2000.01.01&dateto=2017.02.25&pageseq=#{num}"))
      t = one.xpath("//dt//a")
      t.each do |i|
        article.title =  i.inner_text
        article.link = puts i['href']
        article.save
      end
    elsif post == 1
      one = Nokogiri::HTML(open("http://search.chosun.com/search/news.search?query=#{de_name}&pageno=#{num}&orderby=&naviarraystr=&kind=&cont1=&cont2=&cont5=&categoryname=&categoryd2=&c_scope=news&sdate=&edate=&premium="))
      t = one.xpath("//dt//a")
      t.each do |i|
        article.title = i.inner_text
        article.link = i['href']
        article.save
      end
    elsif post == 2
      one = Nokogiri::HTML(open("http://search.joins.com/JoongangNews?page=#{num}&Keyword=#{de_name}&SortType=New&SearchCategoryType=JoongangNews"))
      t = one.xpath("//strong[@class='headline mg']//a")
      t.each do |i|
        puts i.inner_text
        puts i['href']
      end
    elsif post == 3
      donga_num = num * 15 + 1
      one = Nokogiri::HTML(open("http://news.donga.com/search?p=#{donga_num}&query=#{de_name}&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"))
      t = one.xpath("//p[@class='tit']//a")
      t.each do |i|
        puts i.inner_text
        puts i['href']
      end
    elsif post == 4
      num = num + 1
      one = Nokogiri::HTML(open("http://search.khan.co.kr/search.html?stb=khan&q=#{de_name}&sort=1&pg=#{num}"))
      t = one.xpath("//dl[@class='phArtc']//dt//a")
      t.each do |i|
        puts i.inner_text
        puts i['href']
      end
    elsif post == 5
      num = num + 1
      one = Nokogiri::HTML(open("http://search.seoul.co.kr/index.php?scope=&sort=desc&cpCode=&period=&sDate=&eDate=&keyword=#{de_name}&iCategory=&pCategory=undefined&pageNum=#{num}"))
      t = one.xpath("//dl[@class='article']//dt//a")
      t.each do |i|
        puts i.inner_text
        puts i['href']
      end
    elsif post == 6
      num = num + 1
      one = Nokogiri::HTML(open("http://jtbc.joins.com/search/news?source=jtbc&field=any&page=#{num}&section=any&sort=latest&term=#{de_name}"))
      t = one.xpath("//h3[@class='prg_ttl']//a")
      t.each do |i|
        puts i.inner_text
        puts i['href']
      end

    end

  end


end
