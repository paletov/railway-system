require 'datamappify'
require 'edge'
require 'route_validator'

class Route
  include Datamappify::Entity

  attribute :id, Integer
  attribute :name, String
  attribute :company_name, String
  attribute :is_deleted, Boolean, :default => false

  has_many :edges, :via => Edge

  validate :instance_validations

  def instance_validations
    validates_with RouteValidator
  end
end
