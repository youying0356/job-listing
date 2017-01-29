# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


company_info= [["Apple Inc.","Cupertino, CA, US"] ,["Samsung Electronics","Suwon, South Korea"] ,
 ["Amazon.com","Seattle, WA, US"] ,["HP Inc. + HPE","Palo Alto, CA, US"] ,["Microsoft","Redmond, WA, US"] ,
 ["IBM","Armonk, NY, US"] ,["Alphabet Inc.","Mountain View, CA, US"] ,["Dell Technologies","Austin, TX, US"] ,
 ["Huawei","Shenzhen, China"]]

jobs_info = [["Web Application Developer","Creates, maintains and implements web-based application systems. Resolves issues and recommends enhancements, when necessary. Has knowledge of HTML, Java and related concepts. Relies on knowledge and professional discretion to plan and accomplish goals. Usually reports to a department head. Significant ingenuity and flexibility is expected. May require a bachelor’s degree in a related area and at least 2-4 years of relevant experience."
],[ "Android Developer","Designs and builds applications for the Android platform. Works with outside data sources and API’s. Fixes bugs and improves application performance. Collaborates with cross-functional teams to determine and launch new features. Should have knowledge of core web technologies (HTML5, CSS3, JavaScript). Requires a bachelor’s degree in area of specialty and 2 years of relevant experience."
],["iOS Developer","Designs and builds applications for the iOS platform. Works with outside data sources and API’s. Fixes bugs and improves application performance. Collaborates with cross-functional teams to determine and launch new features. Should have knowledge of core web technologies (HTML5, CSS3, JavaScript). Requires a bachelor’s degree in area of specialty and 2 years of relevant experience."
],["Interface Designer","Create interfaces for a variety of web-based applications. Designs and evaluates visual human interfaces utilizing user-centric design principles. Works with the product development team to achieve desired user experience. Ensures that interfaces function to achieve desired business goals. Relies on established guidelines and instructions to perform daily job functions. Works under immediate supervision and usually reports to a supervisor. May require an associate’s degree with 0-2 years of relevant experience."
],["Webmaster","Manages an organization’s overall web presence. Monitors web traffic and ensures website is prepared to meet traffic demands and performance expectations. Leads the development and design of the website to enhance appearance and usability. Requires a working knowledge of HTML, JavaScript and SQL. Relies on knowledge and professional discretion to plan and accomplish goals. Works under general supervision and usually reports to a supervisor, though some ingenuity and flexibility is required. May require a bachelor’s degree and 2-4 years of experience."
]]

puts "這個種子檔會自動建立一個admin帳號, 並且創建 30 個 public jobs, 以及30個hidden jobs"


create_account = User.create([email: "yy@sina.com", password:"111111",password_confirmation: "111111",is_admin:"true"])

puts "Admin account created."

create_account_user = User.create([email: "yy@qq.com", password:"222222",password_confirmation: "222222",is_admin:"false"])

puts "User account created."

create_jobs = for i in 1..30 do
	job_test=jobs_info[rand(0..4)]
	company_test=company_info[rand(0..8)]
	Job.create!([title: job_test[0],description: job_test[1], wage_upper_bound: rand(50..99)*100,
		wage_lower_bound: rand(10..49)*100, is_hidden:"false",location:company_test[1],company:company_test[0]])
end

puts "30 Public jobs created."

create_jobs = for i in 1..30 do
	job_test=jobs_info[rand(0..4)]
	company_test=company_info[rand(0..8)]
	Job.create!([title: job_test[0],description: job_test[1], wage_upper_bound: rand(50..99)*100,
		wage_lower_bound: rand(10..49)*100, is_hidden:"true",location:company_test[1],company:company_test[0]])
end

puts "30 Hidden jobs created."
