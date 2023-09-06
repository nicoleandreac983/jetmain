class Maintenance < ApplicationRecord
    belongs_to :engine
    belongs_to :type_maintenance
    belongs_to :material
    belongs_to :town
    belongs_to :user
end
