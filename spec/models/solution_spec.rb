require 'spec_helper'

describe Solution do

	before (:all) do
		@solution = Solution.new
	end

	subject { @solution }

	it { should respond_to( :file ) }
	it { should respond_to( :link ) }
	it { should respond_to( :comments ) }
	it { should respond_to( :account ) }
	it { should respond_to( :assignment) }
	it { should respond_to( :correction) }
	it { should respond_to( :test_result) }
	it { should respond_to( :test_output) }

	describe 'register_test_result' do

		it 'should create correction when assigment is optional for student with mie tag' do
			assignment = Assignment.new
			assignment.is_optional_mie = true
			student = Factories::Account.student
			@solution.assignment = assignment
			@solution.account = student
			test_result = :passed
			test_output = 'ok'
			Correction.any_instance.should_receive(:save)
			@solution.register_test_result(test_result, test_output)
		end

	end

	describe 'is_overdue' do
 		context 'solution overdue depends on assignment deadline' do 
		let(:assignment) { double(:id => 1, :name => 'TP', :deadline => DateTime.now) }

			it 'should be overdue when solution was delivered after assignment deadline' do
				@solution.assignment = assignment
				@solution.created_at = DateTime.now+1
				expect(@solution.is_overdue?).to be true
			end

			it 'should not  be overdue when solution was delivered before assignment deadline' do
				@solution.assignment = assignment
				@solution.created_at = DateTime.now-1
				expect(@solution.is_overdue?).to be false
			end
		end
	end
	
	describe 'solution type' do

		it 'should return file type of file solution' do
			assignment = Assignment.new
			assignment.solution_type = Assignment.FILE
			@solution.assignment = assignment
			expect(@solution.type).to eq Assignment.FILE
		end
		
		it 'should return link type of link solution' do
			assignment = Assignment.new
			assignment.solution_type = Assignment.LINK
			@solution.assignment = assignment
			expect(@solution.type).to eq Assignment.LINK
		end

	end
	
end
