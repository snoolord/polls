class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_id, presence: true
  validate :rigger


  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id).select("*")
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def rigger
    unless self.poll.author_id != self.user_id
      self.errors[:do] << "not answer your own poll"
    end
  end
end
