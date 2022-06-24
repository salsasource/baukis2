class StaffEvent < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :member, class_name: "StaffMember", foreign_key: "staff_member_id"
  alias.attributes :occurred_at, :created_at
end
