CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIO3MEEWD76OD5BXA',       # required
      :aws_secret_access_key  => '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',  # required
=begin
      :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
      :host                   => 's3.example.com',             # optional, defaults to nil
      :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
=end
    }
    config.fog_directory  = 'recipeonrails'                     # required
    config.fog_public     = true                                   # optional, defaults to true
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end
