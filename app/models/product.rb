class Product < ActiveRecord::Base
	# Relations
	belongs_to :user
  has_many :comments, dependent: :destroy

	# Validations
	validates :title, :price, presence: true
	validates :price, numericality: true

  # PaperClip
  has_attached_file :image,:styles => {
    :large => "512x512" ,
    :medium => "200x200" ,
    :small => "168x168",
    :thumb => "40x40",
    :tiny => "32x32"
    },
    :url  => "/images/products/:id-:basename.:style.:extension",
    :path => ":rails_root/public/images/products/:id-:basename.:style.:extension",
    :default_url => :set_default_url

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates_attachment_size :image, :less_than => 10.megabytes

  # Se o usuário não tiver foto carrega esta imagem
  def set_default_url
    "/img/missing.png"
  end

  # Slugable
  def to_param
    "#{id}-#{title.parameterize}"
  end

  # brdinheiro
   usar_como_dinheiro :price

  # Search product
  def self.search(search)
    where('title iLIKE ?', "%#{search}%").limit(100)
  end

end
