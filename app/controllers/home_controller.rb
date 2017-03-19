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
end
