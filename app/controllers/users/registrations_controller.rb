class Users::RegistrationsController < Devise::RegistrationsController
  def create
    binding.pry
    super do                                             # 他はdeviseの機能をそのまま流用する
      resource.skip_confirmation!
      # resource.save
      # resource.update(confirmed_at: Time .now.utc)       # skip
      binding.pry
    end
  end
end