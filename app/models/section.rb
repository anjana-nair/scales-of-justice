class Section < ApplicationRecord
  belongs_to :act
  has_many :legal_issue_sections
  has_many :legal_issues, through: :legal_issue_sections
end
