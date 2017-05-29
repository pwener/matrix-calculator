Rails.application.routes.draw do
  post 'repository/pair_in/:index/:content' => 'repository#pair_in'
  get  'repository/read_pair/:index' => 'repository#read_pair'
end
