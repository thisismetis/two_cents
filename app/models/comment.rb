let g:netrw_dirhistmax  =10
let g:netrw_dirhist_cnt =0
class Comment < ActiveRecord::Base
  belongs_to :discussion

  def self.recent
    order(created_at: :asc)
  end
end
