class Picture

  include DataMapper::Resource
  include DataMapper::Validate
  include Paperclip::Resource

  # Attributes
  property :id, Serial

  property :title, String
  property :description, Text

  has_attached_file :file,
    styles: { full: '500x300>', medium: '300x200>', thumb: '100x100#' }

  # Relations
  has n, :comments

  # Validations
  validates_presence_of :title, :description
  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/

end
