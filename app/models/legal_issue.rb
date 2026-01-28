class LegalIssue < ApplicationRecord
  has_many :legal_issue_sections
  has_many :sections, through: :legal_issue_sections
end
