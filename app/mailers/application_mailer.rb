class ApplicationMailer < ActionMailer::Base
  # 送信元として表示するメールアドレスと表示名
  default from: "tokkidesign お問い合わせ <tokki2design@gmail.com>"
  layout "mailer"
end
