FactoryBot.define do
  factory :user do
    nickname              {"阿部ちゃん"}
    email                 {"kkk@gmail.com"}
    password              {"000000aa"}
    password_confirmation {"000000aa"}
    firstname             {"阿部"}
    lastname              {"喜之"}
    firstname_kana        {"アベ"}
    lastname_kana         {"ヨシユキ"}
    birthday              {"1988/5/12"}
  end
end
