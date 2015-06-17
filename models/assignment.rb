class Assignment
  include DataMapper::Resource

  #Available solution types
  @@FILE = 'file'
  @@LINK = 'link'
  def self.FILE; @@FILE; end
  def self.LINK; @@LINK; end
  def self.solution_types; [Assignment.FILE, Assignment.LINK]; end

  belongs_to :course
  has 1, :assignment_file
  has n, :solutions, :constraint => :protect

  property :id, Serial
  property :name, String
  property :test_script, Text
  property :deadline, DateTime
  property :is_optional, Boolean, :default => false
  property :is_blocking, Boolean, :default => false
  property :solution_type, String, :default => Assignment.FILE

  property :public_template, Text
  property :private_template, Text

  property :is_optional_mie, Boolean, :default => false
  property :is_optional_jt, Boolean, :default => false


  def self.find_by_course (course)
  	Assignment.all(:course => course)
  end
end
