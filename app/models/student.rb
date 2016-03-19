class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-zA-Z]+\z/i
      record.errors[attribute] << (options[:message] || 'must contain only characters')
    end
  end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || 'is not an email')
    end
  end
end

class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\(?\d{1,3}\)?[\-]?\d{3}\-\d{4}/i
      record.errors[attribute] << (options[:message] || 'is an invalid format')
    end
  end
end

class Student < ActiveRecord::Base
  validates :first_name, :last_name, presence: true, name: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :cell_phone, :home_phone, :work_phone, presence: true, phone_format: true
end
