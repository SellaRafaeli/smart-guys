require 'find'
require 'kramdown'

def wrap_file_in_html(file_path, custom_content = nil)     
   basename = File.basename(file_path, ".html")
   basename = 'Tech Blog' if basename == 'index'
   template = "<html><head> <meta charset='utf-8'> <title>#{basename}</title>"+
                        '<meta name="viewport" content="width=device-width">'+
                        #'<link rel="shortcut icon" href="/favicon_thumb.ico"/>'+
                        '<link href="/css/main.css" rel="stylesheet"></link>'+
                        "</head>"+
                        '<body>'+
                        "<div class='top'><a href='/'>smart-guys.com</a></div>" + 
                        '<article class="markdown-body">'+                       
                        "#{custom_content || File.read(file_path)}"+
                        '</article>'+
                        "<footer><a href='/'>© smart_guys.com, 2016</a></footer></body></html>"
   File.write(file_path,template)
end

#1. Find all Markdown files
md_file_paths = Find.find('.').to_a.select {|f| f =~ /.*\.md$/ }

#2. Turn each of them into an HTML file with same name in same place. 
md_file_paths.each do |path|
  html_path = path.sub('.md','.html')
  puts "generating #{path} into #{html_path}..."
  text = File.read(path)
  File.write(html_path, Kramdown::Document.new(text, input: 'GFM', coderay_line_numbers: nil).to_html)      ## use Kramdown to parse Github-flavored-markdown (GFM)
  wrap_file_in_html(html_path)    
end

puts "Done!"
  