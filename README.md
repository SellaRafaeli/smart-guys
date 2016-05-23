## Setup

1. $ git clone git@github.com:SellaRafaeli/tech_blog.git
2. $ git checkout gh-pages
3. $ gem install kramdown # ruby gem for .md -> .html
4. $ ruby build.rb #generate .html from each .md. 

That's it, now fire up some static file server and access localhost:8000 or localhost:8000/posts/js/node_article(.html), etc. 

## Notes:

1. I recommend setting up a watcher to monitor all .md files and run 'ruby build.rb' whenever any .md file changes. But you can just run it yourself when you're down markdowning. 
2. We can modify build.rb to auto-generate indexes (lists of articles) although in my experience that is not worth the effort (manually updating indexes is fine).
3. Modify the generated HTML in build.rb, the CSS is in main.css. 
