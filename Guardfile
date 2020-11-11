bundle exec guard init
Writing new Guardfile to /home/ec2-user/environment/sample_app/Guardfile
00:51:32 - INFO - minitest guard added to Guardfile, feel free to edit it
統合テストとビューが更新されたら自動的に適切なテストが実行されるように、生成されたGuardfileを編集します（リスト 3.46）。柔軟性を最大にするため、チュートリアルの参照用アプリケーションに記載されているのと同じバージョンのGuardfileをお使いになることをおすすめします。本チュートリアルをオンラインでお読みの方は、リスト 3.46で正確な書き方を見ることができます。

Guardfileの参照: railstutorial.org/guardfile
リスト 3.46: カスタマイズしたGuardfile
Guardfile
# Guardのマッチング規則を定義
guard :minitest, spring: "bin/rails test", all_on_start: false do
  watch(%r{^test/(.*)/?(.*)_test\.rb$})
  watch('test/test_helper.rb') { 'test' }
  watch('config/routes.rb') { interface_tests }
  watch(%r{app/views/layouts/*}) { interface_tests }
  watch(%r{^app/models/(.*?)\.rb$}) do |matches|
    "test/models/#{matches[1]}_test.rb"
  end
  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
    resource_tests(matches[1])
  end
  watch(%r{^app/views/([^/]*?)/.*\.html\.erb$}) do |matches|
    ["test/controllers/#{matches[1]}_controller_test.rb"] +
    integration_tests(matches[1])
  end
  watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
    integration_tests(matches[1])
  end
  watch('app/views/layouts/application.html.erb') do
    'test/integration/site_layout_test.rb'
  end
  watch('app/helpers/sessions_helper.rb') do
    integration_tests << 'test/helpers/sessions_helper_test.rb'
  end
  watch('app/controllers/sessions_controller.rb') do
    ['test/controllers/sessions_controller_test.rb',
     'test/integration/users_login_test.rb']
  end
  watch('app/controllers/account_activations_controller.rb') do
    'test/integration/users_signup_test.rb'
  end
  watch(%r{app/views/users/*}) do
    resource_tests('users') +
    ['test/integration/microposts_interface_test.rb']
  end
end

# 与えられたリソースに対応する統合テストを返す
def integration_tests(resource = :all)
  if resource == :all
    Dir["test/integration/*"]
  else
    Dir["test/integration/#{resource}_*.rb"]
  end
end

# インターフェースが該当するすべてのテストを返す
def interface_tests
  integration_tests << "test/controllers/"
end

# 与えられたリソースに対応するコントローラのテストを返す
def controller_test(resource)
  "test/controllers/#{resource}_controller_test.rb"
end

# 与えられたリソースに対応するすべてのテストを返す
def resource_tests(resource)
  integration_tests(resource) << controller_test(resource)
end