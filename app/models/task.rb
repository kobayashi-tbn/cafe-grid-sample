class Task < ActiveRecord::Base

  before_update :print_params


  private

  def print_params
    p "==self.changed?==#{self.changed?}"
    p "==#{self.changed_attributes}========"
    p "==#{self.changes}========"
    p "--title_changed?===#{title_changed?}"
    p "--title_was===#{title_was}"
    p "--title===#{title}"
    p "--title_change===#{title_change}"
    p "--#{attributes_before_type_cast} === [#{limit_on}]"
  end

end
