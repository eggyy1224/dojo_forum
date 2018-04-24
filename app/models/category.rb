class Category < ApplicationRecord
  validates_presence_of :name, message: "分類名字不能為空"
end
