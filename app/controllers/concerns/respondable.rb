module Respondable
  extend ActiveSupport::Concern

  def render_to_string_html(partial, **options)
    render_to_string(
      partial: partial, layout: false, locals: options
    )
  end

  def respond_include_json(**options)
    respond_to do |format|
      format.html
      format.json do
        render json: options, status: :ok
      end
      format.js
    end
  end

  def respond_index_json(partial, sub_partial)
    respond_include_json(html: render_to_string_html(partial), sub_html: render_to_string_html(sub_partial))
  end
end
