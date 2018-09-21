class Content < ApplicationRecord

    belongs_to :lesson

    validates :data, presence: true

    enum data_type: [:heading, :paragraph, :image]

    def self.data_types
        ["heading", "paragraph", "image"]
    end

end
