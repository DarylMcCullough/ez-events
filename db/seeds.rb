    require 'faker'
    # Create Users
    my_email = "user@example.com"
    my_password = "helloworld"
    user = User.find_by email: my_email
    if ! user
        user = User.new(
            email: my_email,
            password: my_password,
            password_confirmation: my_password
        )
        user.confirm
        user.skip_confirmation!
        user.save!
    end
    
    5.times do
        app_name = ""
        until app_name.length >= 5
            app_name = Faker::App.unique.name
        end
        app = RegisteredApplication.new(
            name: app_name,
            url: Faker::Internet.unique.url,
            user: user
        )
        app.save!
    end
    
    apps = RegisteredApplication.all
    
    
    event_names = Array.new
    10.times do
        name = ""
        until name.length >= 5
            name = Faker::Lorem.unique.word
        end
        event_names.push(name)
    end
    
    150.times do
        name = event_names.sample
        app = apps.sample
        event = Event.new(
            name: name,
            registered_application: app
        )
        event.created_at = Faker::Time.between(10.days.ago, Date.today, :all)
        event.save!
    end
    
    puts "Seed finished"
    puts "#{User.count} users created"
    puts "#{RegisteredApplication.count} registered applications created"
    puts "#{event_names.length} different event names created"
    puts "#{Event.count} events created"
    
    