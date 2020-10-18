class Lead < ApplicationRecord
  # Includes

  # Atributes

  # Associations

  # Delegates

  # Constants

  # Validations

  # Scopes
  
  # Callbacks
  before_save :check_for_changes

  # Constants Methods

  # Default
  
  private

  def check_for_changes
    return self.is_valid = true if zip_code.present?
    
    self.is_valid = false
  end
end
