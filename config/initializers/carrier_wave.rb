if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = "fog/aws" #←ここを追記
    config.fog_credentials = {
      :provider => "AWS",
      :region => ENV["region=ap-northeast-1"],
      :aws_access_key_id => ENV["AKIAX4AEDLC2O3Y475JN"],
      :aws_secret_access_key => ENV["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"],
    }
    config.fog_directory = ENV["tokki-design"]
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
