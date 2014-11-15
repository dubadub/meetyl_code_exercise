class Comment

  include DataMapper::Resource

  # Attributes
  property :id, Serial
  property :text, Text

  # Relations
  belongs_to :picture
end
