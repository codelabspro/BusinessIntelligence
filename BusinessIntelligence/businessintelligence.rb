require "./application"
class BusinessIntelligence
    attr_reader :applications
    #---------------------------------------------------------------------
    def initialize
        @applications = []

    end
    #---------------------------------------------------------------------
    def run
        loop do
            puts "Business Intelligence"
            puts "1 : Add an Application"
            puts "2 Search "
            puts "3 : Print Address Book"
            puts "q to Exit"
            print "Enter choice: "
            input = gets.chomp.downcase
            case input
            when 'q'
                break
            when '1'
                add_application
            when '2'
                print "Search term : "
                search = gets.chomp
                find_by_title(search)
                find_by_description(search)
                find_by_component(search)
            when '3'
                puts "Printing Applications"
                print_applications
            end

        end
    end
    #---------------------------------------------------------------------
    def add_application
        application = Application.new
        print "Title : "
        application.title = gets.chomp
        print "Description : "
        application.description = gets.chomp

        loop do
            puts "Add targetdevice or component"
            puts "1 : Add targetdevice"
            puts "2 : Add component"
            puts "3 : To return to previous menu"
            response = gets.chomp.downcase
            case response
            when '1'
                targetdevice = TargetDevice.new
                print "Title"
                targetdevice.title = gets.chomp
                print "Description"
                targetdevice.description = gets.chomp
                print "Version"
                targetdevice.version = gets.chomp
                application.targetdevices.push(targetdevice)
            when '2'
                component = Component.new
                print "Name"
                component.name = gets.chomp
                print "Language"
                component.language = gets.chomp
                print "Vendor"
                component.vendor = gets.chomp
                application.components.push(component)
            else
                print "\n"
                break
            end
        end

        applications.push(application)
    end
    #---------------------------------------------------------------------
    def find_by_title(title)
        results = []
        search = title.downcase
        applications.each do |application|
            if application.title.downcase.include?(search)
                results.push(application)
            end
        end
        print_results("Title search results (#{search})", results)
    end
    #---------------------------------------------------------------------
    def find_by_description(description)
        results = []
        search = description.downcase
        applications.each do |application|
            if application.description.downcase.include?(search)
                results.push(application)
            end
        end
        print_results("Description search results (#{search})", results)
    end
    #---------------------------------------------------------------------
    def find_by_component(query)
        results = []
        search = query.downcase
        applications.each do |application|
            application.components.each do |component|
                if component.to_s('full').downcase.include?(search)
                    results.push(application) unless results.include?(application)
                end
            end
        end
        print_results("Component search results (#{search})",results)
    end
    #---------------------------------------------------------------------
    def print_results(label, results)
        puts label
        puts "--------------------------"
        results.each do |application|
                puts application.to_s('full')
                application.print_targetdevices
                application.print_components
                puts "\n"
        end
    end
    #---------------------------------------------------------------------
    def print_applications
        applications.each do |application|
            puts application.to_s('full')
            puts application.print_targetdevices
            puts application.print_components
        end
    end
end


businessintelligence = BusinessIntelligence.new
businessintelligence.run

# firstApp data
# firstApp = Application.new
# firstApp.title = "FirstApp"
# firstApp.description = "Web application"
# firstApp.version = "1.0"
# firstApp.add_targetdevice("Chrome", "Google's Web Brower")
# firstApp.add_targetdevice("Firefox", "Firefox Web Brower")
# firstApp.add_component("GAE", "Java", "Google")
# businessintelligence.applications.push(firstApp)
# secondApp data
# secondApp = Application.new
# secondApp.title = "SecondApp"
# secondApp.description = "Game for TV"
# secondApp.version = "2.0"
# secondApp.add_targetdevice("Apple TV", "Apple's 3rd generation Apple TV")
# secondApp.add_component("AWS", "Python", "Amazon" )
# businessintelligence.applications.push(secondApp)
# puts "--------------------------"
# businessintelligence.print_applications
# businessintelligence.find_by_title("second")
# businessintelligence.find_by_description("game")
# businessintelligence.find_by_component("gae")
# puts "--------------------------"
