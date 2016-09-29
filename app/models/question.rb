class Question < ActiveRecord::Base
  validates :text, presence: true
  validates :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    count = Hash.new(0)
    a = self
      .answer_choices.joins("LEFT JOIN responses ON answer_choices.id = responses.answer_id")
      .group("answer_choices.id")
      .select("answer_choices.*, COUNT(responses.id)")
    a.each do |choices|
      count[choices.text] += choices.responses.length
    end
    count
  end
end
