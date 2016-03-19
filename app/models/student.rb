class Student < ActiveRecord::Base
  validates :first_name, :last_name, :email, :cell_phone, :home_phone, :work_phone, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: 'Only allows letters' }
  validates :email, inclusion: { in: %w(@),
            message: 'Not a valid email address' }
end
