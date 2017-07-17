# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#my_pokes')
    .on 'click', '.edit, .cancel', (event) ->
      # 表示を切り替え
      toggleEditor $(this).closest('.my_poke')

    .on 'ajax:complete', '.edit_my_poke', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      poke_name = response.data.name
      poke_item = response.data.item
      poke_ability = response.data.ability
      $container = $(this).closest('.my_poke')

      # 表示されてる値を更新
      $container.find('.viewer .poke_name').text poke_name
      $container.find('.viewer .poke_item').text poke_item
      $container.find('.viewer .poke_ability').text poke_ability

      # 表示を戻す
      toggleEditor $container

    .on 'ajax:complete', '.delete_my_poke', (event, ajax, status) ->
      # 項目を削除
      $(this).closest('.my_poke').remove()

  $('#new_my_poke')
    .on 'ajax:complete', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      html = response.html
 
      # 画面に追加
      $('#my_pokes').append html

      # フォームを初期化
      $(this)[0].reset()

# 表示モードと編集モードを切り替える。
toggleEditor = ($container) ->
  # 表示、非表示を切り替え
  $container.find('.viewer, .editor').toggle()

  # 編集モードなら、値を戻す
  $nameField = $container.find('.editor .poke_name')
  $itemField = $container.find('.editor .poke_item')
  $abilityField = $container.find('.editor .poke_ability')
  if $abilityField.is(':visible')
    $abilityField
      .val($container.find('.viewer .poke_ability').text().trim())
      .select()
  if $itemField.is(':visible')
    $itemField
      .val($container.find('.viewer .poke_item').text().trim())
      .select()
  if $nameField.is(':visible')
    $nameField
      .val($container.find('.viewer .poke_name').text().trim())
      .select()
