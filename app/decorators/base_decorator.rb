# frozen_string_literal: true

module BaseDecorator
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ApplicationHelper

  def show_created_at
    l created_at
  end

  def show_updated_at
    l updated_at
  end

  def render_none
    ""
  end
end
