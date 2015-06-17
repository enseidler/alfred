require 'spec_helper'

describe Assignment do

	subject { Assignment.new }

  it { should respond_to( :course ) }
  it { should respond_to( :assignment_file ) }
  it { should respond_to( :solutions ) }
  it { should respond_to( :name ) }
  it { should respond_to( :deadline ) }
  it { should respond_to( :test_script ) }
  it { should respond_to( :is_optional ) }
  it { should respond_to( :is_blocking ) }
  it { should respond_to( :solution_type ) }
  it { should respond_to( :public_template ) }
  it { should respond_to( :private_template ) }
  it { should respond_to( :is_optional_mie ) }
  it { should respond_to( :is_optional_jt ) }
  it { should respond_to( :is_optional_jn ) }


  describe 'initialize' do
    
    it 'is_optional should be false' do
      subject.is_optional.should be_false
    end
    
    it 'is_optional_mie should be false' do
      subject.is_optional_mie.should be_false
    end

  end

end
