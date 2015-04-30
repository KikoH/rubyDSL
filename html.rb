class FancyMarkup
	def initialize
		@indent = 0
	end

	# def html(a={} ,&block)
	# 	puts "<html #{convert(a)}>"
	# 	@indent += 1
	# 	instance_eval(&block) if block_given?
	# 	@indent -= 1
	# 	puts "</html>"
	# end

	# def body(a={}, &block)
	# 	si = " " * @indent
	# 	puts si+ "<body #{convert(a)}>"
	# 	@indent += 1
	# 	instance_eval(&block) if block_given?
	# 	@indent -= 1
	# 	puts si+ "</body>"
	# end

	# def div(value="", a={}, &block)
	# 	si = " " * @indent
	# 	puts si+ "<div #{convert(a)}>"
	# 	puts value
	# 	@indent += 1
	# 	instance_eval(&block) if block_given?
	# 	@indent -= 1
	# 	puts si+ "</div>"
	# end

	# def ul(value="", a={}, &block)
	# 	si = " " * @indent
	# 	puts si+ "<ul #{convert(a)}>"
	# 	puts value
	# 	@indent += 1
	# 	instance_eval(&block) if block_given?
	# 	@indent -= 1
	# 	puts si+ "</ul>"
	# end

	# def li(value="", a={}, &block)
	# 	si = " " * @indent
	# 	puts si+ "<li #{convert(a)}>"
	# 	puts value
	# 	@indent += 1
	# 	instance_eval(&block) if block_given?
	# 	@indent -= 1
	# 	puts si+ "</li>"
	# end



	def convert(i)
		buff = ""
		i.each do |key, value|
			buff << "#{key}=\"#{value}\""
		end
		return buff
	end

	def element(type, args, &block)
		value, a = args
		# puts value.class, a.class
		if args.size == 1
			if value.is_a? Hash
				value = ""
				a = args[0]
			else
				value = args[0]
				a = {}
			end
		elsif args.empty?
			a = {}
			value = args[0]
		end
		si = " " * @indent
		puts si+ "<#{type} #{convert(a)}>"
		print value
		@indent += 1
		instance_eval(&block) if block_given?
		@indent -= 1
		puts si+ "</#{type}>"
	end

	def method_missing(name, *args, &block)
		element(name, args, &block)
		# super unless DELEGATE.include? name
		# ::Kernel.send(name, *args, &block)
	end
end

# FancyMarkup.new.html class: "test" do
# 	body do
# 	end
# end

FancyMarkup.new.html do
	body do
		div id: "container" do
			ul "", class: "pretty" do
				li "item 1", {class: "Active"}
				li "item 2"
			end
		end
	end
end



# FancyMarkup.new.html do
# 	span "u", {} do

# 	end
# end

