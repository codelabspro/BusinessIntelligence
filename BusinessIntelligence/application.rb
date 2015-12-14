require "./targetdevice"
require "./component"
class Application
    attr_writer :title, :description, :version
    attr_reader :targetdevices, :components
    def initialize
        @targetdevices = []
        @components = []
    end
    def add_targetdevice(title, description)
        targetdevice = TargetDevice.new
        targetdevice.title = title
        targetdevice.description = description
        targetdevices.push(targetdevice)
    end

    def add_component(name, language, vendor)
        component = Component.new
        component.name = name
        component.language = language
        component.vendor = vendor
        components.push(component)
    end

    def title
        @title
    end

    def description
        @description
    end

    def version
        @version
    end

    def to_s(format='full')
        case format
        when 'full'
            to_string = "#{title} #{description} #{version} "
        when 'partial'
            to_string = "#{title}"
        end
        to_string
    end

    def print_targetdevices
        puts "    - Target Devices : "
        targetdevices.each { |targetdevice| puts "      #{targetdevice}" }
    end

    def print_components
        puts "    - Components : "
        components.each { |component| puts "      #{component.to_s('partial')}" }
    end


end


puts "--------------------------"
firstApp = Application.new
firstApp.title = "First App"
firstApp.description = "Web application"
firstApp.version = "1.0"
firstApp.add_targetdevice("Chrome", "Google's Web Brower")
firstApp.add_targetdevice("Firefox", "Firefox Web Brower")
firstApp.add_component("GAE", "Java", "Google")
puts firstApp.to_s('full')
firstApp.print_targetdevices
firstApp.print_components
# puts firstApp.inspect
puts "--------------------------"
secondApp = Application.new
secondApp.title = "Second App"
secondApp.description = "Game for TV"
secondApp.version = "2.0"
secondApp.add_targetdevice("Apple TV", "Apple's 3rd generation Apple TV")
puts secondApp.to_s('full')
secondApp.print_targetdevices
# puts secondApp.inspect

puts "--------------------------"
