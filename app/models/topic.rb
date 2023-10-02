class Topic < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_one_attached :image
  
  #def get_image
    #unless image.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpg')
    #end
     # image
  #end
  
end
