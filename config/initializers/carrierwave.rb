CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  elsif Rails.env.development?
    config.storage = :file
    config.enable_processing = true
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIEWTJZAOI4QO5RNA',       # required
      :aws_secret_access_key  => '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',  # required
      :region                 => 'US Standard',                  # optional, defaults to 'us-east-1'
      :host                   => 's3.example.com',             # optional, defaults to nil
      :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'recipes.on.rails'                     # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end
