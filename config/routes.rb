Rails.application.routes.draw do

  get 'info/refs' => 'git#info_refs'
  get 'HEAD' => 'git#head'
  get 'objects/*hash' => 'git#objects'

end
