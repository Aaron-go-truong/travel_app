module Respondable
  extend ActiveSupport::Concern

  def render_to_string_html(partial = 'plan', **options)
    render_to_string(
      partial:, layout: false, locals: options
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

  def respond_index_json(partial = 'plan')
    respond_include_json(html: render_to_string_html(partial))
  end

  def render_json_success(hash, status = :ok)
    render json: hash, status:
  end
end
