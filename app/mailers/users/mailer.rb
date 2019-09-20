class Users::Mailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})
    binding.pry
    
    if record.unconfirmed_email != nil
      opts[:subject] = "【●●●アプリ】メールアドレス変更手続きを完了してください"
    else
      opts[:subject] = "【●●●アプリ】会員登録完了"
    end

    super
  end

end