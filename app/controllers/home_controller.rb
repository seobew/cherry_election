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
      article_relationship = Userfavor.find_by(article_id: params[:article],user_id: current_user)
      if article_relationship.nil?
        temp_userfavor = Userfavor.create(article_id: params[:article], user_id: current_user, check_like: true, check_unlike: false)
        article=Article.find(params[:article])
        article.like= article.like + 1
        article.save
      else
        message = "이미 좋아요를 누르셨습니다."
      end
    end
    redirect_to home_index_path
  end
  
  def unlike
    if !current_user
      message = "로그인을 하신 후에 이용해주세요."
    else
      article_relationship = Userfavor.find_by(article_id: params[:article])
      if article_relationship.nil?
        temp_userfavor = Userfavor.create(article_id: params[:article], user_id: current_user, check_like: true, check_unlike: false)
        temp_userfavor.save
        article=Article.find(params[:article])
        article.unlike= article.unlike + 1
        article.save
      else
        message = "이미 싫어요를 누르셨습니다."
      end
    end
    redirect_to home_index_path
  end
  
  def candidate
    @candidate=Candidate.find(params[:candidate_id])
    
    
    
    
  end
end
