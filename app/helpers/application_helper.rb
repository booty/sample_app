# frozen_string_literal: true

module ApplicationHelper
  def title_with_separator(title)
    return "#{title} |" if title.present?

    ''
  end
end
