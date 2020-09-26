class AlertSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :message, :alertable_id, :alertable_type, :alertable_information
  # has_one :user

  def alertable_information
    object.alertable
  end

end
