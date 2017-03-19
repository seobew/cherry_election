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
  end
end
