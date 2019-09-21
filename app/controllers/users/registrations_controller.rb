class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do                                             # 他はdeviseの機能をそのまま流用する
      # resource.skip_confirmation!
      # resource.save
      resource.update(confirmed_at: Time .now.utc)       # skip
    end
  end
end