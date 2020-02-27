# frozen_string_literal: true

require 'active_record'

module RailsScopy
  def self.included(base)
    base.extend(ClassMethods)
    base.perform
  end

  module ClassMethods
    def perform
      return if abstract_class?
      columns.each do |column|
        name = column.name
        perform_order(name)
        perform_base(name)
        method = "perform_#{column.type}"
        valid = respond_to?(method, :include_private)
        send(method, name) if valid
      end
    end

    private

    def perform_order(name)
      scope :"ascend_by_#{name}", -> { order(name => :asc) }
      scope :"descend_by_#{name}", -> { order(name => :desc) }
    end

    def perform_base(name)
      scope("#{name}_eq", ->(value) { where(name => value) })
      scope("#{name}_not_eq", ->(value) { where.not(name => value) })
      scope("#{name}_null", -> { where(name => nil) })
      scope("#{name}_not_null", -> { where.not(name => nil) })
      scope("#{name}_present", -> { where("#{name} IS NOT NULL AND #{name} != ''") })
      scope("#{name}_blank", -> { where("#{name} IS NULL OR #{name} = ''") })
    end

    def perform_numeric(name)
      scope :"#{name}_to", ->(value) { where("#{name} <= ?", value) }
      scope :"#{name}_from", ->(value) { where("#{name} >= ?", value) }
      scope :"#{name}_above", ->(value) { where("#{name} > ?", value) }
      scope :"#{name}_below", ->(value) { where("#{name} < ?", value) }
      scope :"#{name}_between", ->(from, to) { where("#{name} BETWEEN ? AND ?", from, to) }
    end

    def perform_integer(name)
      perform_numeric(name)
    end

    def perform_float(name)
      perform_numeric(name)
      scope :"#{name}_scale", ->(value) { where("SCALE(#{name}) = ?", value) }
    end

    def perform_string(name)
      scope :"#{name}_contains", ->(value) { where("#{name} LIKE ?", "%#{sanitize_sql_like(value)}%") }
      scope :"#{name}_not_contains", ->(value) { where("#{name} NOT LIKE ?", "%#{sanitize_sql_like(value)}%") }
      scope :"#{name}_starts_with", ->(value) { where("#{name} LIKE ?", "#{sanitize_sql_like(value)}%") }
      scope :"#{name}_not_starts_with", ->(value) { where("#{name} NOT LIKE ?", "#{sanitize_sql_like(value)}%") }
      scope :"#{name}_ends_with", ->(value) { where("#{name} LIKE ?", "%#{sanitize_sql_like(value)}") }
      scope :"#{name}_not_ends_with", ->(value) { where("#{name} NOT LIKE ?", "%#{sanitize_sql_like(value)}") }
      scope :"#{name}_length", ->(value) { where("LENGTH(#{name}) = ?", value) }
      scope :"#{name}_between_length", ->(from, to) { where("LENGTH(#{name}) BETWEEN ? AND ?", from, to) }
    end
    alias_method :perform_text, :perform_string

    def perform_datetime(name)
      scope :"#{name}_to", ->(value) { where("#{name} <= ?", value) }
      scope :"#{name}_from", ->(value) { where("#{name} >= ?", value) }
      scope :"#{name}_after", ->(value) { where("#{name} > ?", value) }
      scope :"#{name}_before", ->(value) { where("#{name} < ?", value) }
      scope :"#{name}_between", ->(from, to) { where("#{name} BETWEEN ? AND ?", from, to) }
    end
    alias_method :perform_date, :perform_datetime
    alias_method :perform_time, :perform_datetime

    def perform_boolean(name)
      scope :"not_#{name}", -> { where(name => false) }
      scope :"#{name}", -> { where(name => true) }
    end

    def perform_json(name)
      scope :"#{name}_has_key", ->(value) { where("(#{name} #>'{#{value}}') IS NOT NULL") }
      scope :"#{name}_has_not_key", ->(value) { where("(#{name} #>'{#{value}}') IS NULL") }
    end
  end
end