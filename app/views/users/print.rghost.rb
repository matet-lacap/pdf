RGhost::Document.new :paper => :A4 do |doc|
 doc.show "Hi this is my RGhost Report"
 doc.next_row
 doc.grid :data => @users do |g|
   g.column :name, :title => "Client name", :align => :center
   g.column :site, :title => "Site url"
   g.column :created_at, :title => "Client since", :format => lambda{|d| d.strftime('%d/%m/%Y')}
 end
end


