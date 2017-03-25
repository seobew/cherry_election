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
end
