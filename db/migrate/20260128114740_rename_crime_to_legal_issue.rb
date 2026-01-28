class RenameCrimeToLegalIssue < ActiveRecord::Migration[7.2]
  def change
    rename_table :crimes, :legal_issues
    rename_table :crime_sections, :legal_issue_sections
    rename_column :legal_issue_sections, :crime_id, :legal_issue_id
  end
end
