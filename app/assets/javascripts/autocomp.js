var baseurl = "/poke_name_autocomp?term=%QUERY"

var url1 = baseurl

var pokenames = new Bloodhound({

  datumTokenizer: function(d) {return Bloodhound.tokenizers.whitespace([d.name]); }, //d.nameのnameはカラム名
  queryTokenizer: Bloodhound.tokenizers.whitespace,

  remote: {
    url: url1, //上記で定義したurl1を指定
    wildcard: '%QUERY'
  }
});

// 上記で定義したpokenamesの初期化
pokenames.initialize();

jQuery( document ).ready(function( $ ) {
  $('.poke_name_typeahead').typeahead(
    { // #poke_nameは後ほどViewファイルのフォーム部分に付与するid属性名
      hint: true,
      highlight: true,
      minLength: 1,
      limit: 114514
    },
    {
      name: 'name',       // 'name'はカラム名
      displayKey: 'name', // 'name'はカラム名
      source: pokenames.ttAdapter(),
      limit: 114514
    }
  )
});
