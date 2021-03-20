if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = "fog/aws" #←ここを追記
    config.fog_credentials = {
      :provider => "AWS",
      :region => ENV["S3_region=ap-northeast-1"],
      :aws_access_key_id => ENV["S3_AKIAX4AEDLC2O3Y475JN"],
      :aws_secret_access_key => ENV["S3_RRxeUtCoM2J5I3QIZ0x28T2nkimcqRWY4JkANiKS"],
    }
    config.fog_directory = ENV["S3_tokki-design"]
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
