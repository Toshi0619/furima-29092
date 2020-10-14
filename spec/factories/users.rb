FactoryBot.define do
  factory :user do
    nickname              {"阿部ちゃん"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    firstname             {"阿部"}
    lastname              {"喜之"}
    firstname_kana        {"アベ"}
    lastname_kana         {"ヨシユキ"}
    birthday              {"1988/5/12"}
  end
end
