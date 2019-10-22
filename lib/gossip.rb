require 'csv'

class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
  
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    
    return all_gossips
  end
  
  def self.find(id)
    
    CSV.foreach("./db/gossip.csv").with_index do |row, i|
      if i + 1 == id.to_i
        row << i + 1
        return row
      end
    end
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def update(id)
    CSV.open("./db/gossip.csv", "ab") do |csv|
    end
  end
end