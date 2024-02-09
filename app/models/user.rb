class User < ApplicationRecord
  after_destroy :ensure_an_admin_remains

  has_secure_password

  class NoRemainingAdminError < StandardError
  end

  private

    def ensure_an_admin_remains
      raise NoRemainingAdminError.new("Can't delete last user") if User.count.zero?
    end
end
