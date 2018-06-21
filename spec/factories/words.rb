FactoryBot.define do
  factory :word do
    name { generate(:name) } 

    sequence :name do |n|
      File.read('/usr/share/dict/words').sample.delete("\n")
    end
  end
end
