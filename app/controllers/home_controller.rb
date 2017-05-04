require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'

class HomeController < ApplicationController
  def index
    @page = params[:page]
    if @page.nil?
      @page=1
    end
    @page = @page.to_i

    article_num = Article.all.size
    @article_index = (article_num/10)+1

    @message = params[:message]
    @candidates = Candidate.all
    @candidate = @candidates.sample
    @articles = Article.all.sort_by {|a| (-a.like + a.unlike)}
    @articles = @articles[0+10*(@page-1)..9+10*(@page-1)]
    if @articles.nil?
      @articles=[]
    end
  end

  def like
    @is_cancel = params[:is_cancel]
    @article_id = params[:article]
    @unlike_check = false
    @login =true
    if !current_user
      @login =false
    else
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user.id)
      if @is_cancel=="true"
        # 좋아요 취소 부분
        unless article_relationship.nil?
          article_relationship.check_like = false
          article_relationship.save
          article=Article.find(params[:article])
          article.like = article.like - 1
          article.save
        end
      else
        # 좋아요 부분
        if article_relationship.nil?
          temp_userfavor = Userfavor.create(article_id: params[:article], user_id: current_user.id, check_like: true, check_unlike: false)
          article=Article.find(params[:article])
          article.like= article.like + 1
          article.save
        else
          article=Article.find(params[:article])
          if article_relationship.check_unlike
            article.unlike= article.unlike - 1
            @unlike_check=true
          end
          article_relationship.check_like = true
          article_relationship.check_unlike = false
          article_relationship.save
          article.like= article.like + 1
          article.save
        end
      end
      @like_num = article.like
      @unlike_num = article.unlike
    end

    respond_to do |format|
      format.js
    end
  end

  def unlike
    @article_id = params[:article]
    @is_cancel = params[:is_cancel]
    @like_check = false
    @login =true
    if !current_user
      @login = false
    else
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user.id)
      if @is_cancel=="true"
        # 싫어요 취소 부분
        unless article_relationship.nil?
          article_relationship.check_unlike = false
          article_relationship.save
          article=Article.find(params[:article])
          article.unlike = article.unlike - 1
          article.save
        end
      else
        # 싫어요 부분
        if article_relationship.nil?
          temp_userfavor = Userfavor.create(article_id: params[:article], user_id: current_user.id, check_like: false, check_unlike: true)
          article=Article.find(params[:article])
          article.unlike= article.unlike + 1
          article.save
        else
          article=Article.find(params[:article])
          if article_relationship.check_like
            article.like= article.like - 1
            @like_check = true
          end
          article_relationship.check_unlike = true
          article_relationship.check_like = false
          article_relationship.save
          article.unlike= article.unlike + 1
          article.save
        end
      end
      @like_num = article.like
      @unlike_num = article.unlike
    end
    respond_to do |format|
      format.js
    end
  end

  def candidate
    @candidate=Candidate.find(params[:candidate_id])
    @rank_in_order = Candidate.order(:rank).reverse.index(@candidate) + 1
    @rate = @candidate.rank

    #@articles = Article.all
    #@articles = Article.find_by(candidate_id: params[:candidate_id])
    @articles = @candidate.articles.sort_by {|a| (-a.like + a.unlike)}

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
  end

  def search

    candi_name = ["문재인", "홍준표", "안철수", "유승민", "심상정", "조원진", "오영국", "장성민", "이재오", "김선동", "남재준", "이경희", "이경희", "윤홍식", "김민찬"]

    #name = 검색할 후보자 이름

    #num = 페이지 수
    num = 0

    #post = 신문사 번호
    #0 : 한겨레, 1 : 조선일보, 2 : 중앙일보, 3 : 동아일보, 4 : 경향신문, 5 : 서울신문, 6 : jtbc
    #post = 6


    for name in candi_name

      for post in 0..6
        article = Article.new

        cand = Candidate.where(name: name)
        de_name = CGI::escape(name)

        if post == 0
          one = Nokogiri::HTML(open("http://search.hani.co.kr/Search?command=query&keyword=#{de_name}&media=news&sort=d&period=all&pageseq=#{num}"))
          t = one.xpath("//dt//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "한겨레"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        elsif post == 1
          one = Nokogiri::HTML(open("http://search.chosun.com/search/news.search?query=#{de_name}&pageno=#{num}&orderby=&naviarraystr=&kind=&cont1=&cont2=&cont5=&categoryname=&categoryd2=&c_scope=news&sdate=&edate=&premium="))
          t = one.xpath("//dt//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "조선일보"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        elsif post == 2
          one = Nokogiri::HTML(open("http://search.joins.com/JoongangNews?page=#{num}&Keyword=#{de_name}&SortType=New&SearchCategoryType=JoongangNews"))
          t = one.xpath("//strong[@class='headline mg']//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "중앙일보"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        elsif post == 3
          donga_num = num * 15 + 1
          one = Nokogiri::HTML(open("http://news.donga.com/search?p=#{donga_num}&query=#{de_name}&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"))
          t = one.xpath("//p[@class='tit']//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "동아일보"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        elsif post == 4
          num = num + 1
          one = Nokogiri::HTML(open("http://search.khan.co.kr/search.html?stb=khan&q=#{de_name}&sort=1&pg=#{num}"))
          t = one.xpath("//dl[@class='phArtc']//dt//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "경향신문"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        elsif post == 5
          num = num + 1
          one = Nokogiri::HTML(open("http://search.seoul.co.kr/index.php?scope=&sort=desc&cpCode=&period=&sDate=&eDate=&keyword=#{de_name}&iCategory=&pCategory=undefined&pageNum=#{num}"))
          t = one.xpath("//dl[@class='article']//dt//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "서울일보"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        elsif post == 6
          num = num + 1
          one = Nokogiri::HTML(open("http://jtbc.joins.com/search/news?source=jtbc&field=any&page=#{num}&section=any&sort=latest&term=#{de_name}"))
          t = one.xpath("//h3[@class='prg_ttl']//a")
          t.each do |i|
            article.title =  i.inner_text
            article.publisher = "JTBC"
            article.link = puts i['href']
            article.candidates = cand
            article.save
          end
        end
      end

    end




  end

end
