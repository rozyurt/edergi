# encoding: utf-8

if Admin.count == 0
	Admin.create(:first_name => 'rauf', :email => 'rozyurt@bil.omu.edu.tr', :password => '123456')
end

if Moderator.count == 0
	Moderator.create(:first_name => 'faruk', :email => 'frkcn@bil.omu.edu.tr', :password => '123456')
end
