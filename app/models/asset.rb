class Asset < ApplicationRecord
  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true

  private

  def autosave_associated_records_for_addresses
    self.addresses.each do |address|
      addr = Address.find_or_initialize_by(id: address.id)
      addr.assign_attributes(address.attributes)
      address.marked_for_destruction? ? addr.destroy : addr.save
    end
  end
end
