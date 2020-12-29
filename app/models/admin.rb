# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :surveys
end
