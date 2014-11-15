module ElasticSearch::DataMapperAdapter


  # Register the adaptere
  Elasticsearch::Model::Adapter.register(
    self,
    lambda { |klass| defined?(::DataMapper::Resource) && klass.ancestors.include?(::DataMapper::Resource) }
  )

  module Records
    def records
      klass.all(id: ids)
    end
  end

  module Callbacks
    def self.included(base)
      base.after(:create) { |document| document.__elasticsearch__.index_document }
      base.after(:update)  { |document| document.__elasticsearch__.index_document }
      base.after(:destroy) { |document| document.__elasticsearch__.delete_document }
    end
  end

  module Importing
    def __find_in_batches(options={}, &block)
      # TODO write actual batches implementation
      yield all
    end

    def __transform
      lambda { |model|  { index: { _id: model.id, data: model.__elasticsearch__.as_indexed_json } } }
    end
  end
end

