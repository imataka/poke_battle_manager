class PokeData < ActiveJSON::Base
  set_root_path Rails.root.join('db/fixtures')
  set_filename 'poke_data'

  #include ActiveHash::Associations
  #has_many :hoge
  
  # app/assets/images/`dex`.png が欲しい画像ファイルの名前なので，
  # nameでPokeDataを検索してdexを取ってくる
  def self.imgpath_from_name(name)
    "#{self.find_by(name: name).dex}.png"
  end

  def self.all_names
    self.all.map { |i| i.name }
  end
end
