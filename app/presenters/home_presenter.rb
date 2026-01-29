class HomePresenter
  def initialize(params)
    @params = params
  end

  def meaningless_query?
    return false unless @params[:query].present?

    query = @params[:query].downcase.strip
    return true if query.length < 2

    meaningless_words = ["a", "an", "the", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "do", "does", "did", "will", "would", "can", "could", "should", "may", "might", "must", "shall", "and", "or", "but", "if", "then", "else", "when", "where", "how", "why", "what", "who", "test", "hello", "hi", "ok", "yes", "no", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    words = query.split(/\s+/)
    return true if words.all? { |w| meaningless_words.include?(w) }

    false
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