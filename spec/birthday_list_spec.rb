# I want a program that I can load in IRB that allows me to
# - Store all of my friends’ birthdays so I can keep track of them list.store
# - See them all at once with their names and birthdays each on a line in a tidy format list.show
# - Check whose birthday it is today - the program can check through the birthdays I have stored and check each one to see if it’s someone’s birthday, and tells me something like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise it won't say anything.
require 'birthday_list'

describe BirthdayList do
let(:list) { BirthdayList.new }

  describe '#store' do
    it 'stores a name and birthday in a list' do
      list.store("name", "birthday")
      expect(list.birthdays).to include({"name" => "birthday"})
    end
  end

  describe '#show' do
    it 'shows a list of names and birthdays' do
      list.store("name", "birthday")
      expect{ list.show }.to output("#{"birthday"}: #{"name"}\n").to_stdout
    end
  end

  describe '#check' do
    it 'returns a name when passed a date' do
      list.store("name", "birthday")
      expect(list.check("birthday")).to eq("name" => "birthday")
    end
  end
end