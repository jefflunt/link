class Url < ApplicationRecord
  validates :dest,
            presence: true

  validates :dest,
            length: {
              minimum: 10,    # 'http://a.a'
              maximum: 2048
            }

  before_create :_generate_code

  def full_dest_url
    "#{LinkConfig::PREFIX}/#{code}"
  end

  def _generate_code
    characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    self.code = (0...8).map { characters.sample }.join
  end
end
