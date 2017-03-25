require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'

class HomeController < ApplicationController
  def index
    @message = params[:message]
    @candidates = Candidate.all
    @articles = Article.all
  end
  
  def like
    if !current_user
      message = "로그인을 하신 후에 이용해주세요."
    else
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user.id)
      if article_relationship.nil?
        temp_userfavor = Userfavor.create(article_id: params[:article], user_id: current_user.id, check_like: true, check_unlike: false)
        article=Article.find(params[:article])
        article.like= article.like + 1
        article.save
      else
        article=Article.find(params[:article])
        if article_relationship.check_unlike
          article.unlike= article.unlike - 1  
        end
        article_relationship.check_like = true
        article_relationship.check_unlike = false
        article_relationship.save
        article.like= article.like + 1
        article.save
      end
    end
    redirect_to home_index_path
  end
  
  def like_cancel
    if !current_user
      message = "로그인을 하신 후에 이용해주세요."
    else
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user.id)
      if article_relationship.nil?
      else
        article_relationship.check_like = false
        article_relationship.save
        article=Article.find(params[:article])
        article.like = article.like - 1
        article.save
      end
    end
    redirect_to home_index_path
  end
  
  def unlike
    if !current_user
      message = "로그인을 하신 후에 이용해주세요."
    else
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user.id)
      if article_relationship.nil?
        temp_userfavor = Userfavor.create(article_id: params[:article], user_id: current_user.id, check_like: false, check_unlike: true)
        article=Article.find(params[:article])
        article.unlike= article.unlike + 1
        article.save
      else
        article=Article.find(params[:article])
        if article_relationship.check_like
          article.like= article.like - 1  
        end
        article_relationship.check_unlike = true
        article_relationship.check_like = false
        article_relationship.save
        article.unlike= article.unlike + 1
        article.save
      end
    end
    redirect_to home_index_path
  end
  
  def unlike_cancel
    if !current_user
      message = "로그인을 하신 후에 이용해주세요."
    else
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user.id)
      if article_relationship.nil?
      else
        article_relationship.check_unlike = false
        article_relationship.save
        article=Article.find(params[:article])
        article.unlike = article.unlike - 1
        article.save
      end
    end
    redirect_to home_index_path
  end
  
  def candidate
    @candidate=Candidate.find(params[:candidate_id])
    
    # wordcloud용 array
    @texts =[]
    @weights = []
    if @candidate.keyword
      word_weight_set=@candidate.keyword.split(",")
      
      for s in word_weight_set
        @texts.push(s.split(":")[0])
        @weights.push(s.split(":")[1].to_i)
      end
    end

    # 지지율 크롤링
    board = Nokogiri::HTML(open("http://www.gallup.co.kr/gallupdb/report.asp"))
    # t = board.at('span:contains("2017")')
    t = board.search "[text()*='지지도']"
    link_text =  t.first.parent["href"]
    board2 = Nokogiri::HTML(open("http://www.gallup.co.kr/gallupdb/#{link_text}"))
    tt = board2.search "[text()*='대선 후보 지지도:']"
    tt = tt.text
    name_index = tt.index(@candidate.name)
    ttt = tt[name_index+3..name_index+6]
    @rate = ttt.to_i
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
