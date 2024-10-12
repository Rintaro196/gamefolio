class SearchGameForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :title, :string

    validates :title, presence: true, length: { maximum: 255 }
end
