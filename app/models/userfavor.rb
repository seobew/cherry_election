class Userfavor < ActiveRecord::Base
    belongs_to :user
    belongs_to :article
end
