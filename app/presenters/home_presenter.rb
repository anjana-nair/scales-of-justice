class HomePresenter
  def initialize(params)
    @params = params
  end

  def acts_sections
    return @acts_sections if @acts_sections

    if @params[:branch].present?
      legal_issues = LegalIssue.where(category: @params[:branch])
      acts = legal_issues.joins(:sections).pluck(:act_id).uniq
      @acts_sections = {}
      acts.each do |act_id|
        act = Act.find(act_id)
        @acts_sections[act] = act.sections
      end
    end
    @acts_sections || {}
  end

  def legal_issues
    return @legal_issues if @legal_issues

    if @params[:query].present?
      scope = LegalIssue.all
      scope = scope.where(category: @params[:branch]) if @params[:branch].present?
      scope = scope.where("LOWER(name) LIKE ?", "%#{@params[:query].downcase}%")
      @legal_issues = scope
    end
    @legal_issues || LegalIssue.none
  end
end