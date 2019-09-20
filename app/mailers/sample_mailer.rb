class SampleMailer < ApplicationMailer

  attr_accessor :email,:title,:name

  def sample_mail(email,title,name)                            #仮引数に@付きのインスタンス変数は指定できませんので注意
    binding.pry
    @email = email
    @title = title
    @name  = name
    mail  to: @email,                        #メールの宛先を指定
          subject: "【テストメール】#{@title}" #メールのタイトルを指定
  end
end
