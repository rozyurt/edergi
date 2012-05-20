# encoding: utf-8   

if Admin.count == 0
	Admin.create(:first_name => 'rauf', :email => 'rozyurt@bil.omu.edu.tr', :password => '123456')
end

