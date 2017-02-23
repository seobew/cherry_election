class CreateJoinTableArticlesCandidates < ActiveRecord::Migration
  def change
    create_join_table :articles, :candidates do |t|
      # t.index [:article_id, :candidate_id]
      # t.index [:candidate_id, :article_id]
    end
  end
end
