Rails.application.routes.draw do
  post 'repository/pair_in/:key/:content' => 'repository#pair_in'
  get  'repository/pair_out/:key' => 'repository#pair_out'
  get  'repository/read_pair/:key' => 'repository#read_pair'
  get  'repository/read_all' => 'repository#read_all'
  get  'repository/reset' => 'repository#reset'
end
