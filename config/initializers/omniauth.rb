Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'VtQe3C2c1kRakf6fc7idA', 'G03StADAlH5mb7OcXeFLg3nAyZm4pCpXvWRkkKmCK74'
  provider :google, '1043003797600.apps.googleusercontent.com', 'O3uZ2gTqTKzgp9J3PL3M4AdG'
  provider :facebook, '371805159614392', 'bf4450c791479af6c8ccf09325398b51'
  provider :vkontakte, '3835066', 'tWPqpZ7u3JtZqbanVyAW'
  provider :odnoklassniki, '',''
end

OAUTH_PROVIDERS = [:twitter, :google, :facebook, :vkontakte, :odnoklassniki]