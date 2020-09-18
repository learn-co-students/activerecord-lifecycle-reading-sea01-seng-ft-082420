class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  # before_save happens after validations
  # before _validation happens, well... before validations
  # whenever you are modifying an attribute of the model, use 'before_validation'
  before_validation :make_title_case

  # action takes place after validation to send email about post, if and only if it was valid
  # before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
