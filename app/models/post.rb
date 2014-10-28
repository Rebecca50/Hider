require "xmlsimple"

class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :comments

  def self.import_posts
    doc = XmlSimple.xml_in("lib/xml/import.xml")
    if doc
      user=User.first #-- change this to specific logic using user roles

      doc["channel"][0]["item"].each do |item|
        if item["post_type"]==["post"]
          print "--- Processing post ---\n"
          begin
           if Post.create(user_id: user.id, body:item["encoded"][0].gsub("\n","<br/>"), title:item["title"][0], created_at:item["pubDate"][0].to_time )
            print " Title: #{item["title"][0]} \n"
            print " Date: #{item["pubDate"][0]} \n"
            print " Content: #{item["encoded"][0]} \n"
            print "-------\n"
           else
            print " -- ERROR importing post... \n"
           end
         rescue
            print " -- (!) ERROR importing post... \n"
         end
       end
      end
    end
  end
end
