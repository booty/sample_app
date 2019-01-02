module ApplicationHelper
  def title_with_separator(title)
      return "#{title} |" if title.present?

    ""
  end
end
