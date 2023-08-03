# frozen_string_literal: true

# Service to download ftp files from the server
class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method'
  end
end
