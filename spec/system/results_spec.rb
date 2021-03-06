require 'rails_helper'

RSpec.describe "ジャンケン結果を記録する", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:user)
    @user4 = FactoryBot.create(:user)
    @group_name = Faker::Company.name[1..10]
    @travel_name = Gimei.town.kanji
    @money = Faker::Number.number(digits: 4)
    @money2 = Faker::Number.number(digits: 4)
    @item_category = "食べ物"
    @item_category2 = "飲み物"
    @note = Faker::Food.dish
    @note2 = Faker::Beer.brand
    @image = Rails.root.join('/Users/shira3/Downloads/イラスト屋/pan_kame.png')
    @image2 = Rails.root.join('/Users/shira3/Downloads/イラスト屋/drink_craft_beer_bottle.png')
    
  end

  context 'ジャンケン結果を記録できるとき'do
    it 'ログイン、男気グループ作成、旅行計画作成、旅行選択を正常に行えたユーザーはジャンケン結果記録ができる' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # グループ作成ページへのリンクがあることを確認する
      expect(page).to have_content('①グループ作成')
      # グループ作成ページに移動する
      visit new_group_path
      # グループ名を入力する
      fill_in 'group_name', with: @group_name
      # グループメンバーを３人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # 旅行計画作成ページへのリンクがあることを確認する
      expect(page).to have_content('②旅行計画作成')
      # 旅行計画作成ページに移動する
      visit new_travel_path
      # 旅行名を入力する
      fill_in 'travel_name', with: @travel_name
      # 旅行開始日を選択する
      select Date.today.year, from: 'travel_start_day_1i'
      select Date.today.mon, from: 'travel_start_day_2i'
      select Date.today.mday, from: 'travel_start_day_3i'
      # 旅行終了日を選択する
      select Date.today.year+1, from: 'travel_end_day_1i'
      select Date.today.mon, from: 'travel_end_day_2i'
      select Date.today.mday, from: 'travel_end_day_3i'
      # グループ名を選択する
      select @group_name, from: 'travel_group_id'
      # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Travel.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
      # 旅行選択ページに移動する
      visit new_travel_select_path
      # 旅行名を選択する
      select @travel_name, from: 'travel_select_travel_id'
      # 登録するボタンを押すとモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { TravelSelect.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 男気がある人を選択する
      select @user1.nickname, from: 'result_nickname'
      # 金額を入力する
      fill_in 'result_money', with: @money
      # 品目を選択する
      select @item_category, from: 'result_item_category_id'
      # 備考を入力する
      fill_in 'result_note', with: @note
      # 画像を添付する
      attach_file('result_image', @image, make_visible: true)
      # 登録するボタンを押すとResultモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Result.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # 男気ジャンケンの結果を確認する為、選択した旅行名をクリックする
      click_link '詳細'
      # 登録した金額が表示されることを確認する
      expect(page).to have_content(@money.to_s(:delimited))
    end
  end

  context 'ジャンケン結果を記録でき、編集ができる時'do
    it 'ログイン、男気グループ作成、旅行計画作成、旅行選択、ジャンケン結果記録を正常に行えたユーザーはジャンケン結果の編集が出来る' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # グループ作成ページへのリンクがあることを確認する
      expect(page).to have_content('①グループ作成')
      # グループ作成ページに移動する
      visit new_group_path
      # グループ名を入力する
      fill_in 'group_name', with: @group_name
      # グループメンバーを３人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # 旅行計画作成ページへのリンクがあることを確認する
      expect(page).to have_content('②旅行計画作成')
      # 旅行計画作成ページに移動する
      visit new_travel_path
      # 旅行名を入力する
      fill_in 'travel_name', with: @travel_name
      # 旅行開始日を選択する
      select Date.today.year, from: 'travel_start_day_1i'
      select Date.today.mon, from: 'travel_start_day_2i'
      select Date.today.mday, from: 'travel_start_day_3i'
      # 旅行終了日を選択する
      select Date.today.year+1, from: 'travel_end_day_1i'
      select Date.today.mon, from: 'travel_end_day_2i'
      select Date.today.mday, from: 'travel_end_day_3i'
      # グループ名を選択する
      select @group_name, from: 'travel_group_id'
      # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Travel.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
      # 旅行選択ページに移動する
      visit new_travel_select_path
      # 旅行名を選択する
      select @travel_name, from: 'travel_select_travel_id'
      # 登録するボタンを押すとモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { TravelSelect.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 男気がある人を選択する
      select @user1.nickname, from: 'result_nickname'
      # 金額を入力する
      fill_in 'result_money', with: @money
      # 品目を選択する
      select @item_category, from: 'result_item_category_id'
      # 備考を入力する
      fill_in 'result_note', with: @note
      # 画像を添付する
      attach_file('result_image', @image, make_visible: true)
      # 登録するボタンを押すとResultモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Result.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # 男気ジャンケンの結果を確認する為、選択した旅行名をクリックする
      click_link '詳細'
      # 編集ページに遷移する為、編集をクリックする
      click_link '編集'
      # 男気がある人を選択する
      select @user2.nickname, from: 'result_nickname'
      # 金額を入力する
      fill_in 'result_money', with: @money2
      # 品目を選択する
      select @item_category, from: 'result_item_category_id'
      # 備考を入力する
      fill_in 'result_note', with: @note2
      # 画像を添付する
      attach_file('result_image', @image2, make_visible: true)
      # 登録するボタンを押すとResultモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Result.count }.by(0)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # 男気ジャンケンの結果を確認する為、選択した旅行名をクリックする
      click_link '詳細'
      # 登録した金額が表示されることを確認する
      expect(page).to have_content(@money2.to_s(:delimited))
    end
  end

  context 'ジャンケン結果を記録でき、削除ができる時'do
  it 'ログイン、男気グループ作成、旅行計画作成、旅行選択、ジャンケン結果記録を正常に行えたユーザーはジャンケン結果の削除が出来る' do
    # ログインする
    visit root_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    expect(page).to have_content('■ログアウト')
    # グループ作成ページへのリンクがあることを確認する
    expect(page).to have_content('①グループ作成')
    # グループ作成ページに移動する
    visit new_group_path
    # グループ名を入力する
    fill_in 'group_name', with: @group_name
    # グループメンバーを３人選択する
    select @user2.nickname, from: 'select_box1'
    select @user3.nickname, from: 'select_box2'
    select @user4.nickname, from: 'select_box3'
    # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Group.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # 旅行計画作成ページへのリンクがあることを確認する
    expect(page).to have_content('②旅行計画作成')
    # 旅行計画作成ページに移動する
    visit new_travel_path
    # 旅行名を入力する
    fill_in 'travel_name', with: @travel_name
    # 旅行開始日を選択する
    select Date.today.year, from: 'travel_start_day_1i'
    select Date.today.mon, from: 'travel_start_day_2i'
    select Date.today.mday, from: 'travel_start_day_3i'
    # 旅行終了日を選択する
    select Date.today.year+1, from: 'travel_end_day_1i'
    select Date.today.mon, from: 'travel_end_day_2i'
    select Date.today.mday, from: 'travel_end_day_3i'
    # グループ名を選択する
    select @group_name, from: 'travel_group_id'
    # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Travel.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
    expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
    # 旅行選択ページに移動する
    visit new_travel_select_path
    # 旅行名を選択する
    select @travel_name, from: 'travel_select_travel_id'
    # 登録するボタンを押すとモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { TravelSelect.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
    expect(page).to have_content('■ジャンケン結果記録')
    # ジャンケン結果記録ページに移動する
    visit new_result_path
    # 男気がある人を選択する
    select @user1.nickname, from: 'result_nickname'
    # 金額を入力する
    fill_in 'result_money', with: @money
    # 品目を選択する
    select @item_category, from: 'result_item_category_id'
    # 備考を入力する
    fill_in 'result_note', with: @note
    # 画像を添付する
    attach_file('result_image', @image, make_visible: true)
    # 登録するボタンを押すとResultモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Result.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ログアウトボタンが表示されていることを確認する
    expect(page).to have_content('■ログアウト')
    # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('■ログイン')
    expect(page).to have_no_content('■新規登録')
    # 男気ジャンケンの結果を確認する為、選択した旅行名をクリックする
    click_link '詳細'
    # Resultモデルのカウントが上がらないことを確認する
    expect{
      click_link '削除'
    }.to change { Result.count }.by(-1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ログアウトボタンが表示されていることを確認する
    expect(page).to have_content('■ログアウト')
    # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('■ログイン')
    expect(page).to have_no_content('■新規登録')
    # 男気ジャンケンの結果を確認する為、選択した旅行名をクリックする
    click_link '詳細'
    # 登録した金額が表示されることを確認する
    expect(page).to have_no_content(@money.to_s(:delimited))
  end
end

  context 'ジャンケン結果を記録出来ないとき'do
    it 'ログインしていないとジャンケン結果記録ができない' do
      # トップページに遷移する
      visit root_path
      # ジャンケン結果を記録する旅行選択ページへのリンクがないことを確認する
      expect(page).to have_no_content('■ジャンケン結果記録')
    end
    it 'ログインはしたが、グループを作成しないとジャンケン結果を記録できず、グループ作成ページにリダイレクトすることを確認する' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 男気ジャンケン記録ページに存在すべきテキストがないことを確認する
      expect(page).to have_no_content('【必須】男気を魅せた人')
      # グループ作成ページに存在するテキストがあることを確認する
      expect(page).to have_content('【必須】グループ')
    end
    it 'ログイン及びグループを作成は行ったが、旅行計画は作成していない為、ユーザーはジャンケン結果を記録できず、旅行計画作成ページにリダイレクトすることを確認する' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # グループ作成ページへのリンクがあることを確認する
      expect(page).to have_content('①グループ作成')
      # グループ作成ページに移動する
      visit new_group_path
      # グループ名を入力する
      fill_in 'group_name', with: @group_name
      # グループメンバーを３人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 男気ジャンケン記録ページに存在すべきテキストがないことを確認する
      expect(page).to have_no_content('【必須】男気を魅せた人')
      # 旅行作成ページに存在するテキストがあることを確認する
      expect(page).to have_content('【必須】旅行名')
    end
    it 'ログイン、グループ作成、旅行計画作成か実施したが、旅行選択が実施されていない為、ユーザーはジャンケン結果を記録できず、旅行選択ページにリダイレクトすることを確認する' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # グループ作成ページへのリンクがあることを確認する
      expect(page).to have_content('①グループ作成')
      # グループ作成ページに移動する
      visit new_group_path
      # グループ名を入力する
      fill_in 'group_name', with: @group_name
      # グループメンバーを３人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # 旅行計画作成ページへのリンクがあることを確認する
      expect(page).to have_content('②旅行計画作成')
      # 旅行計画作成ページに移動する
      visit new_travel_path
      # 旅行名を入力する
      fill_in 'travel_name', with: @travel_name
      # 旅行開始日を選択する
      select Date.today.year, from: 'travel_start_day_1i'
      select Date.today.mon, from: 'travel_start_day_2i'
      select Date.today.mday, from: 'travel_start_day_3i'
      # 旅行終了日を選択する
      select Date.today.year+1, from: 'travel_end_day_1i'
      select Date.today.mon, from: 'travel_end_day_2i'
      select Date.today.mday, from: 'travel_end_day_3i'
      # グループ名を選択する
      select @group_name, from: 'travel_group_id'
      # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Travel.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 男気ジャンケン記録ページに存在すべきテキストがないことを確認する
      expect(page).to have_no_content('【必須】男気を魅せた人')
      # 旅行選択ページに存在するテキストがあることを確認する
      expect(page).to have_content('【必須】旅行選択')
    end
    it 'ログイン、男気グループ作成、旅行計画作成、旅行選択を正常に行えたが、ジャンケン結果記録ページで男気がある人を選択しない場合記録登録ができない' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # グループ作成ページへのリンクがあることを確認する
      expect(page).to have_content('①グループ作成')
      # グループ作成ページに移動する
      visit new_group_path
      # グループ名を入力する
      fill_in 'group_name', with: @group_name
      # グループメンバーを３人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # 旅行計画作成ページへのリンクがあることを確認する
      expect(page).to have_content('②旅行計画作成')
      # 旅行計画作成ページに移動する
      visit new_travel_path
      # 旅行名を入力する
      fill_in 'travel_name', with: @travel_name
      # 旅行開始日を選択する
      select Date.today.year, from: 'travel_start_day_1i'
      select Date.today.mon, from: 'travel_start_day_2i'
      select Date.today.mday, from: 'travel_start_day_3i'
      # 旅行終了日を選択する
      select Date.today.year+1, from: 'travel_end_day_1i'
      select Date.today.mon, from: 'travel_end_day_2i'
      select Date.today.mday, from: 'travel_end_day_3i'
      # グループ名を選択する
      select @group_name, from: 'travel_group_id'
      # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Travel.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
      # 旅行選択ページに移動する
      visit new_travel_select_path
      # 旅行名を選択する
      select @travel_name, from: 'travel_select_travel_id'
      # 登録するボタンを押すとモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { TravelSelect.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 金額を入力する
      fill_in 'result_money', with: @money
      # 品目を選択する
      select @item_category, from: 'result_item_category_id'
      # 備考を入力する
      fill_in 'result_note', with: @note
      # 画像を添付する
      attach_file('result_image', @image, make_visible: true)
      # 登録するボタンを押すとResultモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Result.count }.by(0)
      # 記録ページに留まることを確認する
      expect(current_path).to eq(new_result_path)
      # 男気ジャンケン記録ページに存在すべきテキストがあることを確認する
      expect(page).to have_content('【必須】男気を')
      # トップページに存在するログアウトボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログアウト')
    end
    it 'ログイン、男気グループ作成、旅行計画作成、旅行選択を正常に行えたが、ジャンケン結果記録ページで金額の入力がない場合記録登録ができない' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # グループ作成ページへのリンクがあることを確認する
      expect(page).to have_content('①グループ作成')
      # グループ作成ページに移動する
      visit new_group_path
      # グループ名を入力する
      fill_in 'group_name', with: @group_name
      # グループメンバーを３人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # 旅行計画作成ページへのリンクがあることを確認する
      expect(page).to have_content('②旅行計画作成')
      # 旅行計画作成ページに移動する
      visit new_travel_path
      # 旅行名を入力する
      fill_in 'travel_name', with: @travel_name
      # 旅行開始日を選択する
      select Date.today.year, from: 'travel_start_day_1i'
      select Date.today.mon, from: 'travel_start_day_2i'
      select Date.today.mday, from: 'travel_start_day_3i'
      # 旅行終了日を選択する
      select Date.today.year+1, from: 'travel_end_day_1i'
      select Date.today.mon, from: 'travel_end_day_2i'
      select Date.today.mday, from: 'travel_end_day_3i'
      # グループ名を選択する
      select @group_name, from: 'travel_group_id'
      # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Travel.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
      # 旅行選択ページに移動する
      visit new_travel_select_path
      # 旅行名を選択する
      select @travel_name, from: 'travel_select_travel_id'
      # 登録するボタンを押すとモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { TravelSelect.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('■ジャンケン結果記録')
      # ジャンケン結果記録ページに移動する
      visit new_result_path
      # 男気がある人を選択する
      select @user1.nickname, from: 'result_nickname'
      # 品目を選択する
      select @item_category, from: 'result_item_category_id'
      # 備考を入力する
      fill_in 'result_note', with: @note
      # 画像を添付する
      attach_file('result_image', @image, make_visible: true)
      # 登録するボタンを押すとResultモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Result.count }.by(0)
      # 記録ページに留まることを確認する
      expect(current_path).to eq(new_result_path)
      # 男気ジャンケン記録ページに存在すべきテキストがあることを確認する
      expect(page).to have_content('【必須】男気を魅せた')
      # トップページに存在するログアウトボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログアウト')
    end
  end

  context 'ジャンケン結果を記録でき、編集ができない時'do
  it 'ログイン、男気グループ作成、旅行計画作成、旅行選択、ジャンケン結果記録を正常に行えたユーザーはジャンケン結果の編集が出来るが、必要な情報を入力しない場合は更新できない' do
    # ログインする
    visit root_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    expect(page).to have_content('■ログアウト')
    # グループ作成ページへのリンクがあることを確認する
    expect(page).to have_content('①グループ作成')
    # グループ作成ページに移動する
    visit new_group_path
    # グループ名を入力する
    fill_in 'group_name', with: @group_name
    # グループメンバーを３人選択する
    select @user2.nickname, from: 'select_box1'
    select @user3.nickname, from: 'select_box2'
    select @user4.nickname, from: 'select_box3'
    # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Group.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # 旅行計画作成ページへのリンクがあることを確認する
    expect(page).to have_content('②旅行計画作成')
    # 旅行計画作成ページに移動する
    visit new_travel_path
    # 旅行名を入力する
    fill_in 'travel_name', with: @travel_name
    # 旅行開始日を選択する
    select Date.today.year, from: 'travel_start_day_1i'
    select Date.today.mon, from: 'travel_start_day_2i'
    select Date.today.mday, from: 'travel_start_day_3i'
    # 旅行終了日を選択する
    select Date.today.year+1, from: 'travel_end_day_1i'
    select Date.today.mon, from: 'travel_end_day_2i'
    select Date.today.mday, from: 'travel_end_day_3i'
    # グループ名を選択する
    select @group_name, from: 'travel_group_id'
    # 登録するボタンを押すとGroupモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Travel.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
    expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
    # 旅行選択ページに移動する
    visit new_travel_select_path
    # 旅行名を選択する
    select @travel_name, from: 'travel_select_travel_id'
    # 登録するボタンを押すとモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { TravelSelect.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ジャンケン結果を記録する旅行選択ページへのリンクがあることを確認する
    expect(page).to have_content('■ジャンケン結果記録')
    # ジャンケン結果記録ページに移動する
    visit new_result_path
    # 男気がある人を選択する
    select @user1.nickname, from: 'result_nickname'
    # 金額を入力する
    fill_in 'result_money', with: @money
    # 品目を選択する
    select @item_category, from: 'result_item_category_id'
    # 備考を入力する
    fill_in 'result_note', with: @note
    # 画像を添付する
    attach_file('result_image', @image, make_visible: true)
    # 登録するボタンを押すとResultモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Result.count }.by(1)
    # トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    # ログアウトボタンが表示されていることを確認する
    expect(page).to have_content('■ログアウト')
    # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('■ログイン')
    expect(page).to have_no_content('■新規登録')
    # 男気ジャンケンの結果を確認する為、選択した旅行名をクリックする
    click_link '詳細'
    # 編集ページに遷移する為、編集をクリックする
    click_link '編集'
    # 男気がある人を選択する
    select '----', from: 'result_nickname'
    # 金額を入力する
    fill_in 'result_money', with: ''
    # 品目を選択する
    select @item_category, from: 'result_item_category_id'
    # 備考を入力する
    fill_in 'result_note', with: @note2
    # 画像を添付する
    attach_file('result_image', @image2, make_visible: true)
    # 登録するボタンを押すとResultモデルのカウントが上がらないことを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Result.count }.by(0)
    # 編集ページに留まることを確認する。（編集ページに存在すべきテキストがあることを確認）
    expect(page).to have_content('男気ジャンケン編集ページ')
    # トップページに存在するログアウトボタンが表示されていないことを確認する
    expect(page).to have_no_content('■ログアウト')
  end
end

end
