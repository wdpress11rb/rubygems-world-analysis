class RecursiveOpenStruct < OpenStruct
  def new_ostruct_member(name)
    name = name.to_sym
    unless self.respond_to?(name)
      class << self; self; end.class_eval do
        define_method(name) {
          v = @table[name]
          case v
          when Hash
            RecursiveOpenStruct.new(v)
          when Array
            v.map {|vv| vv.is_a?(Hash) ? RecursiveOpenStruct.new(vv) : vv }
          else
            v
          end
        }
        define_method("#{name}=") {|x| modifiable[name] = x }
        define_method("#{name}_as_a_hash") { @table[name] }
      end
    end
  end
end
