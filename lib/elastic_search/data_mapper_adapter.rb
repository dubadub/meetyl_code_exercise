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
      relation = self
      batch_size = options[:batch_size] || 10
      offset = 0

      records = relation.all(limit: batch_size).to_a

      while records.any?
        records_size = records.size
        offset += batch_size

        yield records

        break if records_size < batch_size

        records = relation.all(offset: offset, limit: batch_size).to_a
      end
    end

    def __transform
      lambda { |model|  { index: { _id: model.id, data: model.__elasticsearch__.as_indexed_json } } }
    end
  end
end

