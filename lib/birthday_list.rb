class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = {}
  end

  def store(name, birthday)
    @birthdays[name] = birthday
  end

  def show
    @birthdays.each { |name, birthday| 
    puts "#{birthday}: #{name}" }
  end

  def check(date=(Time.new).strftime("%d/%m"))
    @birthdays.each do |name, birthday|
      age = (Time.new).strftime("%Y").to_i - birthday[-4..-1].to_i
      if birthday.start_with?(date) 
        puts <<~HEREDOC
          It's #{name}'s birthday today.
          They are #{age} years old.
        HEREDOC
      end
    end
  end

end

list = BirthdayList.new
list.store("alex", "09/09/1980")
list.store("louis", "27/10/1981")
list.show
list.check
