Rails.application.routes.draw do
  post 'repository/pair_in/:index/:content' => 'repository#pair_in'
  get  'repository/pair_out/' => 'repository#pair_out'
  get  'repository/read_pair/:index' => 'repository#read_pair'
  get  'repository/read_all' => 'repository#read_all'
end
