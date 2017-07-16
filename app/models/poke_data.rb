class PokeData < ActiveJSON::Base
  set_root_path Rails.root.join('db/fixtures')
  set_filename 'poke_data'

  #include ActiveHash::Associations
  #has_many :hoge
end
