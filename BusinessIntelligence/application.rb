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
