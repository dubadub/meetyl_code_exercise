require 'elastic_search/data_mapper_adapter'
require 'dm-serializer'

class Comment

  include DataMapper::Resource
  include Elasticsearch::Model
  include ActiveModel::Serializers::JSON
  include Elasticsearch::Model::Callbacks

  # Attributes
  property :id,   Serial
  property :text, Text

  # Relations
  belongs_to :picture

  # Delegations
  delegate :title, :description, to: :picture, prefix: true

  # Methods
  def as_indexed_json(options = {})
    as_json(
      methods: [:text, :picture_id, :picture_title, :picture_description]
    )
  end

  # Class methods
  def self.where_picture_id(picture_id)
    search_results do
      {
        query: {
          filtered: {
            filter: { term: { picture_id: picture_id } }
          }
        }
      }
    end
  end

  def self.search_results(&blk)
    search(blk.call).results
  end

  private


end
