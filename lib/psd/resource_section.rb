class PSD
  class Resource
    class Section
      def self.factory(file, resource)
        Section.constants.each do |c|
          section = Section.const_get(c)
          next unless section.id == resource.id

          begin
            section.new(file, resource).parse
            return section.name
          rescue Exception
            return nil
          end
        end

        return nil
      end

      def initialize(file, resource)
        @file = file
        @resource = resource
      end
    end
  end
end