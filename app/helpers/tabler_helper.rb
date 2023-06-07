module TablerHelper
  def alert_variant_class(type)
    { alert: 'alert-warning', notice: 'alert-success' }[type.to_sym] || type.to_s
  end
end
