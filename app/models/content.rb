class Content < ApplicationRecord

    belongs_to :lesson

    enum data_type: [:heading, :paragraph, :image]

    def self.data_types
        ["heading", "paragraph", "image"]
    end

end
