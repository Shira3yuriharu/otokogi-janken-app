require 'rails_helper'

RSpec.describe "男気グループ作成", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:user)
    @user4 = FactoryBot.create(:user)
    @group_name = Faker::Company.name
  end
  context '男気グループ作成ができるとき'do
    it 'ログインしたユーザーはグループメンバーを本人以外3人選択した場合、男気グループ作成ができる' do
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
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # トップページに先ほど登録したグループ名が存在することを確認する（テキスト）
      expect(page).to have_content(@group_name)
    end
    it 'ログインしたユーザーはグループメンバーを本人以外選択しなくても男気グループ作成ができる' do
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
      # グループメンバーを選択しない
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # トップページに先ほど登録したグループ名が存在することを確認する（テキスト）
      expect(page).to have_content(@group_name)
    end
    it 'ログインしたユーザーはグループメンバーを本人以外１人だけ選択した場合でも男気グループ作成ができる' do
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
      # グループメンバーを1人選択する
      select @user2.nickname, from: 'select_box1'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # トップページに先ほど登録したグループ名が存在することを確認する（テキスト）
      expect(page).to have_content(@group_name)
    end
    it 'ログインしたユーザーはグループメンバーを本人以外2人だけ選択した場合でも男気グループ作成ができる' do
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
      # グループメンバーを2人選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      # Create Groupボタンを押すとGroupモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('■ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログイン')
      expect(page).to have_no_content('■新規登録')
      # トップページに先ほど登録したグループ名が存在することを確認する（テキスト）
      expect(page).to have_content(@group_name)
    end
  end

  context 'グループ作成ができないとき'do
    it 'ログインしていないと男気グループ作成ができない' do
      # トップページに遷移する
      visit root_path
      # グループ作成ページへのリンクがない
      expect(page).to have_no_content('①グループ作成')
    end
    it 'グループ名称を入力しないと男気グループ作成ができない' do
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
      fill_in 'group_name', with: ''
      # グループメンバーを選択する
      select @user2.nickname, from: 'select_box1'
      select @user3.nickname, from: 'select_box2'
      select @user4.nickname, from: 'select_box3'
      # Create Groupボタンを押すとGroupモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Group.count }.by(0)
      # グループ作成ページに留まることを確認する
      expect(current_path).to eq(groups_path)
      # 【必須】グループ名が表示されていることを確認する
      expect(page).to have_content('【必須】グループ名')
      # トップページに存在するログアウトボタンが表示されていないことを確認する
      expect(page).to have_no_content('■ログアウト')
    end
  end

end