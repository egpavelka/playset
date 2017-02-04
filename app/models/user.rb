class User < ApplicationRecord
  before_save { email.downcase! }

  # Name must be between 5 and 51 characters and can contain upper and lowercase letters, spaces, periods (for initials), and hyphens (for combined last names). Must begin and end with a letter.
  VALID_NAME_REGEX = /\A[a-zA-Z]+[a-zA-Z\s\.-]*[a-zA-Z]+\z/

  validates :name,
  presence: true,
  length: { in: 5..51 },
  format: { with: VALID_NAME_REGEX }

  # Email according to standard rules; uppercase letters are allowed, but are converted to lowercase before saving. Length check is separate test.
  VALID_EMAIL_REGEX = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
  presence: true,
  length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

# Username must be between 5 and 22 characters, must contain at least one letter, and is restricted to lowercase letters, digits, periods, and underscores.
  VALID_USERNAME_REGEX = /\A(?=.*[a-z])+(?!.*([.][.]))[a-z\d\_.]*[a-z\d\_]+\z/

  validates :username,
  presence: true,
  length: { in: 6..22 },
  format: { with: VALID_USERNAME_REGEX },
  uniqueness: { case_sensitive: false }

  # Password must be between 6 and 72 (implicit) characters, must contain one uppercase letter, one lowercase letter, one number, and is not restricted to a set of characters.
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/

  validates :password,
  presence: true,
  length: { minimum: 6 }
  # format: { with: VALID_PASSWORD_REGEX }

  has_secure_password

end
