require 'rails_helper'

RSpec.describe "ジャンケン結果を記録する旅行選択実施", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:user)
    @user4 = FactoryBot.create(:user)
    @group_name = Faker::Company.name[1..10]
    @travel_name = Gimei.town.kanji
  end

  context 'ジャンケン結果を記録する旅行登録ができるとき'do
    it 'ログイン、男気グループ作成、旅行計画作成を正常に行えたユーザーは旅行選択ができる' do
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
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # トップページに先ほど登録した旅行名が存在することを確認する（テキスト）
      expect(find_by_id('travel_select')).to have_content(@travel_name)
    end
  end

  context 'ジャンケン結果を記録する旅行登録ができないとき'do
    it 'ログインしていないとジャンケン結果を記録する旅行登録ができない' do
      # トップページに遷移する
      visit root_path
      # グループ作成ページへのリンクがないことを確認する
      expect(page).to have_no_content('③ジャンケン結果を記録する旅行選択')
    end
    it 'ログインはしたが、グループを作成しないとユーザーは旅行選択ができず、グループ作成ページにリダイレクトすることを確認する' do
      # ログインする
      visit root_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('■ログアウト')
      # 旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
      # 旅行選択ページに移動する
      visit new_travel_select_path
      # 旅行選択ページに存在すべきテキストがないことを確認する
      expect(page).to have_no_content('【必須】旅行選択')
      # グループ作成ページに存在するテキストがあることを確認する
      expect(page).to have_content('【必須】グループ')
    end
    it 'ログイン及びグループを作成は行ったが、旅行計画は作成していない為、ユーザーは旅行選択ができず、旅行計画作成ページにリダイレクトすることを確認する' do
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
      # 旅行選択ページへのリンクがあることを確認する
      expect(page).to have_content('③ジャンケン結果を記録する旅行選択')
      # 旅行選択ページに移動する
      visit new_travel_select_path
      # 旅行選択ページに存在すべきテキストがないことを確認する
      expect(page).to have_no_content('【必須】旅行選択')
      # 旅行作成ページに存在するテキストがあることを確認する
      expect(page).to have_content('【必須】旅行名')
    end
    it '旅行選択ページで旅行を選択しない場合、旅行選択登録ができない' do
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
      # 旅行名を選択しない
      # 登録するボタンを押すとモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { TravelSelect.count }.by(0)
      # 旅行選択ページに留まることを確認する
      expect(current_path).to eq(new_travel_select_path)
      # 【必須】グループ名が表示されていることを確認する
      expect(page).to have_content('【必須】旅行選択')
      # トップページに存在するログアウトボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログアウト')
    end
  end

end