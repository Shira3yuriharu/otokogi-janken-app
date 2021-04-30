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
    it 'ログインしたユーザーは男気グループ作成ができる' do
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
      # グループメンバーを選択する
      <select name="japanese_calendar" id="japanese_calendar">
        <option value="0">明治</option>
        <option value="1">大正</option>
        <option value="2">昭和</option>
        <option value="3">平成</option>
      </select>
      # 送信するとTweetモデルのカウントが1上がることを確認する
      # 投稿完了ページに遷移することを確認する
      # 「投稿が完了しました」の文字があることを確認する
      # トップページに遷移する
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      # 新規投稿ページへのリンクがない
    end
  end
end