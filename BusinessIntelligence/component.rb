class Component
    attr_accessor :name, :language, :vendor

    def to_s(format = 'partial')
        component = ''
        case format
        when 'full'
            component += "#{name} - #{language} - #{vendor}"
        when 'partial'
            component += "#{name}"
        end

    end
end
