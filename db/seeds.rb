# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Acts
ipc = Act.find_or_create_by!(name: "Indian Penal Code", short_name: "IPC")
crpc = Act.find_or_create_by!(name: "Code of Criminal Procedure", short_name: "CrPC")
ica = Act.find_or_create_by!(name: "Indian Contract Act", short_name: "ICA")
hma = Act.find_or_create_by!(name: "Hindu Marriage Act", short_name: "HMA")
constitution = Act.find_or_create_by!(name: "Constitution of India", short_name: "COI")
mva = Act.find_or_create_by!(name: "Motor Vehicles Act", short_name: "MVA")
tpa = Act.find_or_create_by!(name: "Transfer of Property Act", short_name: "TPA")
iea = Act.find_or_create_by!(name: "Indian Evidence Act", short_name: "IEA")
sra = Act.find_or_create_by!(name: "Specific Relief Act", short_name: "SRA")

# Sections for IPC
murder_sec = Section.find_or_create_by!(act: ipc, number: "302", description: "Punishment for murder")
attempt_murder_sec = Section.find_or_create_by!(act: ipc, number: "307", description: "Attempt to murder")
theft_sec = Section.find_or_create_by!(act: ipc, number: "378", description: "Theft")
robbery_sec = Section.find_or_create_by!(act: ipc, number: "390", description: "Robbery")

# Sections for CrPC
arrest_sec = Section.find_or_create_by!(act: crpc, number: "41", description: "When police may arrest without warrant")

# Sections for ICA
breach_sec = Section.find_or_create_by!(act: ica, number: "73", description: "Compensation for loss or damage caused by breach of contract")

# Sections for HMA
divorce_sec = Section.find_or_create_by!(act: hma, number: "13", description: "Divorce")

# Sections for Constitution
rights_sec = Section.find_or_create_by!(act: constitution, number: "Article 14", description: "Right to Equality")

# Sections for MVA
accident_sec = Section.find_or_create_by!(act: mva, number: "140", description: "Liability without fault in certain cases")

# Sections for TPA
sale_sec = Section.find_or_create_by!(act: tpa, number: "54", description: "Sale of immovable property")

# Sections for IEA
oral_sec = Section.find_or_create_by!(act: iea, number: "59", description: "Proof of facts by oral evidence")

# Sections for SRA
specific_sec = Section.find_or_create_by!(act: sra, number: "10", description: "Cases in which specific performance of contract enforceable")

# Legal Issues
murder_issue = LegalIssue.find_or_create_by!(name: "Murder", description: "Unlawful killing of a person", category: "criminal")
theft_issue = LegalIssue.find_or_create_by!(name: "Theft", description: "Taking someone else's property without permission", category: "criminal")
robbery_issue = LegalIssue.find_or_create_by!(name: "Robbery", description: "Theft with violence or threat", category: "criminal")
breach_issue = LegalIssue.find_or_create_by!(name: "Breach of Contract", description: "Failure to perform contractual obligations", category: "civil")
property_issue = LegalIssue.find_or_create_by!(name: "Sale of Property", description: "Transfer of immovable property", category: "civil")
evidence_issue = LegalIssue.find_or_create_by!(name: "Evidence in Court", description: "Rules for admitting evidence", category: "civil")
specific_issue = LegalIssue.find_or_create_by!(name: "Specific Performance", description: "Court order to perform contract", category: "civil")
divorce_issue = LegalIssue.find_or_create_by!(name: "Divorce", description: "Dissolution of marriage", category: "family")
rights_issue = LegalIssue.find_or_create_by!(name: "Fundamental Rights Violation", description: "Infringement of constitutional rights", category: "constitutional")
tort_issue = LegalIssue.find_or_create_by!(name: "Negligence", description: "Failure to exercise due care", category: "tort")

# Associations
LegalIssueSection.find_or_create_by!(legal_issue: murder_issue, section: murder_sec)
LegalIssueSection.find_or_create_by!(legal_issue: murder_issue, section: attempt_murder_sec)
LegalIssueSection.find_or_create_by!(legal_issue: theft_issue, section: theft_sec)
LegalIssueSection.find_or_create_by!(legal_issue: robbery_issue, section: robbery_sec)
LegalIssueSection.find_or_create_by!(legal_issue: robbery_issue, section: theft_sec)  # Since robbery includes theft
LegalIssueSection.find_or_create_by!(legal_issue: breach_issue, section: breach_sec)
LegalIssueSection.find_or_create_by!(legal_issue: property_issue, section: sale_sec)
LegalIssueSection.find_or_create_by!(legal_issue: evidence_issue, section: oral_sec)
LegalIssueSection.find_or_create_by!(legal_issue: specific_issue, section: specific_sec)
LegalIssueSection.find_or_create_by!(legal_issue: divorce_issue, section: divorce_sec)
LegalIssueSection.find_or_create_by!(legal_issue: rights_issue, section: rights_sec)
LegalIssueSection.find_or_create_by!(legal_issue: tort_issue, section: accident_sec)
