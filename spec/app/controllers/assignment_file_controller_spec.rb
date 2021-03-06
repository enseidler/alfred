require 'spec_helper'

describe "AssignmentFileController" do
	before do
		teacher = Factories::Account.teacher
		Alfred::App.any_instance.stub(:current_account).and_return(teacher)
	end

	it "should destroy AssignmentFile and delete file from storage" do
		assignment_file = double(AssignmentFile, :path => '/my_files/99')
		AssignmentFile.should_receive(:get).with(99).and_return(assignment_file)
		transaction_double = double
		assignment_file.should_receive(:transaction).and_yield(transaction_double)
		assignment_file.should_receive(:destroy).and_return(true)
		storage_gateway_double = double(Storage::DropboxGateway)
		storage_gateway_double.should_receive(:delete).with('/my_files/99').and_return(true)
		Storage::StorageGateways.should_receive(:get_gateway).and_return(storage_gateway_double)

	  delete "/assignments/1234/assignment_file/destroy/99"
	end

	it "should not delete physical file if DB record fails to be deleted" do
	  assignment_file = double(AssignmentFile, :path => '/my_files/99')
		AssignmentFile.should_receive(:get).with(99).and_return(assignment_file)
		transaction_double = double
		assignment_file.should_receive(:transaction).and_yield(transaction_double)
		assignment_file.should_receive(:destroy).and_return(false)
		Storage::StorageGateways.should_not_receive(:get_gateway)

	  delete "/assignments/1234/assignment_file/destroy/99"
	end

	it "should rollback transaction if physical file deletion fails" do
	  assignment_file = double(AssignmentFile, :path => '/my_files/99')
		AssignmentFile.should_receive(:get).with(99).and_return(assignment_file)
		transaction_double = double
		transaction_double.should_receive(:rollback)
		assignment_file.should_receive(:transaction).and_yield(transaction_double)
		assignment_file.should_receive(:destroy).and_return(true)
		storage_gateway_double = double(Storage::DropboxGateway)
		storage_gateway_double.should_receive(:delete).with('/my_files/99').and_raise(Storage::FileDeleteError.new(double(DropboxError, :message => 'Cannot delete file')))
		Storage::StorageGateways.should_receive(:get_gateway).and_return(storage_gateway_double)

	  delete "/assignments/1234/assignment_file/destroy/99"
	end
end
