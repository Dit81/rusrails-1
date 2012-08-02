Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '269459236500088', '199e2c67633e2dbc6f76393104aaf2df'
    # , {:client_options => {:ssl => {:ca_path => %w{c: Programs RailsInstaller cacert.pem}}}}
end