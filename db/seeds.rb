afc = UserData::Company.new(name: 'American Financing Corporation')
aha = UserData::Company.new(name: 'American Home Agents')

afc.save
aha.save

it = afc.departments.create(name: 'IT', description: 'Information Technology - Help desk and technical support staff')
helpdesk = it.teams.create(name: 'Helpdesk', description: 'Technical support')
devs = it.teams.create(name: 'Developers', description: 'Software Developers / Programmers')

devs.users.create(first_name: 'Daniel', last_name: 'Hanson', email: 'dan.hanson@americanfinancing.net')