module ByStar
  module InstanceMethods
    def previous(options={})
      field = options[:field] || self.class.by_star_field
      conds = options[:conds]
      self.class.where("#{conds} #{field} < ?", self.send(field)).reorder("#{field} DESC").first
    end

    def next(options={})
      field = options[:field] || self.class.by_star_field
      conds = options[:conds]
      self.class.where("#{conds} #{field} > ?", self.send(field)).reorder("#{field} ASC").first
    end
  end
end
